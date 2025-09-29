create index eba_demo_md_task_todo_tm_idx on
    eba_demo_md_task_todos (
        assignee
    );


-- sqlcl_snapshot {"hash":"d6f6a4a1665e2fc75ae1abfeab56c1683b91a857","type":"INDEX","name":"EBA_DEMO_MD_TASK_TODO_TM_IDX","schemaName":"MOVIESTREAM","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>MOVIESTREAM</SCHEMA>\n   <NAME>EBA_DEMO_MD_TASK_TODO_TM_IDX</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>MOVIESTREAM</SCHEMA>\n         <NAME>EBA_DEMO_MD_TASK_TODOS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>ASSIGNEE</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}