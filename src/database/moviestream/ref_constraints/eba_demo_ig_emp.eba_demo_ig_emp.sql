alter table eba_demo_ig_emp
    add
        foreign key ( mgr )
            references eba_demo_ig_emp ( empno )
        enable;


-- sqlcl_snapshot {"hash":"44087e7c21b274d9ddc3fbbd983b084376ef4f02","type":"REF_CONSTRAINT","name":"EBA_DEMO_IG_EMP.EBA_DEMO_IG_EMP","schemaName":"MOVIESTREAM","sxml":""}