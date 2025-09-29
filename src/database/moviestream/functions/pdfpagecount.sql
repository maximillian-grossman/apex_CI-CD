create or replace function pdfpagecount (
    inpdf in blob
) return number as mle module pdflib env pdflib_testing signature 'pdfPageCountUnit8Array(Uint8Array)';
/


-- sqlcl_snapshot {"hash":"6995c20087304273c5f352f470b6274eb529faf6","type":"FUNCTION","name":"PDFPAGECOUNT","schemaName":"MOVIESTREAM","sxml":""}