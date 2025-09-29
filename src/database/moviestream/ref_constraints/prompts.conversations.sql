alter table prompts
    add
        foreign key ( conv_id )
            references conversations ( id )
        enable;


-- sqlcl_snapshot {"hash":"cf7e35f573d3f935c71f7403d4d19af79a213ac3","type":"REF_CONSTRAINT","name":"PROMPTS.CONVERSATIONS","schemaName":"MOVIESTREAM","sxml":""}