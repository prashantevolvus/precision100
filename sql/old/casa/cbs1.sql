-- File Name		: CBS.sql

-- File Created for	: Upload Fromat for Cheque book

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure cbs_mig(
v_mig_date IN TIMESTAMP
)
   as
   v_dtabc             CHAR(4);
   V_dtanc             CHAR(6);
   V_dtasc             CHAR(3);
   V_nooflevs        number(10);
   V_string          varchar(1000);
   V_string1          varchar(8000);
   V_status          varchar(1000);
   v_dufirs          number(10);
   v_dtfirs          number(10);
   v_dtlast          number(10);
   v_noofunpaid      number(10);
   v_unpaidposition  number(30);
   v_xxx  number(30);
   

   CURSOR c1 is
     
	select dtabc,dtanc,dtasc,(dtlast-dtfirs),rpad(rpad('P',(dtlast - dtfirs),'P'),1000,' ')
	from dtpf;
  
cursor c2 IS 
  select (dufirs - dtfirs),(dtlast-dtfirs)  
  from dupf,dtpf
  where dtabc = duabc
  and dtanc = duanc
  and dtasc = duasc
  and dufirs between v_dtfirs and v_dtlast;
   
BEGIN

Begin

EXECUTE IMMEDIATE 'truncate table tt_cbs';
  
end;

OPEN c1;
FETCH c1 INTO v_dtabc ,v_dtanc ,v_dtasc ,V_nooflevs,V_string;

   OPEN c2;
     LOOP
      FETCH c2 INTO v_unpaidposition, v_xxx;
      EXIT WHEN c2%NOTFOUND;  
      
      select CONCAT(CONCAT(SUBSTR(V_string,1,3 -1),'U'),SUBSTR(V_string,3+1)) INTO V_string1
      from dual;

      insert into tt_cbs values (v_dtabc ,v_dtanc ,v_dtasc ,v_xxx,V_string1 ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;