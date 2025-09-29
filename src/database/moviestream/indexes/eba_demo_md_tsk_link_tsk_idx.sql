create index eba_demo_md_tsk_link_tsk_idx on
    eba_demo_md_task_links (
        task_id
    );


-- sqlcl_snapshot {"hash":"1180307d414a1bdde8dd144fe4c26f7112b7d55f","type":"INDEX","name":"EBA_DEMO_MD_TSK_LINK_TSK_IDX","schemaName":"MOVIESTREAM","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>MOVIESTREAM</SCHEMA>\n   <NAME>EBA_DEMO_MD_TSK_LINK_TSK_IDX</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>MOVIESTREAM</SCHEMA>\n         <NAME>EBA_DEMO_MD_TASK_LINKS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>TASK_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}