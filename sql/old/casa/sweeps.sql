-- File Name		: sweeps.sql

-- File Created for	: Upload file for sweeps

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure sweeps
   as
   v_Indicator  		 CHAR(3);
   v_Pool_Number		 CHAR(6);
   v_Account_Number		 CHAR(16);
   v_Pool_Description		 CHAR(50);
   v_Suspend_Flag		 CHAR(1);
   v_Suspend_Date		 CHAR(8);
   v_Order_of_Utilization	 CHAR(4);
   v_Alternate_Pool_Description	 CHAR(50);

   
   
--  DECLARE
   CURSOR c1 is
     select 'PFT',
--   v_Indicator  		 CHAR(3);
--   v_Pool_Number		 CHAR(6);
            lpad(R0PF.R0an,6,' '),
--   v_Account_Number		 CHAR(16);
            rpad(map_acc.fin_acc_num,16,' '),
--   v_Pool_Description		 CHAR(50);
            rpad('BLANKS',50,' '),
--   v_Suspend_Flag		 CHAR(1);
            lpad('N',1,' '),
--   v_Suspend_Date		 CHAR(8);
            lpad(' ',8,' '),
--   v_Order_of_Utilization	 CHAR(4);
	case 
	   when schm_type='CAA' then rpad('1',4,' ')
	   else rpad('2',4,' ') end,
-- v_Alternate_Pool_Description	 CHAR(50);
            lpad(' ',50,' ')
  	from r0pf
	inner join map_acc on leg_acc_num=R0AB||R0AN||R0AS
	where r0bot = 'R'
	and schm_type <> 'TDA';

   
BEGIN

Begin

EXECUTE IMMEDIATE 'truncate table SWEEPS_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Indicator,v_Pool_Number,v_Account_Number,v_Pool_Description,v_Suspend_Flag,v_Suspend_Date,v_Order_of_Utilization,v_Alternate_Pool_Description;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into SWEEPS_O_TABLE values (v_Indicator,v_Pool_Number,v_Account_Number,v_Pool_Description,v_Suspend_Flag,v_Suspend_Date,v_Order_of_Utilization,v_Alternate_Pool_Description ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;