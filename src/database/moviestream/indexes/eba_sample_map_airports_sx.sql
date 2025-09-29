create index eba_sample_map_airports_sx on
    eba_sample_map_airports (
        geometry
    )
        indextype is mdsys.spatial_index_v2 parameters ( 'layer_gtype=POINT' );


-- sqlcl_snapshot {"hash":"9f14007db30a64661910dd980468e66bf7cbb8e3","type":"INDEX","name":"EBA_SAMPLE_MAP_AIRPORTS_SX","schemaName":"MOVIESTREAM","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>MOVIESTREAM</SCHEMA>\n   <NAME>EBA_SAMPLE_MAP_AIRPORTS_SX</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>MOVIESTREAM</SCHEMA>\n         <NAME>EBA_SAMPLE_MAP_AIRPORTS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>GEOMETRY</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n      <DOMAIN_INDEX_PROPERTIES>\n         <INDEXTYPE>\n            <SCHEMA>MDSYS</SCHEMA>\n            <NAME>SPATIAL_INDEX_V2</NAME>\n         </INDEXTYPE>\n         <PARAMETERS>layer_gtype=POINT</PARAMETERS>\n      </DOMAIN_INDEX_PROPERTIES>\n   </TABLE_INDEX>\n</INDEX>"}