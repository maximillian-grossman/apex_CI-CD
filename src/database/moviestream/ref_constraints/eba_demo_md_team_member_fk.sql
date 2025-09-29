alter table eba_demo_md_projects
    add constraint eba_demo_md_team_member_fk
        foreign key ( project_lead )
            references eba_demo_md_team_members ( id )
                on delete set null
        enable;


-- sqlcl_snapshot {"hash":"7d71435b4994fd5e5144b0db8fdaf1ca51df396c","type":"REF_CONSTRAINT","name":"EBA_DEMO_MD_TEAM_MEMBER_FK","schemaName":"MOVIESTREAM","sxml":""}