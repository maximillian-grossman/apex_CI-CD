create or replace editionable trigger biu_eba_demo_md_comments before
    insert or update on eba_demo_md_comments
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

alter trigger biu_eba_demo_md_comments enable;


-- sqlcl_snapshot {"hash":"7330fb7fb67cbda7ff3ae2218672908941b8e434","type":"TRIGGER","name":"BIU_EBA_DEMO_MD_COMMENTS","schemaName":"MOVIESTREAM","sxml":""}