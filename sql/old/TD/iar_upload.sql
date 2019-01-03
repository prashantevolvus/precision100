-- File Name		: iar_upload.sql

-- File Created for	: Upload file for IAR

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure iar_upload(
v_mig_date IN TIMESTAMP
)
   as
   v_Account_Number		 CHAR(16);
   v_date1			 CHAR(10);
   v_Amount 			 CHAR(17);
   v_Debit_Credit_Indicator	 CHAR(1);
   v_Remarks			 CHAR(50);
   v_System_Manual		 CHAR(1);
   v_Applied_Flag		 CHAR(1);
   v_Interest_Run_Indicator	 CHAR(1);
   
   
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

EXECUTE IMMEDIATE 'truncate table IAR_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Account_Number,v_date1,v_Amount,v_Debit_Credit_Indicator,v_Remarks,v_System_Manual,v_Applied_Flag,v_Interest_Run_Indicator;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into IAR_O_TABLE values (v_Account_Number,v_date1,v_Amount,v_Debit_Credit_Indicator,v_Remarks,v_System_Manual,v_Applied_Flag,v_Interest_Run_Indicator ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;