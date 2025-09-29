create or replace force editionable view v_target_customers (
    cust_id,
    customer_id,
    last_name,
    first_name,
    location,
    age,
    education,
    gender,
    has_kids,
    income_level,
    job_type,
    marital_status,
    num_cars,
    dog_owner
) as
    select
        cc.cust_id,
        rownum               as customer_id,
        cc.last_name,
        cc.first_name,
        cc.city
        || ', '
        || cc.state_province as location,
        age,
        education,
        gender,
        case
            when household_size > 2
                 and marital_status = 'M' then
                'YES'
            when household_size > 1
                 and marital_status = 'S' then
                'YES'
            else
                'NO'
        end                  as has_kids,
        income_level,
        job_type,
        case marital_status
            when 'M' then
                'Married'
            else
                'Single'
        end                  as marital_status,
        num_cars,
        case pet
            when 'Dog' then
                'YES'
            else
                'NO'
        end                  as dog_owner
    from
        customer_contact   cc,
        customer_extension ce
    where
            cc.cust_id = ce.cust_id
        and cc.city
            || ', '
            || cc.state_province in ( 'London, London', 'New York, New York', 'Los Angeles, California', 'Paris, Île-De-France', 'San Diego, California'
            ,
                                      'Chicago, Illinois' )
    order by
        1 asc;


-- sqlcl_snapshot {"hash":"73e6c2abdcbaf3acf0775b2575732faba8b3cdf9","type":"VIEW","name":"V_TARGET_CUSTOMERS","schemaName":"MOVIESTREAM","sxml":""}