create index eba_demo_dg_ord_cust_id_i on
    eba_demo_dg_orders (
        customer_id
    );


-- sqlcl_snapshot {"hash":"7e4a6c9321acfecdb3768f3596788043790409c5","type":"INDEX","name":"EBA_DEMO_DG_ORD_CUST_ID_I","schemaName":"MOVIESTREAM","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>MOVIESTREAM</SCHEMA>\n   <NAME>EBA_DEMO_DG_ORD_CUST_ID_I</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>MOVIESTREAM</SCHEMA>\n         <NAME>EBA_DEMO_DG_ORDERS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>CUSTOMER_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}