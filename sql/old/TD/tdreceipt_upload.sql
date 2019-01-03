-- File Name		: tdreceipt_upload.sql

-- File Created for	: Upload file for tdreceipt

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure tdreceipt_upload(
v_mig_date IN TIMESTAMP
)
   as
   v_Indicator  		 CHAR(3);
   v_Account_Number		 CHAR(16);
   v_Print_Count 		 CHAR(3);
   v_Print_System_Flag		 CHAR(1);
   v_Print_Remarks		 CHAR(60);
   v_Printed_Date		 CHAR(8);
   v_Last_Printed_User_ID	 CHAR(15);
   v_Receipt_Status		 CHAR(1);
   v_Receipt_Alpha		 CHAR(6);
   v_Receipt_Number		 CHAR(16);
   v_Denomination_Amount	 CHAR(17);
   v_Closed_Value_Date		 CHAR(8);
   v_End_Indicator		 CHAR(1);
   v_Dummy			 CHAR(100);
   
   
--  DECLARE
   CURSOR c1 is
     select 'ALT',
            jubno,
            JUHAMT,
            lpad(' ',3,' '),
            lpad(' ',5,' '),
            lpad(nvl(pack_mig_bm.get_date_fm_btrv(jusdte),' '),8,' '),
            lpad(nvl(pack_mig_bm.get_date_fm_btrv(juhed),' '),8,' '),
            lpad(' ',5,' '),
            lpad(' ',16,' '),
            lpad(' ',20,' '),
            lpad(' ',12,' '),
            lpad(' ',5,' '),
            lpad(' ',16,' '),
            lpad(' ',16,' '),
            rpad(jupf.jubbn,8,' '),
            rpad(jupf.juhdd1,50,' ')
  	from jupf;

   
BEGIN

Begin

EXECUTE IMMEDIATE 'truncate table TDRECEIPT_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Indicator,v_Account_Number,v_Print_Count,v_Print_System_Flag,v_Print_Remarks,v_Printed_Date,v_Last_Printed_User_ID,v_Receipt_Status,v_Receipt_Alpha,v_Receipt_Number,v_Denomination_Amount,v_Closed_Value_Date,v_End_Indicator,v_Dummy;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into TDRECEIPT_O_TABLE values (v_Indicator,v_Account_Number,v_Print_Count,v_Print_System_Flag,v_Print_Remarks,v_Printed_Date,v_Last_Printed_User_ID,v_Receipt_Status,v_Receipt_Alpha,v_Receipt_Number,v_Denomination_Amount,v_Closed_Value_Date,v_End_Indicator,v_Dummy ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;