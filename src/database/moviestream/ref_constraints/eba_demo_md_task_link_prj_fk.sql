alter table eba_demo_md_task_links
    add constraint eba_demo_md_task_link_prj_fk
        foreign key ( project_id )
            references eba_demo_md_projects ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"5a304b71a6dde5730e2d8cc28907ec7afe4ee3fa","type":"REF_CONSTRAINT","name":"EBA_DEMO_MD_TASK_LINK_PRJ_FK","schemaName":"MOVIESTREAM","sxml":""}