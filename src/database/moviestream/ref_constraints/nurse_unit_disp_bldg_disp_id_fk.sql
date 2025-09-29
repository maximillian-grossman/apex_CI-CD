alter table svcs_directory
    add constraint nurse_unit_disp_bldg_disp_id_fk
        foreign key ( fk_nursing_unit_id )
            references nu_directory ( nursing_unit_id )
        enable;


-- sqlcl_snapshot {"hash":"f2f02e7b9f724890fe5b31189407936f7d3a29bd","type":"REF_CONSTRAINT","name":"NURSE_UNIT_DISP_BLDG_DISP_ID_FK","schemaName":"MOVIESTREAM","sxml":""}