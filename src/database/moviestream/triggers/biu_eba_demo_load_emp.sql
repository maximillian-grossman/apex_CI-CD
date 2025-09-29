create or replace editionable trigger biu_eba_demo_load_emp before
    insert or update on eba_demo_load_emp
    for each row
begin
    if :new.created is null then
        select
            sysdate
        into :new.created
        from
            dual;

    end if;

    select
        sysdate
    into :new.last_updated
    from
        dual;

end;
/

alter trigger biu_eba_demo_load_emp enable;


-- sqlcl_snapshot {"hash":"152c17c86f7d74cd22cd91dda1dc74a9a225ef2f","type":"TRIGGER","name":"BIU_EBA_DEMO_LOAD_EMP","schemaName":"MOVIESTREAM","sxml":""}