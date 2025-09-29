create or replace package eba_demo_md_data_pkg as
    function varchar2_to_blob (
        p_varchar2_tab in dbms_sql.varchar2_table
    ) return blob;

    procedure load_sample_data;

    procedure remove_sample_data;

end eba_demo_md_data_pkg;
/


-- sqlcl_snapshot {"hash":"c8a86b2cfd5a23fd071a01e092325b727210e1b9","type":"PACKAGE_SPEC","name":"EBA_DEMO_MD_DATA_PKG","schemaName":"MOVIESTREAM","sxml":""}