alter table eba_demo_dg_order_items
    add constraint eba_demo_dg_oi_order_id_fk
        foreign key ( order_id )
            references eba_demo_dg_orders ( order_id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"c7ae8978b8bcee025dff392450a8b0e138cdf161","type":"REF_CONSTRAINT","name":"EBA_DEMO_DG_OI_ORDER_ID_FK","schemaName":"MOVIESTREAM","sxml":""}