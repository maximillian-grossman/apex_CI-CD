create or replace package body eba_demo_data_load as

    --------------------------------------------------------------------------------
    -- global variable to hold the CSV contents being extracted from the uploaded
    -- ZIP archive; see page 17.
    --------------------------------------------------------------------------------
    g_current_blob         blob;

    --------------------------------------------------------------------------------
    -- constants
    --------------------------------------------------------------------------------
    c_mime_application_zip constant varchar2(30) := 'application/zip';

    --------------------------------------------------------------------------------
    -- resets all sample tables
    --------------------------------------------------------------------------------
    procedure reset_sample is
    begin
        delete eba_demo_load_emp;

        delete eba_demo_load_dept;

        delete eba_demo_load_emp_err$;

        insert into eba_demo_load_dept (
            deptno,
            dname,
            loc
        ) values ( 10,
                   'ACCOUNTING',
                   'NEW YORK' );

        insert into eba_demo_load_dept (
            deptno,
            dname,
            loc
        ) values ( 20,
                   'RESEARCH',
                   'DALLAS' );

        insert into eba_demo_load_dept (
            deptno,
            dname,
            loc
        ) values ( 30,
                   'SALES',
                   'CHICAGO' );

        insert into eba_demo_load_dept (
            deptno,
            dname,
            loc
        ) values ( 40,
                   'OPERATIONS',
                   'BOSTON' );

        insert into eba_demo_load_emp (
            empno,
            ename,
            job,
            mgr,
            hiredate,
            sal,
            comm,
            deptno
        ) values ( 7839,
                   'KING',
                   'PRESIDENT',
                   null,
                   to_date('17-11-81', 'DD-MM-RR'),
                   5000,
                   null,
                   10 );

        insert into eba_demo_load_emp (
            empno,
            ename,
            job,
            mgr,
            hiredate,
            sal,
            comm,
            deptno
        ) values ( 7698,
                   'BLAKE',
                   'MANAGER',
                   7839,
                   to_date('01-05-81', 'DD-MM-RR'),
                   2850,
                   null,
                   30 );

        insert into eba_demo_load_emp (
            empno,
            ename,
            job,
            mgr,
            hiredate,
            sal,
            comm,
            deptno
        ) values ( 7782,
                   'CLARK',
                   'MANAGER',
                   7839,
                   to_date('09-06-81', 'DD-MM-RR'),
                   2450,
                   null,
                   10 );

        insert into eba_demo_load_emp (
            empno,
            ename,
            job,
            mgr,
            hiredate,
            sal,
            comm,
            deptno
        ) values ( 7566,
                   'JONES',
                   'MANAGER',
                   7839,
                   to_date('02-04-81', 'DD-MM-RR'),
                   2975,
                   null,
                   20 );

        insert into eba_demo_load_emp (
            empno,
            ename,
            job,
            mgr,
            hiredate,
            sal,
            comm,
            deptno
        ) values ( 7788,
                   'SCOTT',
                   'ANALYST',
                   7566,
                   to_date('09-12-82', 'DD-MM-RR'),
                   3000,
                   null,
                   20 );

        insert into eba_demo_load_emp (
            empno,
            ename,
            job,
            mgr,
            hiredate,
            sal,
            comm,
            deptno
        ) values ( 7902,
                   'FORD',
                   'ANALYST',
                   7566,
                   to_date('03-12-81', 'DD-MM-RR'),
                   3000,
                   null,
                   20 );

        insert into eba_demo_load_emp (
            empno,
            ename,
            job,
            mgr,
            hiredate,
            sal,
            comm,
            deptno
        ) values ( 7369,
                   'SMITH',
                   'CLERK',
                   7902,
                   to_date('17-12-80', 'DD-MM-RR'),
                   800,
                   null,
                   20 );

        insert into eba_demo_load_emp (
            empno,
            ename,
            job,
            mgr,
            hiredate,
            sal,
            comm,
            deptno
        ) values ( 7499,
                   'ALLEN',
                   'SALESMAN',
                   7698,
                   to_date('20-02-81', 'DD-MM-RR'),
                   1600,
                   300,
                   30 );

        insert into eba_demo_load_emp (
            empno,
            ename,
            job,
            mgr,
            hiredate,
            sal,
            comm,
            deptno
        ) values ( 7521,
                   'WARD',
                   'SALESMAN',
                   7698,
                   to_date('22-02-81', 'DD-MM-RR'),
                   1250,
                   500,
                   30 );

        insert into eba_demo_load_emp (
            empno,
            ename,
            job,
            mgr,
            hiredate,
            sal,
            comm,
            deptno
        ) values ( 7654,
                   'MARTIN',
                   'SALESMAN',
                   7698,
                   to_date('28-09-81', 'DD-MM-RR'),
                   1250,
                   1400,
                   30 );

        insert into eba_demo_load_emp (
            empno,
            ename,
            job,
            mgr,
            hiredate,
            sal,
            comm,
            deptno
        ) values ( 7844,
                   'TURNER',
                   'SALESMAN',
                   7698,
                   to_date('08-09-81', 'DD-MM-RR'),
                   1500,
                   0,
                   30 );

        insert into eba_demo_load_emp (
            empno,
            ename,
            job,
            mgr,
            hiredate,
            sal,
            comm,
            deptno
        ) values ( 7876,
                   'ADAMS',
                   'CLERK',
                   7788,
                   to_date('12-01-83', 'DD-MM-RR'),
                   1100,
                   null,
                   20 );

        insert into eba_demo_load_emp (
            empno,
            ename,
            job,
            mgr,
            hiredate,
            sal,
            comm,
            deptno
        ) values ( 7900,
                   'JAMES',
                   'CLERK',
                   7698,
                   to_date('03-12-81', 'DD-MM-RR'),
                   950,
                   null,
                   30 );

        insert into eba_demo_load_emp (
            empno,
            ename,
            job,
            mgr,
            hiredate,
            sal,
            comm,
            deptno
        ) values ( 7934,
                   'MILLER',
                   'CLERK',
                   7782,
                   to_date('23-01-82', 'DD-MM-RR'),
                   1300,
                   null,
                   10 );

        delete eba_demo_load_sales;

    end reset_sample;

    --------------------------------------------------------------------------------
    -- extracts the CSV file from an uploaded ZIP archive. Only the first CSV file
    -- is returned.
    --------------------------------------------------------------------------------
    function zip_to_csv (
        p_blob_content in blob,
        p_mime_type    in varchar2
    ) return blob is
        l_zipped_file   blob;
        l_unzipped_file blob;
        l_zip_files     apex_zip.t_files;
        l_file          blob;
    begin
        apex_debug.enter('zip_to_csv', 'p_mime_type', p_mime_type);
        if p_mime_type = c_mime_application_zip then
            l_zipped_file := p_blob_content;
            l_zip_files := apex_zip.get_files(l_zipped_file);
            for i in 1..l_zip_files.count loop
                apex_debug.info('Zip Entry %s = %s',
                                i,
                                l_zip_files(i));
                if lower(l_zip_files(i)) like '%.csv' then
                    -- accept one unzipped CSV file
                    l_unzipped_file := apex_zip.get_file_content(l_zipped_file,
                                                                 l_zip_files(i));
                    exit;
                end if;

            end loop;

            l_file := l_unzipped_file;
        else
            l_file := p_blob_content;
        end if;

        return l_file;
    end zip_to_csv;

    --------------------------------------------------------------------------------
    -- store a BLOB in the package global for later use.
    --------------------------------------------------------------------------------
    procedure set_file_blob (
        p_blob in blob
    ) is
    begin
        g_current_blob := p_blob;
    end set_file_blob;

    --------------------------------------------------------------------------------
    -- get the BLOB from the package global.
    --------------------------------------------------------------------------------
    function get_file_blob return blob is
    begin
        return g_current_blob;
    end get_file_blob;

end eba_demo_data_load;
/


-- sqlcl_snapshot {"hash":"f22c285df8d7fb53d6626bf82565d3befb1955c6","type":"PACKAGE_BODY","name":"EBA_DEMO_DATA_LOAD","schemaName":"MOVIESTREAM","sxml":""}