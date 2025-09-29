create or replace editionable trigger biu_eba_demo_md_team_members before
    insert or update on eba_demo_md_team_members
    for each row
begin
    if :new.id is null then
        :new.id := to_number ( sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' );
    end if;

    if inserting then
        :new.created := current_timestamp;
        :new.created_by := nvl(wwv_flow.g_user, user);
    end if;

    :new.username := upper(:new.username);
    :new.updated := current_timestamp;
    :new.updated_by := nvl(wwv_flow.g_user, user);
end;
/

alter trigger biu_eba_demo_md_team_members enable;


-- sqlcl_snapshot {"hash":"49b06633ae525348ba9a42813721c4611c55e8b8","type":"TRIGGER","name":"BIU_EBA_DEMO_MD_TEAM_MEMBERS","schemaName":"MOVIESTREAM","sxml":""}