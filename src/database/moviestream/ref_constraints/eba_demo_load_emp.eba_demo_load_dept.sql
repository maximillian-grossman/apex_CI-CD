alter table eba_demo_load_emp
    add
        foreign key ( deptno )
            references eba_demo_load_dept ( deptno )
        enable;


-- sqlcl_snapshot {"hash":"33c9711c7c058fdd36d2541eb0e8a9bccaa6f346","type":"REF_CONSTRAINT","name":"EBA_DEMO_LOAD_EMP.EBA_DEMO_LOAD_DEPT","schemaName":"MOVIESTREAM","sxml":""}