create or replace editionable trigger eba_demo_appr_laptop_requests_t before
    update on eba_demo_appr_laptop_requests
    for each row
begin
    if
        :old.delivered_date is null
        and :new.delivered_date is not null
    then
        eba_demo_appr.laptop_delivered(:new.id);
    end if;
end;
/

alter trigger eba_demo_appr_laptop_requests_t enable;


-- sqlcl_snapshot {"hash":"ff0faa2f2df32e25606c2d6ef193f622276f3d8f","type":"TRIGGER","name":"EBA_DEMO_APPR_LAPTOP_REQUESTS_T","schemaName":"MOVIESTREAM","sxml":""}