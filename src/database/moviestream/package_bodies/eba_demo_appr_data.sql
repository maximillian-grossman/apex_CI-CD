create or replace package body eba_demo_appr_data is

    procedure delete_sample_data is
        l_app_id number := v('APP_ID');
    begin
        delete from eba_demo_appr_sal_history;

        delete from eba_demo_appr_emp;

        delete from eba_demo_appr_dept;

        delete from eba_demo_appr_approvers;

        apex_workflow.remove_development_instances(p_application_id => l_app_id);
        delete from eba_demo_appr_appraisals;

        delete from eba_demo_appr_laptop_requests;

        delete from eba_demo_appr_laptop_stock;

        delete from eba_demo_appr_vacation;

    end delete_sample_data; 
    -- 
    procedure insert_sample_data is
    begin
        insert into eba_demo_appr_approvers (
            username,
            task_def_static_id,
            job_codes,
            participant_role,
            min_salary
        ) values ( 'STEVE',
                   'SALARY_CHANGE',
                   'MANAGER',
                   'APPROVER',
                   3000 );

        insert into eba_demo_appr_approvers (
            username,
            task_def_static_id,
            job_codes,
            participant_role,
            min_salary
        ) values ( 'JANE',
                   'SALARY_CHANGE',
                   'SALESMAN:ANALYST:MANAGER',
                   'APPROVER',
                   null );

        insert into eba_demo_appr_approvers (
            username,
            task_def_static_id,
            job_codes,
            participant_role,
            min_salary
        ) values ( 'BO',
                   'SALARY_CHANGE',
                   'CLERK:MANAGER:PRESIDENT',
                   'APPROVER',
                   null );

        insert into eba_demo_appr_approvers (
            username,
            task_def_static_id,
            job_codes,
            participant_role,
            min_salary
        ) values ( 'PAT',
                   'SALARY_CHANGE',
                   null,
                   'ADMIN',
                   null );

        insert into eba_demo_appr_approvers (
            username,
            task_def_static_id,
            job_codes,
            participant_role,
            min_salary
        ) values ( 'PAT',
                   'SALARY_CHANGE',
                   null,
                   'APPROVER',
                   null );

        insert into eba_demo_appr_dept (
            deptno,
            dname,
            loc
        ) values ( 10,
                   'ACCOUNTING',
                   'NEW YORK' );

        insert into eba_demo_appr_dept (
            deptno,
            dname,
            loc
        ) values ( 20,
                   'RESEARCH',
                   'DALLAS' );

        insert into eba_demo_appr_dept (
            deptno,
            dname,
            loc
        ) values ( 30,
                   'SALES',
                   'CHICAGO' );

        insert into eba_demo_appr_dept (
            deptno,
            dname,
            loc
        ) values ( 40,
                   'OPERATIONS',
                   'BOSTON' );

        insert into eba_demo_appr_emp (
            empno,
            ename,
            job,
            mgr,
            hiredate,
            sal,
            comm,
            deptno,
            bank_account
        ) values ( 7369,
                   'SMITH',
                   'CLERK',
                   7902,
                   date '1980-12-17',
                   800,
                   null,
                   20,
                   'L59 2676749090' );

        insert into eba_demo_appr_emp (
            empno,
            ename,
            job,
            mgr,
            hiredate,
            sal,
            comm,
            deptno,
            bank_account
        ) values ( 7499,
                   'ALLEN',
                   'SALESMAN',
                   7698,
                   date '1981-02-20',
                   1600,
                   300,
                   30,
                   'NL11 2792059852' );

        insert into eba_demo_appr_emp (
            empno,
            ename,
            job,
            mgr,
            hiredate,
            sal,
            comm,
            deptno,
            bank_account
        ) values ( 7521,
                   'WARD',
                   'SALESMAN',
                   7698,
                   date '1981-02-22',
                   1250,
                   500,
                   30,
                   'DE93 5765445093' );

        insert into eba_demo_appr_emp (
            empno,
            ename,
            job,
            mgr,
            hiredate,
            sal,
            comm,
            deptno,
            bank_account
        ) values ( 7566,
                   'JONES',
                   'MANAGER',
                   7839,
                   date '1981-04-02',
                   2975,
                   null,
                   20,
                   'FR17 2643471186' );

        insert into eba_demo_appr_emp (
            empno,
            ename,
            job,
            mgr,
            hiredate,
            sal,
            comm,
            deptno,
            bank_account
        ) values ( 7654,
                   'MARTIN',
                   'SALESMAN',
                   7698,
                   date '1981-09-28',
                   1250,
                   1400,
                   30,
                   'ES15 2387378313' );

        insert into eba_demo_appr_emp (
            empno,
            ename,
            job,
            mgr,
            hiredate,
            sal,
            comm,
            deptno,
            bank_account
        ) values ( 7698,
                   'BLAKE',
                   'MANAGER',
                   7839,
                   date '1981-05-01',
                   2850,
                   null,
                   30,
                   'DE37 1114828059' );

        insert into eba_demo_appr_emp (
            empno,
            ename,
            job,
            mgr,
            hiredate,
            sal,
            comm,
            deptno,
            bank_account
        ) values ( 7782,
                   'CLARK',
                   'MANAGER',
                   7839,
                   date '1981-06-09',
                   2450,
                   null,
                   10,
                   'NL43 7896495402' );

        insert into eba_demo_appr_emp (
            empno,
            ename,
            job,
            mgr,
            hiredate,
            sal,
            comm,
            deptno,
            bank_account
        ) values ( 7788,
                   'SCOTT',
                   'ANALYST',
                   7566,
                   date '1982-12-09',
                   3000,
                   null,
                   20,
                   'ES22 3307779590' );

        insert into eba_demo_appr_emp (
            empno,
            ename,
            job,
            mgr,
            hiredate,
            sal,
            comm,
            deptno,
            bank_account
        ) values ( 7839,
                   'KING',
                   'PRESIDENT',
                   null,
                   date '1981-11-17',
                   5000,
                   null,
                   10,
                   'ES56 3325856285' );

        insert into eba_demo_appr_emp (
            empno,
            ename,
            job,
            mgr,
            hiredate,
            sal,
            comm,
            deptno,
            bank_account
        ) values ( 7844,
                   'TURNER',
                   'SALESMAN',
                   7698,
                   date '1981-09-08',
                   1500,
                   0,
                   30,
                   'FR61 7629317593' );

        insert into eba_demo_appr_emp (
            empno,
            ename,
            job,
            mgr,
            hiredate,
            sal,
            comm,
            deptno,
            bank_account
        ) values ( 7876,
                   'ADAMS',
                   'CLERK',
                   7788,
                   date '1983-01-12',
                   1100,
                   null,
                   20,
                   'IT45 2343833140' );

        insert into eba_demo_appr_emp (
            empno,
            ename,
            job,
            mgr,
            hiredate,
            sal,
            comm,
            deptno,
            bank_account
        ) values ( 7900,
                   'JAMES',
                   'CLERK',
                   7698,
                   date '1981-12-03',
                   950,
                   null,
                   30,
                   'ES29 8075401565' );

        insert into eba_demo_appr_emp (
            empno,
            ename,
            job,
            mgr,
            hiredate,
            sal,
            comm,
            deptno,
            bank_account
        ) values ( 7902,
                   'FORD',
                   'ANALYST',
                   7566,
                   date '1981-12-03',
                   3000,
                   null,
                   20,
                   'DE67 0549659906' );

        insert into eba_demo_appr_emp (
            empno,
            ename,
            job,
            mgr,
            hiredate,
            sal,
            comm,
            deptno,
            bank_account
        ) values ( 7934,
                   'MILLER',
                   'CLERK',
                   7782,
                   date '1982-01-23',
                   1300,
                   null,
                   10,
                   'ES94 8295486525' );

        insert into eba_demo_appr_emp (
            empno,
            ename,
            job,
            mgr,
            hiredate,
            sal,
            comm,
            deptno,
            bank_account
        ) values ( 8876,
                   'PAT',
                   'CLERK',
                   8900,
                   date '1983-03-17',
                   1100,
                   null,
                   40,
                   'IT18 8496036712' );

        insert into eba_demo_appr_emp (
            empno,
            ename,
            job,
            mgr,
            hiredate,
            sal,
            comm,
            deptno,
            bank_account
        ) values ( 8900,
                   'BO',
                   'MANAGER',
                   7839,
                   date '1981-06-12',
                   2950,
                   null,
                   40,
                   'B13 9855830234' );

        insert into eba_demo_appr_emp (
            empno,
            ename,
            job,
            mgr,
            hiredate,
            sal,
            comm,
            deptno,
            bank_account
        ) values ( 8902,
                   'STEVE',
                   'CLERK',
                   8900,
                   date '1981-09-15',
                   2000,
                   null,
                   40,
                   'CH02 5018944284' );

        insert into eba_demo_appr_emp (
            empno,
            ename,
            job,
            mgr,
            hiredate,
            sal,
            comm,
            deptno,
            bank_account
        ) values ( 8934,
                   'JANE',
                   'CLERK',
                   8900,
                   date '1983-05-23',
                   1300,
                   null,
                   40,
                   'GB55 6220604619' );

        insert into eba_demo_appr_laptop_stock (
            laptop_type,
            amount
        ) values ( 'MAC',
                   1 );

        insert into eba_demo_appr_laptop_stock (
            laptop_type,
            amount
        ) values ( 'WIN',
                   0 );

        declare
            l_num_adjustments number;
            l_pct_adjustment  number;
            l_inc_sal         number;
            l_cur_sal         number;
            l_prev_sal        number;
            l_period          number;
            l_today           date := trunc(sysdate);
        begin
            for e in (
                select
                    empno,
                    sal,
                    hiredate,
                    extract(year from sysdate) - extract(year from hiredate) as years
                from
                    eba_demo_appr_emp
            ) loop
                if e.years < 3 then
                    insert into eba_demo_appr_sal_history (
                        empno,
                        new_sal,
                        approval_date
                    ) values ( e.empno,
                               e.sal,
                               e.hiredate );

                end if; 
            -- random number of salary adjustments between sysdate and hiredate 
                select
                    round(
                        dbms_random.value(1.5, e.years / 2 + 0.5),
                        0
                    )
                into l_num_adjustments
                from
                    dual;

                l_cur_sal := e.sal;
                l_inc_sal := l_cur_sal;
                l_period := round(e.years / l_num_adjustments, 0) * 12;
                for j in 1..l_num_adjustments loop 
                -- random percent of adjustment   
                    insert into eba_demo_appr_sal_history (
                        empno,
                        new_sal,
                        approval_date
                    ) values ( e.empno,
                               l_inc_sal,
                               add_months(l_today,(-1) * l_period * j) );

                    select
                        round((1 - round(
                            dbms_random.value(2.5, 25),
                            0
                        ) / 100) * l_cur_sal,
                              -1)
                    into l_inc_sal
                    from
                        dual;

                    l_cur_sal := l_inc_sal;
                end loop;

            end loop;
        end;

    end insert_sample_data;   
    --
    procedure reset_settings is
    begin
        apex_app_setting.set_value('EMP_APPRAISAL_EXTRA_VP_REVIEWERS', null);
        apex_app_setting.set_value('TEMPORARY_BUSINESS_ADMIN', null);
    end reset_settings;
    -- 
    procedure install_sample_data is
    begin
        delete_sample_data;
        insert_sample_data;
        commit;
        reset_settings;
    end install_sample_data; 
    -- 
    function user_exists (
        p_username varchar2
    ) return boolean is
    begin
        return not apex_util.is_username_unique(p_username);
    end user_exists;

end;
/


-- sqlcl_snapshot {"hash":"3b13dc06c050cc4ac2a1cafbd43f0cecc2d351e4","type":"PACKAGE_BODY","name":"EBA_DEMO_APPR_DATA","schemaName":"MOVIESTREAM","sxml":""}