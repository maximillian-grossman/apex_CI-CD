
--
        
DECLARE
  l_roles     OWA.VC_ARR;
  l_modules   OWA.VC_ARR;
  l_patterns  OWA.VC_ARR;

BEGIN
  ORDS.ENABLE_SCHEMA(
      p_enabled             => TRUE,
      p_url_mapping_type    => 'BASE_PATH',
      p_url_mapping_pattern => 'moviestream',
      p_auto_rest_auth      => FALSE);

  ORDS.DEFINE_MODULE(
      p_module_name    => 'api',
      p_base_path      => '/api/',
      p_items_per_page => 25,
      p_status         => 'PUBLISHED',
      p_comments       => 'RESTful services leveraging AI to deliver analytics across the organization');

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'api',
      p_pattern        => 'ai/question/:question',
      p_priority       => 1,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'api',
      p_pattern        => 'ai/question/:question',
      p_method         => 'GET',
      p_source_type    => 'plsql/block',
      p_items_per_page => 25,
      p_mimes_allowed  => NULL,
      p_comments       => 'Please ask a natural language query from your private data in Autonomous Database',
      p_source         => 
'declare
    l_result sys_refcursor;
    begin
    genai.ask_question (
        question => :question,
        message => :message,
        sqlquery => :sql,
        resultset => l_result
    );
    :result := l_result;

    end;');

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'api',
      p_pattern            => 'ai/question/:question',
      p_method             => 'GET',
      p_name               => 'question',
      p_bind_variable_name => 'question',
      p_source_type        => 'RESPONSE',
      p_param_type         => 'STRING',
      p_access_method      => 'INOUT',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'api',
      p_pattern            => 'ai/question/:question',
      p_method             => 'GET',
      p_name               => 'sql',
      p_bind_variable_name => 'sql',
      p_source_type        => 'RESPONSE',
      p_param_type         => 'STRING',
      p_access_method      => 'OUT',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'api',
      p_pattern            => 'ai/question/:question',
      p_method             => 'GET',
      p_name               => 'result',
      p_bind_variable_name => 'result',
      p_source_type        => 'RESPONSE',
      p_param_type         => 'RESULTSET',
      p_access_method      => 'OUT',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'api',
      p_pattern            => 'ai/question/:question',
      p_method             => 'GET',
      p_name               => 'message',
      p_bind_variable_name => 'message',
      p_source_type        => 'RESPONSE',
      p_param_type         => 'STRING',
      p_access_method      => 'OUT',
      p_comments           => NULL);

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'api',
      p_pattern        => 'data/customer/:last_name',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => 'Returns the details for a customers. Uses fuzzy matching on the last name.');

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'api',
      p_pattern        => 'data/customer/:last_name',
      p_method         => 'GET',
      p_source_type    => 'plsql/block',
      p_mimes_allowed  => NULL,
      p_comments       => NULL,
      p_source         => 
'declare
        l_last_name varchar2(100);
        l_cur SYS_REFCURSOR;
    begin    
        l_last_name := lower(:last_name);

        open l_cur for
            select 
                last_name,
                first_name,
                email,
                state_province,
                country,
                short_name as segment
            from customer c, customer_segment cs
            where c.segment_id = cs.segment_id
            and utl_match.jaro_winkler_similarity(lower(last_name), l_last_name) >= 90
            order by utl_match.jaro_winkler_similarity(lower(last_name), l_last_name) desc;

        :result := l_cur;
    end;');

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'api',
      p_pattern            => 'data/customer/:last_name',
      p_method             => 'GET',
      p_name               => 'last_name',
      p_bind_variable_name => 'last_name',
      p_source_type        => 'URI',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'api',
      p_pattern            => 'data/customer/:last_name',
      p_method             => 'GET',
      p_name               => 'result',
      p_bind_variable_name => 'result',
      p_source_type        => 'RESPONSE',
      p_param_type         => 'RESULTSET',
      p_access_method      => 'OUT',
      p_comments           => NULL);

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'api',
      p_pattern        => 'data/movie/:title',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => 'Enter the title');

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'api',
      p_pattern        => 'data/movie/:title',
      p_method         => 'GET',
      p_source_type    => 'plsql/block',
      p_mimes_allowed  => NULL,
      p_comments       => NULL,
      p_source         => 
