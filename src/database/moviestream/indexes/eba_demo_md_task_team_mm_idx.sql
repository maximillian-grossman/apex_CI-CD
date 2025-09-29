create index eba_demo_md_task_team_mm_idx on
    eba_demo_md_tasks (
        assignee
    );


-- sqlcl_snapshot {"hash":"eb0069865b09ed1ca2c90026a4b02edce3d80f1b","type":"INDEX","name":"EBA_DEMO_MD_TASK_TEAM_MM_IDX","schemaName":"MOVIESTREAM","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>MOVIESTREAM</SCHEMA>\n   <NAME>EBA_DEMO_MD_TASK_TEAM_MM_IDX</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>MOVIESTREAM</SCHEMA>\n         <NAME>EBA_DEMO_MD_TASKS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>ASSIGNEE</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}