create or replace package chathistory_pkg is
    procedure prc_add_conversation (
        p_username    varchar2,
        p_started_on  timestamp,
        p_app_session number
    );

    procedure prc_add_prompt (
        p_id          number,
        p_conv_id     number,
        p_prompt      varchar2,
        p_response    varchar2,
        p_asked_on    timestamp,
        p_chathistory varchar2,
        p_references  varchar2
    );

    procedure prc_cr_doc_vectors;

end;
/


-- sqlcl_snapshot {"hash":"a586cf3fb3ce50e4b6af8c5ec868716686f949a9","type":"PACKAGE_SPEC","name":"CHATHISTORY_PKG","schemaName":"MOVIESTREAM","sxml":""}