create or replace package body chathistory_pkg is
---------
    procedure prc_add_conversation (
        p_username    varchar2,
        p_started_on  timestamp,
        p_app_session number
    ) is
        pragma autonomous_transaction;
    begin
        insert into conversations values ( conv_seq.nextval,
                                           p_username,
                                           p_started_on,
                                           p_app_session );

        commit;
    end;
---------
    procedure prc_add_prompt (
        p_id          number,
        p_conv_id     number,
        p_prompt      varchar2,
        p_response    varchar2,
        p_asked_on    timestamp,
        p_chathistory varchar2,
        p_references  varchar2
    ) is
        pragma autonomous_transaction;
    begin
        insert into prompts values ( p_id,
                                     p_conv_id,
                                     p_prompt,
                                     p_response,
                                     p_asked_on,
                                     p_chathistory,
                                     p_references );

        commit;
    end;
---------   
    procedure prc_cr_doc_vectors is
    begin
        insert into legislation_vector
            select
                l.id,
                json_value(c.column_value, '$.chunk_id' returning number)     as chunk_id,
                json_value(c.column_value, '$.chunk_offset' returning number) as chunk_pos,
                json_value(c.column_value, '$.chunk_length' returning number) as chunk_size,
                replace(
                    json_value(c.column_value, '$.chunk_data'),
                    chr(10),
                    ''
                )                                                             as chunk_txt,
                dbms_vector_chain.utl_to_embedding(
                    json_value(c.column_value, '$.chunk_data'),
                    json(
                            '{
            "provider": "OCIGenAI",
            "credential_name": "{oci_cred_from_Task_3_3}",
            "url": "https://inference.generativeai.us-chicago-1.oci.oraclecloud.com/20231130/actions/embedText",
            "model": "cohere.embed-english-v3.0",
            "batch_size":10
            }'
                        )
                )                                                             embed_vector
            from 
    ------- base table ---------
                (
                    select
                        id
                    from
                        legislation
                    where
                        id not in (
                            select
                                id
                            from
                                legislation_vector
                        )
                ) l,
    ------- doc to text query ---------
                (
                    select
                        id,
                        dbms_vector_chain.utl_to_text(l.file_content,
                                                      json(
                                            '{"plaintext":"true","charset":"utf8"}'
                                        )
                        ) file_text
                    from
                        legislation l
                    where
                        id = l.id
                ) t,
    ------- chunking ---------
                dbms_vector_chain.utl_to_chunks(t.file_text,
                                                json(
                                      '{ "by":"words",
           "max":"200",
           "overlap":"0",
           "split":"sentence",
           "language":"american",
           "normalize":"all" }'
                                  )
                ) c
            where
                l.id = t.id;

        commit;
    end;

end;
/


-- sqlcl_snapshot {"hash":"200b701012bb4d993afe6d19812a417ebd19fc32","type":"PACKAGE_BODY","name":"CHATHISTORY_PKG","schemaName":"MOVIESTREAM","sxml":""}