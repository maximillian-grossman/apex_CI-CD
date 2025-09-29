create or replace editionable trigger biu_eba_demo_load_sales before
    insert or update on eba_demo_load_sales
    for each row
begin
    if :new.created is null then
        :new.created := sysdate;
    end if;

    :new.last_updated := sysdate;
end;
/

alter trigger biu_eba_demo_load_sales enable;


-- sqlcl_snapshot {"hash":"e116ac404b725d819a34ca03ec14db48aff44e9a","type":"TRIGGER","name":"BIU_EBA_DEMO_LOAD_SALES","schemaName":"MOVIESTREAM","sxml":""}