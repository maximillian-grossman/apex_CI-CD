alter table eba_demo_dg_emp
    add constraint eba_demo_dg_dept_fk
        foreign key ( deptno )
            references eba_demo_dg_dept ( deptno )
        enable;


-- sqlcl_snapshot {"hash":"c6d14e686bba41fe5454ca63a90956ffdb933f02","type":"REF_CONSTRAINT","name":"EBA_DEMO_DG_DEPT_FK","schemaName":"MOVIESTREAM","sxml":""}