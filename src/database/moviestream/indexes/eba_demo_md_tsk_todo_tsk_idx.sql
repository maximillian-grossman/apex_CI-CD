create index eba_demo_md_tsk_todo_tsk_idx on
    eba_demo_md_task_todos (
        task_id
    );


-- sqlcl_snapshot {"hash":"565fb82a459aaa7da85f01b3be3b230e1c99b1e8","type":"INDEX","name":"EBA_DEMO_MD_TSK_TODO_TSK_IDX","schemaName":"MOVIESTREAM","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>MOVIESTREAM</SCHEMA>\n   <NAME>EBA_DEMO_MD_TSK_TODO_TSK_IDX</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>MOVIESTREAM</SCHEMA>\n         <NAME>EBA_DEMO_MD_TASK_TODOS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>TASK_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}