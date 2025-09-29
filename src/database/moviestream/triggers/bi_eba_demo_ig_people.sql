create or replace editionable trigger bi_eba_demo_ig_people before
    insert on eba_demo_ig_people
    for each row
begin
    if :new.id is null then
        select
            eba_demo_ig_people_seq.nextval
        into :new.id
        from
            sys.dual;

    end if;
end;
/

alter trigger bi_eba_demo_ig_people enable;


-- sqlcl_snapshot {"hash":"a25238745321afa97e2cec6bd30b1248bff76967","type":"TRIGGER","name":"BI_EBA_DEMO_IG_PEOPLE","schemaName":"MOVIESTREAM","sxml":""}