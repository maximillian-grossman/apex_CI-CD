create index nurse_unit_disp_i1 on
    svcs_directory (
        fk_nursing_unit_id
    );


-- sqlcl_snapshot {"hash":"b9fc73746955c6fc2c5274a89213077c629cf2c6","type":"INDEX","name":"NURSE_UNIT_DISP_I1","schemaName":"MOVIESTREAM","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>MOVIESTREAM</SCHEMA>\n   <NAME>NURSE_UNIT_DISP_I1</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>MOVIESTREAM</SCHEMA>\n         <NAME>SVCS_DIRECTORY</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>FK_NURSING_UNIT_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}