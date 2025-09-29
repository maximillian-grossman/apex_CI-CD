alter table docai_response
    add constraint docai_response_con
        foreign key ( document_id )
            references raffle_upload ( id )
        enable;


-- sqlcl_snapshot {"hash":"61f61672b29aa09b0fe973dc37b32cd8beb3e076","type":"REF_CONSTRAINT","name":"DOCAI_RESPONSE_CON","schemaName":"MOVIESTREAM","sxml":""}