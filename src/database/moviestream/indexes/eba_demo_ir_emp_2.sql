create index eba_demo_ir_emp_2 on
    eba_demo_ir_emp (
        deptno
    );


-- sqlcl_snapshot {"hash":"f1fd288d3b60539626daeaea4193e18b7efc7706","type":"INDEX","name":"EBA_DEMO_IR_EMP_2","schemaName":"MOVIESTREAM","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>MOVIESTREAM</SCHEMA>\n   <NAME>EBA_DEMO_IR_EMP_2</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>MOVIESTREAM</SCHEMA>\n         <NAME>EBA_DEMO_IR_EMP</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>DEPTNO</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}