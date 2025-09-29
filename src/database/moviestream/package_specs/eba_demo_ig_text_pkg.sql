create or replace package eba_demo_ig_text_pkg authid current_user is
    function text_is_available return boolean;

    procedure create_text_preferences;

    procedure drop_text_preferences;

    procedure create_text_index;

    procedure drop_text_index;

    procedure init_oracle_text;

    function convert_text_query (
        p_enduser_query in varchar2
    ) return varchar2;

end eba_demo_ig_text_pkg;
/


-- sqlcl_snapshot {"hash":"4bf62080ebf9cf7d29e0418d3f691dec06b74e81","type":"PACKAGE_SPEC","name":"EBA_DEMO_IG_TEXT_PKG","schemaName":"MOVIESTREAM","sxml":""}