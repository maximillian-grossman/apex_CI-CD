create index eba_demo_dg_emp_mgr_i on
    eba_demo_dg_emp (
        mgr
    );


-- sqlcl_snapshot {"hash":"a5d4da667f34ed923fadcf0171bff3decb8460a0","type":"INDEX","name":"EBA_DEMO_DG_EMP_MGR_I","schemaName":"MOVIESTREAM","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>MOVIESTREAM</SCHEMA>\n   <NAME>EBA_DEMO_DG_EMP_MGR_I</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>MOVIESTREAM</SCHEMA>\n         <NAME>EBA_DEMO_DG_EMP</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>MGR</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}