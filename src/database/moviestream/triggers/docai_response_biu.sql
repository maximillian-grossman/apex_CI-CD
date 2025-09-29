create or replace editionable trigger docai_response_biu before
    insert or update on docai_response
    for each row
begin
    if inserting then
        :new.created := sysdate;
        :new.created_by := coalesce(
            sys_context('APEX$SESSION', 'APP_USER'),
            user
        );
    end if;

    :new.updated := sysdate;
    :new.updated_by := coalesce(
        sys_context('APEX$SESSION', 'APP_USER'),
        user
    );
end docai_response_biu;
/

alter trigger docai_response_biu enable;


-- sqlcl_snapshot {"hash":"2baf258ac6da6ec3482fe75d8bb26332a0777096","type":"TRIGGER","name":"DOCAI_RESPONSE_BIU","schemaName":"MOVIESTREAM","sxml":""}