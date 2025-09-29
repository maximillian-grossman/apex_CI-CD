create or replace procedure eba_demo_ig_data as
begin
    delete from eba_demo_ig_emp;

    delete from eba_demo_ig_dept;

    delete from eba_demo_ig_people;

    insert into eba_demo_ig_dept (
        deptno,
        dname,
        loc
    ) values ( 10,
               'ACCOUNTING',
               'NEW YORK' );

    insert into eba_demo_ig_dept (
        deptno,
        dname,
        loc
    ) values ( 20,
               'RESEARCH',
               'DALLAS' );

    insert into eba_demo_ig_dept (
        deptno,
        dname,
        loc
    ) values ( 30,
               'SALES',
               'CHICAGO' );

    insert into eba_demo_ig_dept (
        deptno,
        dname,
        loc
    ) values ( 40,
               'OPERATIONS',
               'BOSTON' );

    insert into eba_demo_ig_emp (
        empno,
        ename,
        job,
        mgr,
        hiredate,
        sal,
        comm,
        deptno,
        notes,
        onleave,
        rating
    ) values ( 7839,
               'KING',
               'PRESIDENT',
               null,
               to_date('17-11-81', 'DD-MM-RR'),
               5000,
               null,
               10,
               null,
               'N',
               null );

    insert into eba_demo_ig_emp (
        empno,
        ename,
        job,
        mgr,
        hiredate,
        sal,
        comm,
        deptno,
        notes,
        onleave,
        rating
    ) values ( 7698,
               'BLAKE',
               'MANAGER',
               7839,
               to_date('01-05-81', 'DD-MM-RR'),
               2850,
               null,
               30,
               'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
               ,
               'N',
               null );

    insert into eba_demo_ig_emp (
        empno,
        ename,
        job,
        mgr,
        hiredate,
        sal,
        comm,
        deptno,
        notes,
        onleave,
        rating
    ) values ( 7782,
               'CLARK',
               'MANAGER',
               7839,
               to_date('09-06-81', 'DD-MM-RR'),
               2450,
               null,
               10,
               null,
               'N',
               1 );

    insert into eba_demo_ig_emp (
        empno,
        ename,
        job,
        mgr,
        hiredate,
        sal,
        comm,
        deptno,
        notes,
        onleave,
        rating
    ) values ( 7566,
               'JONES',
               'MANAGER',
               7839,
               to_date('02-04-81', 'DD-MM-RR'),
               2975,
               null,
               20,
               null,
               'N',
               1 );

    insert into eba_demo_ig_emp (
        empno,
        ename,
        job,
        mgr,
        hiredate,
        sal,
        comm,
        deptno,
        notes,
        onleave,
        rating
    ) values ( 7788,
               'SCOTT',
               'ANALYST',
               7566,
               to_date('09-12-82', 'DD-MM-RR'),
               3000,
               null,
               20,
               null,
               'N',
               3 );

    insert into eba_demo_ig_emp (
        empno,
        ename,
        job,
        mgr,
        hiredate,
        sal,
        comm,
        deptno,
        notes,
        onleave,
        rating
    ) values ( 7902,
               'FORD',
               'ANALYST',
               7566,
               to_date('03-12-81', 'DD-MM-RR'),
               3000,
               null,
               20,
               null,
               'N',
               2 );

    insert into eba_demo_ig_emp (
        empno,
        ename,
        job,
        mgr,
        hiredate,
        sal,
        comm,
        deptno,
        notes,
        onleave,
        rating
    ) values ( 7369,
               'SMITH',
               'CLERK',
               7902,
               to_date('17-12-80', 'DD-MM-RR'),
               800,
               null,
               20,
               null,
               'N',
               null );

    insert into eba_demo_ig_emp (
        empno,
        ename,
        job,
        mgr,
        hiredate,
        sal,
        comm,
        deptno,
        notes,
        onleave,
        rating
    ) values ( 7499,
               'ALLEN',
               'SALESMAN',
               7698,
               to_date('20-02-81', 'DD-MM-RR'),
               1600,
               300,
               30,
               null,
               'N',
               0 );

    insert into eba_demo_ig_emp (
        empno,
        ename,
        job,
        mgr,
        hiredate,
        sal,
        comm,
        deptno,
        notes,
        onleave,
        rating
    ) values ( 7521,
               'WARD',
               'SALESMAN',
               7698,
               to_date('22-02-81', 'DD-MM-RR'),
               1250,
               500,
               30,
               null,
               'N',
               null );

    insert into eba_demo_ig_emp (
        empno,
        ename,
        job,
        mgr,
        hiredate,
        sal,
        comm,
        deptno,
        notes,
        onleave,
        rating
    ) values ( 7654,
               'MARTIN',
               'SALESMAN',
               7698,
               to_date('28-09-81', 'DD-MM-RR'),
               1250,
               1400,
               30,
               null,
               'N',
               4 );

    insert into eba_demo_ig_emp (
        empno,
        ename,
        job,
        mgr,
        hiredate,
        sal,
        comm,
        deptno,
        notes,
        onleave,
        rating
    ) values ( 7844,
               'TURNER',
               'SALESMAN',
               7698,
               to_date('08-09-81', 'DD-MM-RR'),
               1500,
               0,
               30,
               null,
               'N',
               1 );

    insert into eba_demo_ig_emp (
        empno,
        ename,
        job,
        mgr,
        hiredate,
        sal,
        comm,
        deptno,
        notes,
        onleave,
        rating
    ) values ( 7876,
               'ADAMS',
               'CLERK',
               7788,
               to_date('12-01-83', 'DD-MM-RR'),
               1100,
               null,
               20,
               'Medical Leave',
               'Y',
               2 );

    insert into eba_demo_ig_emp (
        empno,
        ename,
        job,
        mgr,
        hiredate,
        sal,
        comm,
        deptno,
        notes,
        onleave,
        rating
    ) values ( 7900,
               'JAMES',
               'CLERK',
               7698,
               to_date('03-12-81', 'DD-MM-RR'),
               950,
               null,
               30,
               null,
               'N',
               3 );

    insert into eba_demo_ig_emp (
        empno,
        ename,
        job,
        mgr,
        hiredate,
        sal,
        comm,
        deptno,
        notes,
        onleave,
        rating
    ) values ( 7934,
               'MILLER',
               'CLERK',
               7782,
               to_date('23-01-82', 'DD-MM-RR'),
               1300,
               null,
               10,
               null,
               'N',
               1 );

    insert into eba_demo_ig_people (
        id,
        name,
        link,
        gender,
        country,
        category,
        rating,
        from_yr,
        to_yr
    )
        with x as (
            select
                aaf.blob_content
            from
                apex_application_files aaf,
                apex_applications      aa
            where
                    aa.application_id = coalesce(apex_application_install.get_application_id,
                                                 to_number(v('APP_ID')))
                and aaf.flow_id = aa.application_id
                and aaf.filename = 'eba_demo_ig_people.json'
        )
        select
            y.id,
            y.name,
            y.link,
            y.gender,
            y.country,
            y.category,
            y.rating,
            y.from_yr,
            y.to_yr
        from
            x,
            json_table ( x.blob_content, '$[*]'
                    columns (
                        id number path '$.ID',
                        name varchar2 ( 255 ) path '$.NAME',
                        link varchar2 ( 255 ) path '$.LINK',
                        gender varchar2 ( 1 ) path '$.GENDER',
                        country varchar2 ( 50 ) path '$.COUNTRY',
                        category varchar2 ( 10 ) path '$.CATEGORY',
                        rating number path '$.RATING',
                        from_yr number path '$.FROM_YR',
                        to_yr number path '$.TO_YR'
                    )
                )
            y;

end;
/


-- sqlcl_snapshot {"hash":"23b0412af9305ac3c8e7fbe0327c4adc4a27a993","type":"PROCEDURE","name":"EBA_DEMO_IG_DATA","schemaName":"MOVIESTREAM","sxml":""}