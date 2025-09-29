alter table eba_demo_md_task_todos
    add constraint eba_demo_md_task_todo_tsk_fk
        foreign key ( task_id )
            references eba_demo_md_tasks ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"1def0100c9a23c5f40d06351fc5ca7b8653038a0","type":"REF_CONSTRAINT","name":"EBA_DEMO_MD_TASK_TODO_TSK_FK","schemaName":"MOVIESTREAM","sxml":""}