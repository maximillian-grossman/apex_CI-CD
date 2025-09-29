create or replace package genai as
    function get_response (
        query_parameter varchar2,
        project_id      number,
        profile_name    varchar2 default 'genai'
    ) return clob;

    function get_prompt (
        query_parameter varchar2,
        project_id      number default 1
    ) return clob;

    procedure ask_question (
        question     in out varchar2,
        sqlquery     out clob,
        message      out clob,
        resultset    out sys_refcursor,
        profile_name in varchar2 default 'genai'
    );

end genai;
/


-- sqlcl_snapshot {"hash":"5c4a4c5eae2d23b20802f5960ede57c6e01e1f0b","type":"PACKAGE_SPEC","name":"GENAI","schemaName":"MOVIESTREAM","sxml":""}