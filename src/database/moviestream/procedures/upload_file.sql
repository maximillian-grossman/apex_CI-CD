create or replace procedure upload_file (
    p_file_content       in varchar2,
    p_static_id          in varchar2,
    p_namespace          in varchar2,
    p_bucket             in varchar2,
    p_region             in varchar2,
    p_object_storage_url out varchar2,
    p_file_name          out varchar2,
    p_mime_type          out varchar2
) is
    l_one_page blob;
    l_object   blob;
    l_response clob;
begin
    select
        blob_content,
        filename,
        mime_type
    into
        l_object,
        p_file_name,
        p_mime_type
    from
        apex_application_temp_files
    where
        name = p_file_content;

    l_one_page := extractpage(l_object, 0);
    p_object_storage_url := 'https://objectstorage.'
                            || p_region
                            || '.oraclecloud.com/n/'
                            || p_namespace
                            || '/b/'
                            || p_bucket
                            || '/o/'
                            || url_encode(p_file_name);

    apex_web_service.g_request_headers(1).name := 'Content-Type';
    apex_web_service.g_request_headers(1).value := p_mime_type;
    l_response := apex_web_service.make_rest_request(
        p_url                  => p_object_storage_url,
        p_http_method          => 'PUT',
        p_body_blob            => l_one_page,
        p_credential_static_id => p_static_id
    );

    if apex_web_service.g_status_code != 200 then
        raise_application_error(-20000, 'Upload failed - ' || apex_web_service.g_status_code);
    end if;

end upload_file;
/


-- sqlcl_snapshot {"hash":"a670eb99607803e7cb01e1362d3f2c3d18353676","type":"PROCEDURE","name":"UPLOAD_FILE","schemaName":"MOVIESTREAM","sxml":""}