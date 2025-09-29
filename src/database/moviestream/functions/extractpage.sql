create or replace function extractpage (
    inpdf in blob,
    page  in number
) return blob as mle module pdflib env pdflib_testing signature 'extractPage(Uint8Array,number)';
/


-- sqlcl_snapshot {"hash":"874438e7a785b36c033546d61d60591446198423","type":"FUNCTION","name":"EXTRACTPAGE","schemaName":"MOVIESTREAM","sxml":""}