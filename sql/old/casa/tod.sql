-- File Name		: tod.sql

-- File Created for	: Upload file for tod

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure tod
   as
   v_Indicator  		 CHAR(3);
   v_Account_Number		 CHAR(16);
   v_tod_Amount 		 CHAR(17);
   v_TOD_Grant_Date		 CHAR(8);
   v_TOD_Expiry_Date		 CHAR(8);
   v_TOD_Penal_Start_Date	 CHAR(8);
   v_TOD_Advance_Type		 CHAR(1);
   v_TOD_Advance_Category	 CHAR(1);
   v_TOD_Level_Interest_Flag	 CHAR(1);
   v_TOD_Normal_Interest_Percent CHAR(10);
   v_TOD_Penal_Interest_Percent	 CHAR(10);
   v_TOD_Availed_Amount		 CHAR(17);
   v_TOD_Regularized_Amount	 CHAR(17);
   v_SOL_ID  			 CHAR(8);
   v_CRNCY_CODE  		 CHAR(3);
   v_Entity_Type 		 CHAR(5);
   v_Free_Text			 CHAR(60);
   
--  DECLARE
   CURSOR c1 is
     select 'TOD',
--   v_Indicator  		 CHAR(3);
--   v_Account_Number		 CHAR(16);
            rpad(map_acc.fin_acc_num,16,' '),
--   v_tod_Amount 		 CHAR(17);
	   lpad(to_number(abs((scbal)/POWER(10,C8CED))),17,' '),
--   v_TOD_Grant_Date		 CHAR(8);
	    to_char(to_date(pack_mig_EQ3.get_date_fm_btrv(key_value),'DD/MM/YYYY'),'YYYYMMDD'),
--   v_TOD_Expiry_Date		 CHAR(8);
	case
	    when scled = '9999999' then '20991231'
	    when scled = '0' then 	    to_char(to_date(pack_mig_EQ3.get_date_fm_btrv(key_value),'DD/MM/YYYY') + 1,'YYYYMMDD')
	   else  to_char(to_date(pack_mig_EQ3.get_date_fm_btrv(scled),'DD/MM/YYYY'),'YYYYMMDD') end,
--   v_TOD_Penal_Start_Date	 CHAR(8);
            lpad(' ',8,' '),
--   v_TOD_Advance_Type		 CHAR(1);
            'R',
--   v_TOD_Advance_Category	 CHAR(1);
            'C',
--   v_TOD_Level_Interest_Flag	 CHAR(1);
            'Y',
-- v_TOD_Normal_Interest_Percent CHAR(10);
            lpad(' ',10,' '),
-- v_TOD_Penal_Interest_Percent	 CHAR(10);
            lpad(' ',10,' '),
-- v_TOD_Availed_Amount		 CHAR(17);
            lpad('0',17,' '),
--   v_TOD_Regularized_Amount	 CHAR(17);
            lpad(' ',17,' '),
--   v_SOL_ID  			 CHAR(8);
            rpad(map_acc.fin_sol_id,8,' '),
--   v_CRNCY_CODE  		 CHAR(3);
            lpad(scpf.scccy,3,' '),
--   v_Entity_Type 		 CHAR(5);
            'TODMN',
-- v_Free_Text			 CHAR(60);
            lpad(' ',60,' ')
  	from sys_config,map_acc
	inner join scpf on scpf.scab||scpf.scan||scpf.scas = map_acc.LEG_ACC_NUM
	inner join c8pf on c8ccy = scccy
	where schm_type in ('SBA','CAA')
	and scbal < 0
	and key_string = 'CUST_CUTOFF_DATE'
  and rownum <= 10;

   
BEGIN

Begin

EXECUTE IMMEDIATE 'truncate table TOD_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Indicator,v_Account_Number,v_tod_Amount,v_TOD_Grant_Date,v_TOD_Expiry_Date,v_TOD_Penal_Start_Date,v_TOD_Advance_Type,v_TOD_Advance_Category,v_TOD_Level_Interest_Flag,v_TOD_Normal_Interest_Percent,v_TOD_Penal_Interest_Percent,v_TOD_Availed_Amount,v_TOD_Regularized_Amount,v_SOL_ID,v_CRNCY_CODE,v_Entity_Type,v_Free_Text;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into TOD_O_TABLE values (v_Indicator,v_Account_Number,v_tod_Amount,v_TOD_Grant_Date,v_TOD_Expiry_Date,v_TOD_Penal_Start_Date,v_TOD_Advance_Type,v_TOD_Advance_Category,v_TOD_Level_Interest_Flag,v_TOD_Normal_Interest_Percent,v_TOD_Penal_Interest_Percent,v_TOD_Availed_Amount,v_TOD_Regularized_Amount,v_SOL_ID,v_CRNCY_CODE,v_Entity_Type,v_Free_Text ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;