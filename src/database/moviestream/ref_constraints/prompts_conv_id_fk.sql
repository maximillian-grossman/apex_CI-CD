alter table ocw23_prompts
    add constraint prompts_conv_id_fk
        foreign key ( conv_id )
            references ocw23_conversations ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"f1d77ee7a5b9814580b3a4cc3e727b9839ded81f","type":"REF_CONSTRAINT","name":"PROMPTS_CONV_ID_FK","schemaName":"MOVIESTREAM","sxml":""}