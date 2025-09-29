create or replace editionable trigger biu_eba_demo_md_task_todos before
    insert or update on eba_demo_md_task_todos
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

alter trigger biu_eba_demo_md_task_todos enable;


-- sqlcl_snapshot {"hash":"5bbb37e8b9e5dfb3edd475d659ed066444c57816","type":"TRIGGER","name":"BIU_EBA_DEMO_MD_TASK_TODOS","schemaName":"MOVIESTREAM","sxml":""}