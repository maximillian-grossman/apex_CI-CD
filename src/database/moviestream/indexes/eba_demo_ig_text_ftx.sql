create index eba_demo_ig_text_ftx on
    eba_demo_ig_people (
        name
    )
        indextype is ctxsys.context parameters ( 'section group  EBA_DEMO_IG_SG_PREF
                                             datastore      EBA_DEMO_IG_DS_PREF
                                             lexer          EBA_DEMO_IG_LX_PREF
                                             stoplist       ctxsys.empty_stoplist
                                             memory         10M
                                             sync           (on commit)' );


-- sqlcl_snapshot {"hash":"2f85edcb43ed5620d8998ce66994d42236e9d923","type":"INDEX","name":"EBA_DEMO_IG_TEXT_FTX","schemaName":"MOVIESTREAM","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>MOVIESTREAM</SCHEMA>\n   <NAME>EBA_DEMO_IG_TEXT_FTX</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>MOVIESTREAM</SCHEMA>\n         <NAME>EBA_DEMO_IG_PEOPLE</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>NAME</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n      <DOMAIN_INDEX_PROPERTIES>\n         <INDEXTYPE>\n            <SCHEMA>CTXSYS</SCHEMA>\n            <NAME>CONTEXT</NAME>\n         </INDEXTYPE>\n         <PARAMETERS>section group  EBA_DEMO_IG_SG_PREF\n                                             datastore      EBA_DEMO_IG_DS_PREF\n                                             lexer          EBA_DEMO_IG_LX_PREF\n                                             stoplist       ctxsys.empty_stoplist\n                                             memory         10M\n                                             sync           (on commit)</PARAMETERS>\n      </DOMAIN_INDEX_PROPERTIES>\n   </TABLE_INDEX>\n</INDEX>"}