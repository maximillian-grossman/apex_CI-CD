create or replace editionable trigger biu_eba_demo_md_tasks before
    insert or update on eba_demo_md_tasks
    for each row
begin
    if :new.id is null then
        :new.id := to_number ( sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' );
    end if;

    if inserting then
        :new.created := current_timestamp;
        :new.created_by := nvl(wwv_flow.g_user, user);
    end if;

    :new.updated := current_timestamp;
    :new.updated_by := nvl(wwv_flow.g_user, user);
end;
/

alter trigger biu_eba_demo_md_tasks enable;


-- sqlcl_snapshot {"hash":"fedfe445ceeb759196c43f4cba67b1264cc110e8","type":"TRIGGER","name":"BIU_EBA_DEMO_MD_TASKS","schemaName":"MOVIESTREAM","sxml":""}