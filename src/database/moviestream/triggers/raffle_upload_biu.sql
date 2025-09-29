create or replace editionable trigger raffle_upload_biu before
    insert or update on raffle_upload
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
end raffle_upload_biu;
/

alter trigger raffle_upload_biu enable;


-- sqlcl_snapshot {"hash":"7b6e35c90d021636fc7b1193ba040d99ccbe719f","type":"TRIGGER","name":"RAFFLE_UPLOAD_BIU","schemaName":"MOVIESTREAM","sxml":""}