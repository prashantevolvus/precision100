-- File Name		: dp.sql

-- File Created for	: Upload file for dp

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure dp(inp_sol_id IN VARCHAR2)
   as
   v_Indicator  		 CHAR(3);
   v_Account_Number		 CHAR(16);
   v_Applicable_Date		 CHAR(8);
   v_Crncy_Code  		 CHAR(3);
   v_Drawing_Power_ind		 CHAR(1);
   v_Drawing_Power		 CHAR(17);
   v_DACC_Limit_Percentage	 CHAR(8);
   v_DACC_Limit_Absolute_Value	 CHAR(17);
   v_Remarks  			 CHAR(240);
   v_Recall_flag		 CHAR(1);
   
   
--  DECLARE
--   v_Indicator  		 CHAR(3);
   CURSOR c1 is
     select 'DHT',
--   v_Account_Number		 CHAR(16);
            lpad(map_acc.fin_acc_num,16,' '),
--   v_Applicable_Date		 CHAR(8);
            lpad(' ',8,' '),
--   v_Crncy_Code  		 CHAR(3);
            lpad(scpf.scccy,3,' '),
--  v_Drawing_Power_ind		 CHAR(1);
            'M',
--   v_Drawing_Power		 CHAR(17);
            lpad(to_number((scaodl)/POWER(10,C8CED)),17,' '),
--   v_DACC_Limit_Percentage	 CHAR(8);
            lpad(' ',8,' '),
--  v_DACC_Limit_Absolute_Value	 CHAR(17);
            lpad(' ',17,' '),
--  v_Remarks  			 CHAR(240);
            lpad(' ',240,' '),
--   v_Recall_flag		 CHAR(1);
            'N'
  	from map_acc,scpf
	inner join c8pf on c8ccy = scccy
	     where map_acc.leg_acc_num =  scpf.scab||scan||scas
	     and scaodl <> '0';

   
BEGIN

Begin

EXECUTE IMMEDIATE 'truncate table DP_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Indicator,v_Account_Number,v_Applicable_Date,v_Crncy_Code,v_Drawing_Power_ind,v_Drawing_Power,v_DACC_Limit_Percentage,v_DACC_Limit_Absolute_Value,v_Remarks,v_Recall_flag;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into DP_O_TABLE values (v_Indicator,v_Account_Number,v_Applicable_Date,v_Crncy_Code,v_Drawing_Power_ind,v_Drawing_Power,v_DACC_Limit_Percentage,v_DACC_Limit_Absolute_Value,v_Remarks,v_Recall_flag ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;