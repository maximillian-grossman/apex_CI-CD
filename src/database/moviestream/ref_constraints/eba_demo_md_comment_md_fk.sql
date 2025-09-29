alter table eba_demo_md_comments
    add constraint eba_demo_md_comment_md_fk
        foreign key ( project_id )
            references eba_demo_md_projects ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"8f52f90cbd45832bfdacaf6b7adfb51c61c4e07d","type":"REF_CONSTRAINT","name":"EBA_DEMO_MD_COMMENT_MD_FK","schemaName":"MOVIESTREAM","sxml":""}