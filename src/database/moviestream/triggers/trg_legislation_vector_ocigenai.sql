create or replace editionable trigger trg_legislation_vector_ocigenai after
    insert on legislation
    for each row
declare
    my_job number;
begin
    dbms_job.submit(
        job  => my_job,
        what => 'chathistory_pkg.prc_cr_doc_vectors;'
    );
end;
/

alter trigger trg_legislation_vector_ocigenai enable;


-- sqlcl_snapshot {"hash":"ca5da8cbe36891aeb430ca54718fe867d60d533f","type":"TRIGGER","name":"TRG_LEGISLATION_VECTOR_OCIGENAI","schemaName":"MOVIESTREAM","sxml":""}