'declare
        l_title varchar2(4000);
        l_cur SYS_REFCURSOR;
    begin
        l_title := :title;
        open l_cur for 
            select     
                title,
                budget,
                gross,
                year,
                opening_date,
                summary,
                utl_match.jaro_winkler_similarity(lower(title), l_title) as similarity
            from movies
            where utl_match.jaro_winkler_similarity(lower(title), l_title) >=70
            order by similarity desc;

        :result := l_cur;
    end;');

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'api',
      p_pattern            => 'data/movie/:title',
      p_method             => 'GET',
      p_name               => 'title',
      p_bind_variable_name => 'title',
      p_source_type        => 'URI',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => 'Movie title');

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'api',
      p_pattern            => 'data/movie/:title',
      p_method             => 'GET',
      p_name               => 'result',
      p_bind_variable_name => 'result',
      p_source_type        => 'RESPONSE',
      p_param_type         => 'RESULTSET',
      p_access_method      => 'OUT',
      p_comments           => NULL);

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'api',
      p_pattern        => 'ai/promotion/:customerID',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => 'Get a promotion for the specified customer');

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'api',
      p_pattern        => 'ai/promotion/:customerID',
      p_method         => 'GET',
      p_source_type    => 'plsql/block',
      p_items_per_page => 25,
      p_mimes_allowed  => NULL,
      p_comments       => NULL,
      p_source         => 
'begin
    :promotion := genai.get_response ( 
            query_parameter => :customerID,
            project_id => 1 ); 
    end;');

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'api',
      p_pattern            => 'ai/promotion/:customerID',
      p_method             => 'GET',
      p_name               => 'customerID',
      p_bind_variable_name => 'customerID',
      p_source_type        => 'URI',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => 'The customer that will receive the promotion');

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'api',
      p_pattern            => 'ai/promotion/:customerID',
      p_method             => 'GET',
      p_name               => 'prompt',
      p_bind_variable_name => 'prompt',
      p_source_type        => 'RESPONSE',
      p_param_type         => 'RESULTSET',
      p_access_method      => 'OUT',
      p_comments           => 'The generated prompt sent to the AI model');

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'api',
      p_pattern            => 'ai/promotion/:customerID',
      p_method             => 'GET',
      p_name               => 'promotion',
      p_bind_variable_name => 'promotion',
      p_source_type        => 'RESPONSE',
      p_param_type         => 'STRING',
      p_access_method      => 'OUT',
      p_comments           => 'The generated promotion');

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'api',
      p_pattern        => 'ai/supportChatSummary/:chatID',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => 'Provides the summary of the support chat. Includes the customer sentiment and resolution.');

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'api',
      p_pattern        => 'ai/supportChatSummary/:chatID',
      p_method         => 'GET',
      p_source_type    => 'plsql/block',
      p_items_per_page => 25,
      p_mimes_allowed  => NULL,
      p_comments       => 'Summary for a support chat.',
      p_source         => 
'begin
        :summary := genai.get_response ( 
            query_parameter => :chatID,
            project_id => 2); 
    end;');

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'api',
      p_pattern            => 'ai/supportChatSummary/:chatID',
      p_method             => 'GET',
      p_name               => 'chatID',
      p_bind_variable_name => 'chatID',
      p_source_type        => 'URI',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => 'The identifier for the support chat');

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'api',
      p_pattern            => 'ai/supportChatSummary/:chatID',
      p_method             => 'GET',
      p_name               => 'summary',
      p_bind_variable_name => 'summary',
      p_source_type        => 'RESPONSE',
      p_param_type         => 'STRING',
      p_access_method      => 'OUT',
      p_comments           => 'Provides the summary of the support chat. Includes sentiment and resolution.');

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'api',
      p_pattern        => 'ai/thingsToDo/:customerID',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => 'Things for a traveler to do at a location based on their personal demographics.');

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'api',
      p_pattern        => 'ai/thingsToDo/:customerID',
      p_method         => 'GET',
      p_source_type    => 'plsql/block',
      p_items_per_page => 25,
      p_mimes_allowed  => NULL,
      p_comments       => NULL,
      p_source         => 
