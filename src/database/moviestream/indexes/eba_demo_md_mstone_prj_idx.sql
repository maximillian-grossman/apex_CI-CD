create index eba_demo_md_mstone_prj_idx on
    eba_demo_md_milestones (
        project_id
    );


-- sqlcl_snapshot {"hash":"b412bb1fd28b315b216f4eb83ae60edb1dabcfbf","type":"INDEX","name":"EBA_DEMO_MD_MSTONE_PRJ_IDX","schemaName":"MOVIESTREAM","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>MOVIESTREAM</SCHEMA>\n   <NAME>EBA_DEMO_MD_MSTONE_PRJ_IDX</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>MOVIESTREAM</SCHEMA>\n         <NAME>EBA_DEMO_MD_MILESTONES</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>PROJECT_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}