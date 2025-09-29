alter table eba_demo_md_tasks
    add constraint eba_demo_md_task_project_fk
        foreign key ( project_id )
            references eba_demo_md_projects ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"cb1602765eb6abb695c2fabd7247b43c17757379","type":"REF_CONSTRAINT","name":"EBA_DEMO_MD_TASK_PROJECT_FK","schemaName":"MOVIESTREAM","sxml":""}