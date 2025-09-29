alter table eba_demo_md_projects
    add constraint eba_demo_md_status_fk
        foreign key ( status_cd )
            references eba_demo_md_status ( cd )
                on delete set null
        enable;


-- sqlcl_snapshot {"hash":"4e24473bdb65f6dd91e03df4b667bb55ebee1b49","type":"REF_CONSTRAINT","name":"EBA_DEMO_MD_STATUS_FK","schemaName":"MOVIESTREAM","sxml":""}