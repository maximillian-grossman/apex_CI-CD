create or replace editionable trigger biu_eba_demo_md_projects before
    insert or update on eba_demo_md_projects
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

alter trigger biu_eba_demo_md_projects enable;


-- sqlcl_snapshot {"hash":"b57d1afd8f1f2f4b14e4de061d2ddceddc6f9a72","type":"TRIGGER","name":"BIU_EBA_DEMO_MD_PROJECTS","schemaName":"MOVIESTREAM","sxml":""}