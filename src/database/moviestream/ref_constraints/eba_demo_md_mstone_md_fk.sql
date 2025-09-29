alter table eba_demo_md_milestones
    add constraint eba_demo_md_mstone_md_fk
        foreign key ( project_id )
            references eba_demo_md_projects ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"9e114750f05f6c5ace5f1e84c541422f98818cad","type":"REF_CONSTRAINT","name":"EBA_DEMO_MD_MSTONE_MD_FK","schemaName":"MOVIESTREAM","sxml":""}