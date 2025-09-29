alter table nu_directory
    add constraint bldg_disp_facility_disp_id_fk
        foreign key ( fk_building_id )
            references bldg_directory ( building_id )
        enable;


-- sqlcl_snapshot {"hash":"293bd3b25a3b5022fa1c62b760f71ecae270d3dc","type":"REF_CONSTRAINT","name":"BLDG_DISP_FACILITY_DISP_ID_FK","schemaName":"MOVIESTREAM","sxml":""}