create index facility_disp_i1 on
    bldg_directory (
        fk_facility_id
    );


-- sqlcl_snapshot {"hash":"0c0bef82a43cfafa5856ba9bc7be8995a6a37317","type":"INDEX","name":"FACILITY_DISP_I1","schemaName":"MOVIESTREAM","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>MOVIESTREAM</SCHEMA>\n   <NAME>FACILITY_DISP_I1</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>MOVIESTREAM</SCHEMA>\n         <NAME>BLDG_DIRECTORY</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>FK_FACILITY_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}