create index eba_demo_md_tsk_todo_prj_idx on
    eba_demo_md_task_todos (
        project_id
    );


-- sqlcl_snapshot {"hash":"bd2a15336b7e54d78488091a08f63340e11499ee","type":"INDEX","name":"EBA_DEMO_MD_TSK_TODO_PRJ_IDX","schemaName":"MOVIESTREAM","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>MOVIESTREAM</SCHEMA>\n   <NAME>EBA_DEMO_MD_TSK_TODO_PRJ_IDX</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>MOVIESTREAM</SCHEMA>\n         <NAME>EBA_DEMO_MD_TASK_TODOS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>PROJECT_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}