create or replace package eba_restdemo_sample_pkg is
    function get_github_repos (
        p_max_rows in number default 10000
    ) return eba_restdemo_github_repo_ct
        pipelined;

    function test_url (
        p_url        in varchar2,
        p_https_host in varchar2
    ) return varchar2;

    procedure test_all;

end eba_restdemo_sample_pkg;
/


-- sqlcl_snapshot {"hash":"d0bd5a6204e8363bda8c8542a130a71c84edbb09","type":"PACKAGE_SPEC","name":"EBA_RESTDEMO_SAMPLE_PKG","schemaName":"MOVIESTREAM","sxml":""}