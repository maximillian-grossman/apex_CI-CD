create unique index eba_demo_ir_projects_pk on
    eba_demo_ir_projects (
        id
    );


-- sqlcl_snapshot {"hash":"9b2cd21b6b8786a2efde999b0c1c8fe81cffdb5d","type":"INDEX","name":"EBA_DEMO_IR_PROJECTS_PK","schemaName":"MOVIESTREAM","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <UNIQUE></UNIQUE>\n   <SCHEMA>MOVIESTREAM</SCHEMA>\n   <NAME>EBA_DEMO_IR_PROJECTS_PK</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>MOVIESTREAM</SCHEMA>\n         <NAME>EBA_DEMO_IR_PROJECTS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}