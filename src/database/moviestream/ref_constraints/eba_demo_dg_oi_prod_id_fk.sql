alter table eba_demo_dg_order_items
    add constraint eba_demo_dg_oi_prod_id_fk
        foreign key ( product_id )
            references eba_demo_dg_products ( product_id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"f010cfc74fde7afc188a7fdbf4a988fde86aec69","type":"REF_CONSTRAINT","name":"EBA_DEMO_DG_OI_PROD_ID_FK","schemaName":"MOVIESTREAM","sxml":""}