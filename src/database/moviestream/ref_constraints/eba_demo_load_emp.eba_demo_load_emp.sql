alter table eba_demo_load_emp
    add
        foreign key ( mgr )
            references eba_demo_load_emp ( empno )
        enable;


-- sqlcl_snapshot {"hash":"9e86de3102cd38e1aec9bec94b2ba924f91d7534","type":"REF_CONSTRAINT","name":"EBA_DEMO_LOAD_EMP.EBA_DEMO_LOAD_EMP","schemaName":"MOVIESTREAM","sxml":""}