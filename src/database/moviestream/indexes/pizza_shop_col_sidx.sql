create index pizza_shop_col_sidx on
    pizza_shop (
        location
    )
        indextype is mdsys.spatial_index_v2 parameters ( 'layer_gtype=POINT' );


-- sqlcl_snapshot {"hash":"31b246af0975adb6f51d6e527e23cefab4763e8d","type":"INDEX","name":"PIZZA_SHOP_COL_SIDX","schemaName":"MOVIESTREAM","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>MOVIESTREAM</SCHEMA>\n   <NAME>PIZZA_SHOP_COL_SIDX</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>MOVIESTREAM</SCHEMA>\n         <NAME>PIZZA_SHOP</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>LOCATION</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n      <DOMAIN_INDEX_PROPERTIES>\n         <INDEXTYPE>\n            <SCHEMA>MDSYS</SCHEMA>\n            <NAME>SPATIAL_INDEX_V2</NAME>\n         </INDEXTYPE>\n         <PARAMETERS>layer_gtype=POINT</PARAMETERS>\n      </DOMAIN_INDEX_PROPERTIES>\n   </TABLE_INDEX>\n</INDEX>"}