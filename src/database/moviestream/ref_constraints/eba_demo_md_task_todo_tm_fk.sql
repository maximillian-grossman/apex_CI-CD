alter table eba_demo_md_task_todos
    add constraint eba_demo_md_task_todo_tm_fk
        foreign key ( assignee )
            references eba_demo_md_team_members ( id )
                on delete set null
        enable;


-- sqlcl_snapshot {"hash":"37d91befc8093f809318d28e1fb6bfd4260ad811","type":"REF_CONSTRAINT","name":"EBA_DEMO_MD_TASK_TODO_TM_FK","schemaName":"MOVIESTREAM","sxml":""}