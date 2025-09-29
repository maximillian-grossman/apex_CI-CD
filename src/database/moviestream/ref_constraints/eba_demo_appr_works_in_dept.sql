alter table eba_demo_appr_emp
    add constraint eba_demo_appr_works_in_dept
        foreign key ( deptno )
            references eba_demo_appr_dept ( deptno )
                on delete set null
        enable;


-- sqlcl_snapshot {"hash":"e27ea9da3aa0b8c257bde88c5d1bb6dc18c2566b","type":"REF_CONSTRAINT","name":"EBA_DEMO_APPR_WORKS_IN_DEPT","schemaName":"MOVIESTREAM","sxml":""}