'begin
    :todo := genai.get_response ( 
            query_parameter => :customerID,
            project_id => 3 ); 
    end;');

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'api',
      p_pattern            => 'ai/thingsToDo/:customerID',
      p_method             => 'GET',
      p_name               => 'todo',
      p_bind_variable_name => 'todo',
      p_source_type        => 'RESPONSE',
      p_param_type         => 'STRING',
      p_access_method      => 'OUT',
      p_comments           => 'Things to do at the location.');

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'api',
      p_pattern            => 'ai/thingsToDo/:customerID',
      p_method             => 'GET',
      p_name               => 'customerID',
      p_bind_variable_name => 'customerID',
      p_source_type        => 'URI',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => 'The customer ID for the traveler');

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'api',
      p_pattern        => 'bedtimestory/create',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'api',
      p_pattern        => 'bedtimestory/create',
      p_method         => 'POST',
      p_source_type    => 'plsql/block',
      p_items_per_page => 25,
      p_mimes_allowed  => NULL,
      p_comments       => NULL,
      p_source         => 
'begin
    create_story (
        cust_id => :cust_id,
        characters => :characters,
        movies => :movies,
        title => :title,
        story => :story
        );
    end;');

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'api',
      p_pattern            => 'bedtimestory/create',
      p_method             => 'POST',
      p_name               => 'cust_id',
      p_bind_variable_name => 'cust_id',
      p_source_type        => 'HEADER',
      p_param_type         => 'INT',
      p_access_method      => 'IN',
      p_comments           => 'Story created for this customer id');

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'api',
      p_pattern            => 'bedtimestory/create',
      p_method             => 'POST',
      p_name               => 'characters',
      p_bind_variable_name => 'characters',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => 'This is the list of characters that will appear in the story. They come from your customer profile and your friends.
    Pass an array of names:
    ["Sari", "Mom"]');

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'api',
      p_pattern            => 'bedtimestory/create',
      p_method             => 'POST',
      p_name               => 'movies',
      p_bind_variable_name => 'movies',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => 'The list of movies that the bedtime story will be based on. This should be passed as an array:
    ["Big", "Finding Nemo"]');

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'api',
      p_pattern            => 'bedtimestory/create',
      p_method             => 'POST',
      p_name               => 'title',
      p_bind_variable_name => 'title',
      p_source_type        => 'RESPONSE',
      p_param_type         => 'STRING',
      p_access_method      => 'OUT',
      p_comments           => 'The generated title for the story');

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'api',
      p_pattern            => 'bedtimestory/create',
      p_method             => 'POST',
      p_name               => 'story',
      p_bind_variable_name => 'story',
      p_source_type        => 'RESPONSE',
      p_param_type         => 'STRING',
      p_access_method      => 'OUT',
      p_comments           => 'The generated story.');

  ORDS.DEFINE_MODULE(
      p_module_name    => 'oracle.example.hr',
      p_base_path      => '/hr/',
      p_items_per_page => 25,
      p_status         => 'PUBLISHED',
      p_comments       => NULL);

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'oracle.example.hr',
      p_pattern        => 'empsec/:empname',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'oracle.example.hr',
      p_pattern        => 'empsec/:empname',
      p_method         => 'GET',
      p_source_type    => 'json/collection',
      p_items_per_page => 25,
      p_mimes_allowed  => NULL,
      p_comments       => NULL,
      p_source         => 
'select empno, ename, deptno, job from emp 
	where ((select job from emp where ename = :empname) IN (''PRESIDENT'', ''MANAGER'')) 
    OR  
    (deptno = (select deptno from emp where ename = :empname)) 
order by deptno, ename
');

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'oracle.example.hr',
      p_pattern        => 'empsecformat/:empname',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'oracle.example.hr',
      p_pattern        => 'empsecformat/:empname',
      p_method         => 'GET',
      p_source_type    => 'plsql/block',
      p_items_per_page => 25,
      p_mimes_allowed  => NULL,
      p_comments       => NULL,
      p_source         => 
'DECLARE
  prevdeptno     number;
  total_rows     number;
  deptloc        varchar2(20);
  deptname       varchar2(20);
  
  CURSOR         getemps is select * from emp 
                             start with ename = :empname
                           connect by prior empno = mgr
                             order siblings by deptno, ename;
