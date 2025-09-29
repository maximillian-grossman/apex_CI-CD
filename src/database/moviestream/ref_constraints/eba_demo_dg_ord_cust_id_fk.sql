alter table eba_demo_dg_orders
    add constraint eba_demo_dg_ord_cust_id_fk
        foreign key ( customer_id )
            references eba_demo_dg_customers ( customer_id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"ca7ea9f2056f6ede497857b6f327e56c9aeb3d4e","type":"REF_CONSTRAINT","name":"EBA_DEMO_DG_ORD_CUST_ID_FK","schemaName":"MOVIESTREAM","sxml":""}