create or replace editionable trigger bi_eba_demo_ig_dept before
    insert on eba_demo_ig_dept
    for each row
begin
    if :new.deptno is null then
        select
            eba_demo_ig_dept_seq.nextval
        into :new.deptno
        from
            sys.dual;

    end if;
end;
/

alter trigger bi_eba_demo_ig_dept enable;


-- sqlcl_snapshot {"hash":"9721133d0881987bb072345ddda917aee2a5e0de","type":"TRIGGER","name":"BI_EBA_DEMO_IG_DEPT","schemaName":"MOVIESTREAM","sxml":""}