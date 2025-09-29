alter table eba_demo_md_task_links
    add constraint eba_demo_md_task_link_tsk_fk
        foreign key ( task_id )
            references eba_demo_md_tasks ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"21bc48917b68168058bc40e02d190af2df86a026","type":"REF_CONSTRAINT","name":"EBA_DEMO_MD_TASK_LINK_TSK_FK","schemaName":"MOVIESTREAM","sxml":""}