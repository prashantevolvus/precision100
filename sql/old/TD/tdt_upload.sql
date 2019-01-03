-- File Name		: tdt_upload.sql

-- File Created for	: Upload file for TDT

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure tdt_upload(
v_mig_date IN TIMESTAMP
)
   as
   v_Indicator  		 CHAR(3);
   v_Transaction_Type		 CHAR(1);
   v_Transaction_Sub_type	 CHAR(2);
   v_Account_Number		 CHAR(16);
   v_Currency_Code		 CHAR(3);
   v_Amount			 CHAR(17);
   v_Part_Transaction_Type	 CHAR(1);
   v_Value_Date			 CHAR(8);
   v_Agent_Employee_Indicator	 CHAR(1);
   v_Agent_Employee_Code	 CHAR(10);
   v_Flow_Code			 CHAR(2);
   v_Transaction_End_Indicator	 CHAR(1);
   v_IBAN_Number		 CHAR(34);
   
   
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

EXECUTE IMMEDIATE 'truncate table TDT_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Indicator,v_Transaction_Type,v_Transaction_Sub_type,v_Account_Number,v_Currency_Code,v_Amount,v_Part_Transaction_Type,v_Value_Date,v_Agent_Employee_Indicator,v_Agent_Employee_Code,v_Flow_Code,v_Transaction_End_Indicator,v_IBAN_Number;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into TDT_O_TABLE values (v_Indicator,v_Transaction_Type,v_Transaction_Sub_type,v_Account_Number,v_Currency_Code,v_Amount,v_Part_Transaction_Type,v_Value_Date,v_Agent_Employee_Indicator,v_Agent_Employee_Code,v_Flow_Code,v_Transaction_End_Indicator,v_IBAN_Number ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;