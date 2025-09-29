create or replace editionable trigger biu_eba_demo_ir_projects before
    insert or update on eba_demo_ir_projects
    for each row
begin
    if :new.id is null then
        select
            to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
        into :new.id
        from
            dual;

    end if;

    if inserting then
        :new.row_version_number := 1;
    elsif updating then
        :new.row_version_number := nvl(:old.row_version_number,
                                       1) + 1;
    end if;

    if :new.start_date > :new.end_date then
        raise_application_error(-20001, 'Error start date must be before end date');
    end if;

end;
/

alter trigger biu_eba_demo_ir_projects enable;


-- sqlcl_snapshot {"hash":"8ceb6bbf2cd5d24bafd4c3620e94299de4856df4","type":"TRIGGER","name":"BIU_EBA_DEMO_IR_PROJECTS","schemaName":"MOVIESTREAM","sxml":""}