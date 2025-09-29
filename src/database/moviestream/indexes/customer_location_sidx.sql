create index customer_location_sidx on
    customer (
        location
    )
        indextype is mdsys.spatial_index_v2 parameters ( 'layer_gtype=POINT' );


-- sqlcl_snapshot {"hash":"55b5b149120f067dff7983584e86d3e16d92a633","type":"INDEX","name":"CUSTOMER_LOCATION_SIDX","schemaName":"MOVIESTREAM","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>MOVIESTREAM</SCHEMA>\n   <NAME>CUSTOMER_LOCATION_SIDX</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>MOVIESTREAM</SCHEMA>\n         <NAME>CUSTOMER</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>LOCATION</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n      <DOMAIN_INDEX_PROPERTIES>\n         <INDEXTYPE>\n            <SCHEMA>MDSYS</SCHEMA>\n            <NAME>SPATIAL_INDEX_V2</NAME>\n         </INDEXTYPE>\n         <PARAMETERS>layer_gtype=POINT</PARAMETERS>\n      </DOMAIN_INDEX_PROPERTIES>\n   </TABLE_INDEX>\n</INDEX>"}