BEGIN
  sys.htp.htmlopen;
  sys.htp.headopen;
  sys.htp.title(''Hierarchical Department Report for Employee ''||wwv_flow_escape.html(:empname));
  sys.htp.headclose;
  sys.htp.bodyopen;
 
  for l_employee in getemps 
  loop
      if l_employee.deptno != prevdeptno or prevdeptno is null then
          select dname, loc 
            into deptname, deptloc 
            from dept 
           where deptno = l_employee.deptno;
           
          if prevdeptno is not null then
              sys.htp.print(''</ul>'');
          end if;

          sys.htp.print(''Department '' || wwv_flow_escape.html(deptname) || '' located in '' || wwv_flow_escape.html(deptloc)' || ' || ''<p/>'');
          sys.htp.print(''<ul>'');
      end if;

      sys.htp.print(''<li>'' || wwv_flow_escape.html(l_employee.ename) || '', ''  || wwv_flow_escape.html(l_employee.empno) || '', '' || 
                        wwv_flow_escape.html(l_employee.job) || '', '' || wwv_flow_escape.html(l_employee.sal) || ''</li>'');

      prevdeptno := l_employee.deptno;
      total_rows := getemps%ROWCOUNT;
      
  end loop;

  if total_rows > 0 then
      sys.htp.print(''</ul>'');
  end if;

  sys.htp.bodyclose;
  sys.htp.htmlclose;
END;');

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'oracle.example.hr',
      p_pattern        => 'employees/',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'oracle.example.hr',
      p_pattern        => 'employees/',
      p_method         => 'GET',
      p_source_type    => 'json/collection',
      p_items_per_page => 25,
      p_mimes_allowed  => NULL,
      p_comments       => NULL,
      p_source         => 
'select empno "$uri", rn, empno, ename, job, hiredate, mgr, sal, comm, deptno
  from (
       select emp.*
            , row_number() over (order by empno) rn
         from emp
       ) tmp');

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'oracle.example.hr',
      p_pattern        => 'version/',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'oracle.example.hr',
      p_pattern        => 'version/',
      p_method         => 'GET',
      p_source_type    => 'plsql/block',
      p_items_per_page => 25,
      p_mimes_allowed  => NULL,
      p_comments       => NULL,
      p_source         => 
'begin 
 sys.htp.p(''{"version": "23.1"}'');
end;');

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'oracle.example.hr',
      p_pattern        => 'employees/:id',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'oracle.example.hr',
      p_pattern        => 'employees/:id',
      p_method         => 'GET',
      p_source_type    => 'json/item',
      p_items_per_page => 25,
      p_mimes_allowed  => NULL,
      p_comments       => NULL,
      p_source         => 
'select * from emp
where empno = :id');

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'oracle.example.hr',
      p_pattern        => 'employees/:id',
      p_method         => 'PUT',
      p_source_type    => 'plsql/block',
      p_items_per_page => 25,
      p_mimes_allowed  => NULL,
      p_comments       => NULL,
      p_source         => 
'begin
    update emp set ename = :ename, job = :job, hiredate = :hiredate, mgr = :mgr, sal = :sal, comm = :comm, deptno = :deptno
    where empno = :id;
    :status := 200;
    :location := :id;
exception
    when others then
        :status := 400;
        sys.htp.p( sys.htf.escape_sc(sqlerrm) );
end;');

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'oracle.example.hr',
      p_pattern            => 'employees/:id',
      p_method             => 'PUT',
      p_name               => 'X-APEX-FORWARD',
      p_bind_variable_name => 'location',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'OUT',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'oracle.example.hr',
      p_pattern            => 'employees/:id',
      p_method             => 'PUT',
      p_name               => 'ID',
      p_bind_variable_name => 'id',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'oracle.example.hr',
      p_pattern            => 'employees/:id',
      p_method             => 'PUT',
      p_name               => 'X-APEX-STATUS-CODE',
      p_bind_variable_name => 'status',
      p_source_type        => 'HEADER',
      p_param_type         => 'INT',
      p_access_method      => 'OUT',
      p_comments           => NULL);

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'oracle.example.hr',
      p_pattern        => 'empinfo/',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'oracle.example.hr',
      p_pattern        => 'empinfo/',
      p_method         => 'GET',
      p_source_type    => 'json/collection',
      p_items_per_page => 25,
      p_mimes_allowed  => NULL,
      p_comments       => NULL,
      p_source         => 
