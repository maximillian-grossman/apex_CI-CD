alter table streams
    add constraint fk_streams_cust_id
        foreign key ( cust_id )
            references customer ( cust_id )
        enable;


-- sqlcl_snapshot {"hash":"a29d1a4b9650c332dfe30f61317f2d0ba50baabc","type":"REF_CONSTRAINT","name":"FK_STREAMS_CUST_ID","schemaName":"MOVIESTREAM","sxml":""}