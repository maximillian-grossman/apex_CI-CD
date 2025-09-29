create index eba_demo_dg_emp_dept_i on
    eba_demo_dg_emp (
        deptno
    );


-- sqlcl_snapshot {"hash":"c571a9d3b3e21a7861fd3d9f0ed437d27980978d","type":"INDEX","name":"EBA_DEMO_DG_EMP_DEPT_I","schemaName":"MOVIESTREAM","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>MOVIESTREAM</SCHEMA>\n   <NAME>EBA_DEMO_DG_EMP_DEPT_I</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>MOVIESTREAM</SCHEMA>\n         <NAME>EBA_DEMO_DG_EMP</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>DEPTNO</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}