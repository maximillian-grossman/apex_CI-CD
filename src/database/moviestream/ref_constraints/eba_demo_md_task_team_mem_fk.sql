alter table eba_demo_md_tasks
    add constraint eba_demo_md_task_team_mem_fk
        foreign key ( assignee )
            references eba_demo_md_team_members ( id )
                on delete set null
        enable;


-- sqlcl_snapshot {"hash":"e1615a37129ee87e39ba42ee3b4f55288e8f4013","type":"REF_CONSTRAINT","name":"EBA_DEMO_MD_TASK_TEAM_MEM_FK","schemaName":"MOVIESTREAM","sxml":""}