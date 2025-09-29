create or replace type eba_restdemo_github_repo_t as object (
        name        varchar2(255),
        language    varchar2(50),
        description varchar2(4000),
        updated_on  timestamp with time zone,
        created_on  timestamp with time zone,
        issues_cnt  number
)
/


-- sqlcl_snapshot {"hash":"92f2cd647c9dafa1feadb1102a2acf67ff6b900d","type":"TYPE_SPEC","name":"EBA_RESTDEMO_GITHUB_REPO_T","schemaName":"MOVIESTREAM","sxml":""}