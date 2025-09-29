alter table eba_demo_ir_emp
    add
        foreign key ( mgr )
            references eba_demo_ir_emp ( empno )
        enable;


-- sqlcl_snapshot {"hash":"e22b78cffaaaebef8cbbe9a9dc2b3e4430d5930e","type":"REF_CONSTRAINT","name":"EBA_DEMO_IR_EMP.EBA_DEMO_IR_EMP","schemaName":"MOVIESTREAM","sxml":""}