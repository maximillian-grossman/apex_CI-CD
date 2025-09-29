create or replace editionable trigger biu_eba_demo_md_status before
    insert or update on eba_demo_md_status
    for each row
begin
    if inserting then
        :new.created := current_timestamp;
        :new.created_by := nvl(wwv_flow.g_user, user);
    end if;

    :new.cd := upper(:new.cd);
    :new.updated := current_timestamp;
    :new.updated_by := nvl(wwv_flow.g_user, user);
end;
/

alter trigger biu_eba_demo_md_status enable;


-- sqlcl_snapshot {"hash":"53ab3987973af1ccc315be08052f8e94167dc9d6","type":"TRIGGER","name":"BIU_EBA_DEMO_MD_STATUS","schemaName":"MOVIESTREAM","sxml":""}