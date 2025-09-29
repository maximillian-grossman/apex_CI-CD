create or replace force editionable view movies (
    movie_id,
    title,
    image_url,
    budget,
    gross,
    list_price,
    year,
    opening_date,
    cast,
    crew,
    studio,
    main_subject,
    awards,
    nominations,
    runtime,
    summary
) as
    select
        json_value(json_document, '$.movie_id' returning number)                  as movie_id,
        json_value(json_document, '$.title' returning varchar2(200 byte))         as title,
        json_value(json_document, '$.image_url' returning varchar2(4000 byte))    as image_url,
        json_value(json_document, '$.budget' returning number)                    as budget,
        json_value(json_document, '$.gross' returning number)                     gross,
        json_value(json_document, '$.list_price' returning number)                as list_price,
        json_value(json_document, '$.year' returning number)                      as year,
        to_date(json_value(json_document, '$.opening_date' returning varchar2(20)),
                'YYYY-MM-DD')                                                     as opening_date,
        nullif(
            json_query(json_document, '$.cast' returning varchar2(4000 byte)),
            'null'
        )                                                                         as cast,
        nullif(
            json_query(json_document, '$.crew' returning varchar2(4000 byte)),
            'null'
        )                                                                         as crew,
        nullif(
            json_query(json_document, '$.studio' returning varchar2(4000 byte)),
            'null'
        )                                                                         as studio,
        json_value(json_document, '$.main_subject' returning varchar2(4000 byte)) as main_subject,
        nullif(
            json_query(json_document, '$.awards' returning varchar2(4000 byte)),
            'null'
        )                                                                         as awards,
        nullif(
            json_query(json_document, '$.nominations' returning varchar2(4000 byte)),
            'null'
        )                                                                         as nominations,
        json_value(json_document, '$.runtime' returning number)                   as runtime,
        json_value(json_document, '$.summary' returning clob)                     as summary
    from
        "movieCollection" m;


-- sqlcl_snapshot {"hash":"d6c10586771a8ffc6acc761f4177fa00904b3f44","type":"VIEW","name":"MOVIES","schemaName":"MOVIESTREAM","sxml":""}