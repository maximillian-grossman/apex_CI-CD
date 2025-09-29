alter table eba_demo_dg_emp
    add constraint eba_demo_dg_mgr_fk
        foreign key ( mgr )
            references eba_demo_dg_emp ( empno )
        enable;


-- sqlcl_snapshot {"hash":"2c490874b2cfb6bada7fda3894d6516eeb38f39c","type":"REF_CONSTRAINT","name":"EBA_DEMO_DG_MGR_FK","schemaName":"MOVIESTREAM","sxml":""}