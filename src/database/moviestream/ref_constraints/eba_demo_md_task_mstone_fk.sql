alter table eba_demo_md_tasks
    add constraint eba_demo_md_task_mstone_fk
        foreign key ( milestone_id )
            references eba_demo_md_milestones ( id )
                on delete set null
        enable;


-- sqlcl_snapshot {"hash":"68568f27662d6d6b78be35e5700f72b71d464cbf","type":"REF_CONSTRAINT","name":"EBA_DEMO_MD_TASK_MSTONE_FK","schemaName":"MOVIESTREAM","sxml":""}