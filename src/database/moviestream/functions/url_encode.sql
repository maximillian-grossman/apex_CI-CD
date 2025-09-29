create or replace function url_encode (
    p_str in varchar2
) return varchar2 is
begin
    return sys.utl_url.escape(
        url                   => p_str,
        escape_reserved_chars => true,
        url_charset           => 'AL32UTF8'
    );
end url_encode;
/


-- sqlcl_snapshot {"hash":"bc8f2eb6c98d98ec29ddbcd466ec311296d21b2f","type":"FUNCTION","name":"URL_ENCODE","schemaName":"MOVIESTREAM","sxml":""}