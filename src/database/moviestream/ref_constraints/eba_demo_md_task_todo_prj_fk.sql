alter table eba_demo_md_task_todos
    add constraint eba_demo_md_task_todo_prj_fk
        foreign key ( project_id )
            references eba_demo_md_projects ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"222bdc4000bba485d085aee3c97f41ae80c6f039","type":"REF_CONSTRAINT","name":"EBA_DEMO_MD_TASK_TODO_PRJ_FK","schemaName":"MOVIESTREAM","sxml":""}