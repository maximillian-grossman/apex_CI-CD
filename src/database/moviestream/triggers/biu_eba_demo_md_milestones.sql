create or replace editionable trigger biu_eba_demo_md_milestones before
    insert or update on eba_demo_md_milestones
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

alter trigger biu_eba_demo_md_milestones enable;


-- sqlcl_snapshot {"hash":"32f786e8b185af42bbf322b2c979bf9c833a663b","type":"TRIGGER","name":"BIU_EBA_DEMO_MD_MILESTONES","schemaName":"MOVIESTREAM","sxml":""}