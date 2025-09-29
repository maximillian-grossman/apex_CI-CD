create or replace editionable trigger bi_eba_demo_ig_emp before
    insert on eba_demo_ig_emp
    for each row
begin
    if :new.empno is null then
        select
            eba_demo_ig_emp_seq.nextval
        into :new.empno
        from
            sys.dual;

    end if;
end;
/

alter trigger bi_eba_demo_ig_emp enable;


-- sqlcl_snapshot {"hash":"757e4dbe61608f66c3d1cf7531d3ccde9a777da3","type":"TRIGGER","name":"BI_EBA_DEMO_IG_EMP","schemaName":"MOVIESTREAM","sxml":""}