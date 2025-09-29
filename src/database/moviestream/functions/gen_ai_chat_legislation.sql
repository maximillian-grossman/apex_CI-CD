create or replace function gen_ai_chat_legislation (
    p_ai_message in varchar2
) return clob as

    v_gen_ai_endpoint    varchar2(500) := 'https://inference.generativeai.us-chicago-1.oci.oraclecloud.com';
    v_compartment_id     varchar2(4000) := 'ocid1.compartment.oc1..aaaaaaaasa6moe3ldbzpclpex4kftyoyrarii7lispzqm4ueyaxbtxhorhca';
    v_vector_credential  varchar2(100) := 'GENAI_VECTOR';
    v_ociapi_credential  varchar2(100) := 'GENAI_STORAGE';
    v_provider           varchar2(100) := 'OCIGenAI';
    v_text_endpoint      varchar2(100) := '/20231130/actions/embedText';
    v_chat_endpoint      varchar2(100) := '/20231130/actions/chat';
    v_model_embed        varchar2(100) := 'cohere.embed-english-v3.0';
    v_model_query        varchar2(100) := 'cohere.command-r-08-2024';
    ----
    v_resp               dbms_cloud_types.resp;
    v_messages           varchar2(32767);
    v_output             varchar2(32767);
    v_ai_message_vec     vector;
    v_search_query       varchar2(32767);
    v_chunks             varchar2(32767);
    v_response           varchar2(32767);
    v_chathistory_after  varchar2(32767);
    v_chathistory_before varchar2(32767);
    v_session            number;
    v_conv_id            number;
    v_prompt_id          number;
begin
--vectorize the user_question
    select
        dbms_vector.utl_to_embedding(p_ai_message,
                                     json(
                                 '{
        "provider":"'
                                 || v_provider
                                 || '","credential_name":"'
                                 || v_vector_credential
                                 || '","url":"'
                                 || v_gen_ai_endpoint
                                 || v_text_endpoint
                                 || '","model":"'
                                 || v_model_embed
                                 || '"}'
                             )
        )
    into v_ai_message_vec;

    v_messages := '{"message": "';
-- retrieve chunks based on vector distance from input message and append to each other
    for i in (
        select
            l.id,
            l.file_name,
            lv.chunk_id,
            lv.chunk_txt
        from
            legislation_vector lv,
            legislation        l
        where
            l.id = lv.id
        order by
            vector_distance(embed_vector, v_ai_message_vec, cosine)
        fetch first 5 rows only
    ) loop
        v_messages := v_messages
                      || i.chunk_txt
                      || ' ';
        v_chunks := v_chunks
                    || to_char(i.file_name)
                    || ', chunk_id:'
                    || to_char(i.chunk_id)
                    || ',';

    end loop;
-- add the user question
    v_messages := v_messages
                  || ' Question: '
                  || p_ai_message
                  || '"}';
-- remove the trailing comma and newline character
    v_messages := rtrim(v_messages, ',');
    v_chunks := rtrim(v_chunks, ',');
-- locate latest chat and prompt sessions and set current chat history
    select
        max(id)
    into v_conv_id
    from
        conversations;
--
    begin
        select
            max(id)
        into v_prompt_id
        from
            prompts
        where
            conv_id = v_conv_id;

    exception
        when others then
            null;
    end;
--
    begin
        select
            chathistory
        into v_chathistory_before
        from
            prompts
        where
            id = v_prompt_id;

    exception
        when others then
            null;
    end;

    v_resp := dbms_cloud.send_request(
        credential_name => v_ociapi_credential,
        uri             => v_gen_ai_endpoint || v_chat_endpoint,
        method          => dbms_cloud.method_post,
        body            => utl_raw.cast_to_raw(
            json_object(
                'compartmentId' value v_compartment_id,
                        'servingMode' value(
                    json_object(
                        'modelId' value v_model_query,
                        'servingType' value 'ON_DEMAND'
                    )
                ),
                        'chatRequest' value(
                    json_object(
                        'message' value v_messages,
                                'chatHistory' value
                            json(v_chathistory_before),
                                'apiFormat' value 'COHERE',
                                'maxTokens' value 2000,
                                'temperature' value 0.75,
                                'frequencyPenalty' value 0,
                                'presencePenalty' value 0,
                                'topP' value 1.0,
                                'topK' value 0,
                                'isStream' value false
                    )
                )
            )
        )
    );

    v_output := dbms_cloud.get_response_text(v_resp);
    v_response := json_value(v_output, '$.chatResponse.text' returning varchar2);
    v_chathistory_after := json_query(v_output, '$.chatResponse.chatHistory' returning varchar2);
-- update prompts
    chathistory_pkg.prc_add_prompt(prompt_seq.nextval, v_conv_id, p_ai_message, v_response, systimestamp,
                                   v_chathistory_after, v_chunks);
-- show me what you got
    return v_response;
end;
/


-- sqlcl_snapshot {"hash":"1600edcf0fe2b3f1d26088e0786a838e9987b744","type":"FUNCTION","name":"GEN_AI_CHAT_LEGISLATION","schemaName":"MOVIESTREAM","sxml":""}