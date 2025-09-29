create index eba_demo_load_emp_1 on
    eba_demo_load_emp (
        mgr
    );


-- sqlcl_snapshot {"hash":"7fab380cbab8d024d452cbaa6d8652404162ac7e","type":"INDEX","name":"EBA_DEMO_LOAD_EMP_1","schemaName":"MOVIESTREAM","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>MOVIESTREAM</SCHEMA>\n   <NAME>EBA_DEMO_LOAD_EMP_1</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>MOVIESTREAM</SCHEMA>\n         <NAME>EBA_DEMO_LOAD_EMP</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>MGR</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}