alter table bldg_directory
    add constraint facility_disp_rco_directory_id_fk
        foreign key ( fk_facility_id )
            references fac_directory ( facility_id )
        enable;


-- sqlcl_snapshot {"hash":"d9653ba533f081ba87472f458ede2f29a2ca3b4b","type":"REF_CONSTRAINT","name":"FACILITY_DISP_RCO_DIRECTORY_ID_FK","schemaName":"MOVIESTREAM","sxml":""}