create index eba_sample_map_simplestates_sx on
    eba_sample_map_simple_states (
        geometry
    )
        indextype is mdsys.spatial_index_v2;


-- sqlcl_snapshot {"hash":"81d4c2e2d638e31ca9e8cb9e37736a49c2830196","type":"INDEX","name":"EBA_SAMPLE_MAP_SIMPLESTATES_SX","schemaName":"MOVIESTREAM","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>MOVIESTREAM</SCHEMA>\n   <NAME>EBA_SAMPLE_MAP_SIMPLESTATES_SX</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>MOVIESTREAM</SCHEMA>\n         <NAME>EBA_SAMPLE_MAP_SIMPLE_STATES</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>GEOMETRY</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n      <DOMAIN_INDEX_PROPERTIES>\n         <INDEXTYPE>\n            <SCHEMA>MDSYS</SCHEMA>\n            <NAME>SPATIAL_INDEX_V2</NAME>\n         </INDEXTYPE>\n      </DOMAIN_INDEX_PROPERTIES>\n   </TABLE_INDEX>\n</INDEX>"}