create index eba_sample_map_states_sx on
    eba_sample_map_states (
        geometry
    )
        indextype is mdsys.spatial_index_v2;


-- sqlcl_snapshot {"hash":"64b71d18952f3df8af53c5e0640e4435035d0124","type":"INDEX","name":"EBA_SAMPLE_MAP_STATES_SX","schemaName":"MOVIESTREAM","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>MOVIESTREAM</SCHEMA>\n   <NAME>EBA_SAMPLE_MAP_STATES_SX</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>MOVIESTREAM</SCHEMA>\n         <NAME>EBA_SAMPLE_MAP_STATES</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>GEOMETRY</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n      <DOMAIN_INDEX_PROPERTIES>\n         <INDEXTYPE>\n            <SCHEMA>MDSYS</SCHEMA>\n            <NAME>SPATIAL_INDEX_V2</NAME>\n         </INDEXTYPE>\n      </DOMAIN_INDEX_PROPERTIES>\n   </TABLE_INDEX>\n</INDEX>"}