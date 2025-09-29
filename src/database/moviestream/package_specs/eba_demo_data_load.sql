create or replace package eba_demo_data_load as
    procedure reset_sample;

    function zip_to_csv (
        p_blob_content in blob,
        p_mime_type    in varchar2
    ) return blob;

    procedure set_file_blob (
        p_blob in blob
    );

    function get_file_blob return blob;

end eba_demo_data_load;
/


-- sqlcl_snapshot {"hash":"38712ce7a650441354e0d2df5661a6fd71a9db0d","type":"PACKAGE_SPEC","name":"EBA_DEMO_DATA_LOAD","schemaName":"MOVIESTREAM","sxml":""}