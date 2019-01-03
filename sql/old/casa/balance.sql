-- File Name		: balance.sql

-- File Created for	: Upload file for balance

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure balance(inp_sol_id IN VARCHAR2)
   as
   v_Indicator  		 CHAR(3);
   v_Account_Number		 CHAR(16);
   v_Amount 			 decimal(14,2);
   v_Transaction_Date		 CHAR(8);
   v_Currency_Code		 CHAR(3);
   v_Service_Outlet		 CHAR(8);
   v_IBAN_Number		 CHAR(34);
   v_dummy  			 CHAR(10);
   
   
--  DECLARE
   CURSOR c1 is
     select 'BAL',
--   v_Indicator  		 CHAR(3);
--   v_Account_Number		 CHAR(16);
            rpad(map_acc.fin_acc_num,16,' '),
--   v_Amount 			 number(14,2);
            lpad(to_number(scbal - scsum0)/POWER(10,C8CED)),17,' '),
--   v_Transaction_Date		 CHAR(8);
	    to_char(to_date(pack_mig_EQ3.get_date_fm_btrv(key_value),'DD/MM/YYYY'),'YYYYMMDD'),
--   v_Currency_Code		 CHAR(3);
            lpad(scpf.scccy,3,' '),
--   v_Service_Outlet		 CHAR(8);
            lpad(map_acc.fin_sol_id,3,' '),
--   v_IBAN_Number		 CHAR(34);
            lpad(' ',34,' '),
--   v_dummy  			 CHAR(10);
            lpad(' ',10,' ')
  	from map_acc,scpf,sys_config,c8pf
--	inner join c8pf on c8ccy = scccy
	where map_acc.LEG_ACC_NUM=scpf.scab||scpf.scan||scpf.scas
	and c8ccy = scccy
	and (scbal-scsum0) <>'0'
	and key_string='EQ3_BUSINESS_DATE'
	order by scccy;

   
BEGIN

Begin

EXECUTE IMMEDIATE 'truncate table AC_BALANCE_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Indicator,v_Account_Number,v_Amount,v_Transaction_Date,v_Currency_Code,v_Service_Outlet,v_IBAN_Number,v_dummy;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into AC_BALANCE_O_TABLE values (v_Indicator,v_Account_Number,v_Amount,v_Transaction_Date,v_Currency_Code,v_Service_Outlet,v_IBAN_Number,v_dummy ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;