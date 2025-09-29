create index customer_sidx on
    customer_contact (
        moviestream.latlon_to_geometry
    (loc_lat, loc_long) )
        indextype is mdsys.spatial_index_v2 parameters ( 'layer_gtype=POINT' );


-- sqlcl_snapshot {"hash":"8edeb36e057a19a9e3c3824ec5f2031ac037fc31","type":"INDEX","name":"CUSTOMER_SIDX","schemaName":"MOVIESTREAM","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>MOVIESTREAM</SCHEMA>\n   <NAME>CUSTOMER_SIDX</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>MOVIESTREAM</SCHEMA>\n         <NAME>CUSTOMER_CONTACT</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>\"MOVIESTREAM\".\"LATLON_TO_GEOMETRY\"(\"LOC_LAT\",\"LOC_LONG\")</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n      <DOMAIN_INDEX_PROPERTIES>\n         <INDEXTYPE>\n            <SCHEMA>MDSYS</SCHEMA>\n            <NAME>SPATIAL_INDEX_V2</NAME>\n         </INDEXTYPE>\n         <PARAMETERS>layer_gtype=POINT</PARAMETERS>\n      </DOMAIN_INDEX_PROPERTIES>\n   </TABLE_INDEX>\n</INDEX>"}