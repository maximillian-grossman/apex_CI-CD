create or replace package body genai as

    function get_prompt_sql (
        project_id number default 1
    ) return clob is
        l_query          clob;
        l_complete_query clob;
    begin
            -- For the selected GenAI project - get the query that selects data that will be used by the model to create a custom response            
        select
            query
        into l_query
        from
            genai_project
        where
            id = project_id;

        l_complete_query := 'select g.task, g.task_rules, genai_dataset.* 
                from genai_project g, 
                ('
                            || l_query
                            || ' 
                ) genai_dataset
                where g.id = '
                            || project_id;

            -- Return the generated prompt
        return l_complete_query;
    exception
        when others then
            return null;
    end;

    function get_response (
        query_parameter varchar2,
        project_id      number,
        profile_name    varchar2 default 'genai'
    ) return clob is
        v_response clob;
        l_prompt   clob;
        l_response clob;
    begin
            -- Get the prompt from the project + the query parameter
        l_prompt := get_prompt(
            query_parameter => query_parameter,
            project_id      => project_id
        );
            -- Pass the prompt to the model and return the response
        l_response := dbms_cloud_ai.generate(
            prompt       => l_prompt,
            profile_name => profile_name,
            action       => 'chat'
        );

        return l_response;
    exception
        when others then
            return 'Error generating response.'
                   || chr(10)
                   || sqlerrm;
    end;

    function get_prompt (
        query_parameter varchar2,
        project_id      number default 1
    ) return clob is
        l_prompt         clob;
        l_query          clob;
        l_complete_query clob;
    begin
            -- For the selected GenAI project - get the query that selects data that will be used by the model to create a custom response
        l_query := get_prompt_sql(project_id => project_id);

            -- Add to the query the instructions for the task
            -- Structure it as a JSON doc

        l_complete_query := 'select json_serialize(json_object(* returning clob format json) pretty) as prompt
                from
                ('
                            || l_query
                            || ' 
                )';

            -- Generate the prompt
        execute immediate l_complete_query
        into l_prompt
            using query_parameter;

            -- Return the generated prompt
        return l_prompt;
    exception
        when others then
            return 'Error generating prompt.'
                   || chr(10)
                   || l_query
                   || chr(10)
                   || sqlerrm;
    end;

    procedure ask_question (
        question     in out varchar2,
        sqlquery     out clob,
        message      out clob,
        resultset    out sys_refcursor,
        profile_name in varchar2 default 'genai'
    ) is
    begin
            -- Generate the sql for the query
        sqlquery := dbms_cloud_ai.generate(
            prompt       => question,
            profile_name => 'ODA_PROFILE',
            action       => 'narrate'
        );    

            -- Clean up the results. Get rid of new lines and multiple spaces
            /*sqlquery := replace(sqlquery, chr(10), ' ');
            sqlquery := regexp_replace(sqlquery, ' +', ' ');

            OPEN resultset FOR sqlquery;*/

        message := 'success';
    exception
                -- this will pick up a bad sql statement (or a statement that could not be generated)
        when others then
            message := sqlquery;
            sqlquery := null;
            open resultset for 'select ''unable to generate valid sql'' as item from dual';

    end;

end genai;
/


-- sqlcl_snapshot {"hash":"e6e7e4ef3167c59a33ea434beb1d587749c5b50e","type":"PACKAGE_BODY","name":"GENAI","schemaName":"MOVIESTREAM","sxml":""}