'select * from emp');

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'oracle.example.hr',
      p_pattern        => 'emp_post_example/',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'oracle.example.hr',
      p_pattern        => 'emp_post_example/',
      p_method         => 'POST',
      p_source_type    => 'plsql/block',
      p_mimes_allowed  => NULL,
      p_comments       => NULL,
      p_source         => 
'DECLARE
 new_id integer;
 current_date date;
BEGIN
    select sysdate into current_date from dual;
    insert into emp 
     (empno, ename, job, mgr, hiredate, sal, comm, deptno)
    VALUES
     (null, :ename, :ejob, :mgr, current_date, :sal, :comm, :deptno)
    returning empno into new_id;
    :status_code := 201;
    :forward_location := ''../employees/''||new_id;
exception
  WHEN VALUE_ERROR
        THEN
            :errmsg := ''SALARY must be a number.'';
            :status_code := 400;
 when others then 
	:status_code := 400;
	:errmsg := sqlerrm;
end;');

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'oracle.example.hr',
      p_pattern            => 'emp_post_example/',
      p_method             => 'POST',
      p_name               => 'ErrorMessage',
      p_bind_variable_name => 'errmsg',
      p_source_type        => 'RESPONSE',
      p_param_type         => 'STRING',
      p_access_method      => 'OUT',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'oracle.example.hr',
      p_pattern            => 'emp_post_example/',
      p_method             => 'POST',
      p_name               => 'EmpName',
      p_bind_variable_name => 'ename',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'oracle.example.hr',
      p_pattern            => 'emp_post_example/',
      p_method             => 'POST',
      p_name               => 'EmpJob',
      p_bind_variable_name => 'ejob',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'oracle.example.hr',
      p_pattern            => 'emp_post_example/',
      p_method             => 'POST',
      p_name               => 'EmpMgr',
      p_bind_variable_name => 'mgr',
      p_source_type        => 'HEADER',
      p_param_type         => 'INT',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'oracle.example.hr',
      p_pattern            => 'emp_post_example/',
      p_method             => 'POST',
      p_name               => 'EmpSal',
      p_bind_variable_name => 'sal',
      p_source_type        => 'HEADER',
      p_param_type         => 'INT',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'oracle.example.hr',
      p_pattern            => 'emp_post_example/',
      p_method             => 'POST',
      p_name               => 'EmpComm',
      p_bind_variable_name => 'comm',
      p_source_type        => 'HEADER',
      p_param_type         => 'INT',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'oracle.example.hr',
      p_pattern            => 'emp_post_example/',
      p_method             => 'POST',
      p_name               => 'EmpDept',
      p_bind_variable_name => 'deptno',
      p_source_type        => 'HEADER',
      p_param_type         => 'INT',
      p_access_method      => 'IN',
      p_comments           => NULL);

  ORDS.CREATE_ROLE(
      p_role_name=> 'oracle.dbtools.role.autorest.MOVIESTREAM');
  ORDS.CREATE_ROLE(
      p_role_name=> 'oracle.dbtools.role.autorest.any.MOVIESTREAM');
  l_roles(1) := 'oracle.dbtools.autorest.any.schema';
  l_roles(2) := 'oracle.dbtools.role.autorest.MOVIESTREAM';

  ORDS.DEFINE_PRIVILEGE(
      p_privilege_name => 'oracle.dbtools.autorest.privilege.MOVIESTREAM',
      p_roles          => l_roles,
      p_patterns       => l_patterns,
      p_modules        => l_modules,
      p_label          => 'MOVIESTREAM metadata-catalog access',
      p_description    => 'Provides access to the metadata catalog of the objects in the MOVIESTREAM schema.',
      p_comments       => NULL); 

  l_roles.DELETE;
  l_modules.DELETE;
  l_patterns.DELETE;

  l_roles(1) := 'SODA Developer';

  ORDS.DEFINE_PRIVILEGE(
      p_privilege_name => 'oracle.soda.privilege.developer',
      p_roles          => l_roles,
      p_patterns       => l_patterns,
      p_modules        => l_modules,
      p_label          => NULL,
      p_description    => NULL,
      p_comments       => NULL); 

  l_roles.DELETE;
  l_modules.DELETE;
  l_patterns.DELETE;


COMMIT;

END;


-- sqlcl_snapshot {"hash":"ebe7b0ec79cb03d241932ae718d5a5c5ed7979e7","type":"ORDS_SCHEMA","name":"ords","schemaName":"MOVIESTREAM","sxml":""}