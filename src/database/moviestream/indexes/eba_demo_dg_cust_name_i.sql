create index eba_demo_dg_cust_name_i on
    eba_demo_dg_customers (
        full_name
    );


-- sqlcl_snapshot {"hash":"d90a9e2d5a0d1af6972bdae3926c5f3a9026b3cb","type":"INDEX","name":"EBA_DEMO_DG_CUST_NAME_I","schemaName":"MOVIESTREAM","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>MOVIESTREAM</SCHEMA>\n   <NAME>EBA_DEMO_DG_CUST_NAME_I</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>MOVIESTREAM</SCHEMA>\n         <NAME>EBA_DEMO_DG_CUSTOMERS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>FULL_NAME</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}