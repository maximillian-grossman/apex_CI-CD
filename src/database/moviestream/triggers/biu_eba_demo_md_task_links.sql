create or replace editionable trigger biu_eba_demo_md_task_links before
    insert or update on eba_demo_md_task_links
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

alter trigger biu_eba_demo_md_task_links enable;


-- sqlcl_snapshot {"hash":"8cc8c8d7fc7e12246fc084d25f277efc646d7ed5","type":"TRIGGER","name":"BIU_EBA_DEMO_MD_TASK_LINKS","schemaName":"MOVIESTREAM","sxml":""}