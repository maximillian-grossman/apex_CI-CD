alter table eba_demo_ig_emp
    add
        foreign key ( deptno )
            references eba_demo_ig_dept ( deptno )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"8c5ea6a6ff9bd049109d02fac0eb0f2258e69be6","type":"REF_CONSTRAINT","name":"EBA_DEMO_IG_EMP.EBA_DEMO_IG_DEPT","schemaName":"MOVIESTREAM","sxml":""}