alter table eba_demo_appr_sal_history
    add constraint eba_demo_appr_sal_empno_fk
        foreign key ( empno )
            references eba_demo_appr_emp ( empno )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"6dc9f1bd56fb970f572e4fac42f5e403fae7d46d","type":"REF_CONSTRAINT","name":"EBA_DEMO_APPR_SAL_EMPNO_FK","schemaName":"MOVIESTREAM","sxml":""}