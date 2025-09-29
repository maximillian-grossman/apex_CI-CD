create or replace procedure get_supervisor is

    l_clob        clob;
    j             apex_json.t_values;
    l_group_names apex_t_varchar2;
    l_api_key_c   constant varchar2(256) default '00vx1MgsJ4g2ybqFqkdIkjXG0cD1h-EbyEpeWea2pd';
    l_org_url_c   constant varchar2(256) default 'https://trial-3870463-admin.okta.com';
begin
    apex_web_service.set_request_headers(
        p_name_01  => 'Content-Type',
        p_value_01 => 'application/json',
        p_name_02  => 'Accept',
        p_value_02 => 'application/json',
        p_name_03  => 'Authorization',
        p_value_03 => 'SSWS ' || l_api_key_c
    );

    l_clob := apex_web_service.make_rest_request(
        p_url         => l_org_url_c || '/api/v1/users/maximillian.grossman@oracle.com/groups',
        p_http_method => 'GET'
    );

    apex_json.parse(
        p_values => j,
        p_source => l_clob
    );
    for i in 1..apex_json.get_count(
        p_path   => '.',
        p_values => j
    ) loop
        -- add all group names to l_group_names
        apex_string.push(
            p_table => l_group_names,
            p_value => apex_json.get_varchar2(
                p_path   => '[%d].profile.name',
                p0       => i,
                p_values => j
            )
        );

        dbms_output.put_line(apex_json.get_varchar2(
            p_path   => '[%d].profile.name',
            p0       => i,
            p_values => j
        ));

    end loop;
 
    -- save group names in session
    apex_authorization.enable_dynamic_groups(p_group_names => l_group_names);
end get_supervisor;
/


-- sqlcl_snapshot {"hash":"d5231c577c4a8e8a40545583fb37b9625d973361","type":"PROCEDURE","name":"GET_SUPERVISOR","schemaName":"MOVIESTREAM","sxml":""}