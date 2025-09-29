create table "EBA_RESTDEMO_SAMPLE_EMP" (
    EMPNO     NUMBER,
    ENAME     VARCHAR2(4000),
    JOB       VARCHAR2(4000),
    MGR       NUMBER,
    HIREDATE  DATE,
    SAL       NUMBER,
    DEPTNO    NUMBER,
    RN        NUMBER
);

create table eba_restdemo_sample_github(
    name          varchar2(255),
    language      varchar2(50),
    description   varchar2(4000),
    updated_on    timestamp,
    created_on    timestamp,
    issues_cnt    number 
);

create table eba_restdemo_sample_urls(
    name         varchar2(255) not null primary key,
    url          varchar2(500) not null,
    https_host   varchar2(500),
    last_status  varchar2(500));
    
insert into eba_restdemo_sample_urls ( name, url ) values ('Github API', 'https://api.github.com');

create table eba_restdemo_sample_lang (
    name  varchar2(50) not null primary key,
    created_by varchar2(50) not null );
    
    
insert into eba_restdemo_sample_lang values ('Java', 'James Gosling');
insert into eba_restdemo_sample_lang values ('PLSQL', 'Oracle Corporation');
insert into eba_restdemo_sample_lang values ('Ruby', 'Yukihiro Matsumoto' );
insert into eba_restdemo_sample_lang values ('Python', 'Guido van Rossum');
insert into eba_restdemo_sample_lang values ('CSS', 'Hakon Wium Lie');
insert into eba_restdemo_sample_lang values ('C#', 'Microsoft Corporation' );
insert into eba_restdemo_sample_lang values ('Go', 'Google');
insert into eba_restdemo_sample_lang values ('Shell', 'N/A');
insert into eba_restdemo_sample_lang values ('SQLPL', 'N/A');
