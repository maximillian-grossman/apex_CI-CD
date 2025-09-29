create or replace force editionable view emp_dept_v (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno,
    dname,
    loc
) as
    select
        e.empno,
        e.ename,
        e.job,
        (
            select
                m.ename
            from
                eba_demo_dg_emp m
            where
                e.mgr = m.empno
        ) mgr,
        e.hiredate,
        e.sal,
        e.comm,
        d.deptno,
        d.dname,
        d.loc
    from
        eba_demo_dg_emp  e,
        eba_demo_dg_dept d
    where
        e.deptno = d.deptno (+);


-- sqlcl_snapshot {"hash":"23c78c4430871c995105f724652c9eb8142347dd","type":"VIEW","name":"EMP_DEPT_V","schemaName":"MOVIESTREAM","sxml":""}