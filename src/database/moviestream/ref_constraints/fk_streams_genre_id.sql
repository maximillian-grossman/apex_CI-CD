alter table streams
    add constraint fk_streams_genre_id
        foreign key ( genre_id )
            references genre ( genre_id )
        enable;


-- sqlcl_snapshot {"hash":"85c728ef0a084c4e6a7199c6373f41a308dddc8b","type":"REF_CONSTRAINT","name":"FK_STREAMS_GENRE_ID","schemaName":"MOVIESTREAM","sxml":""}