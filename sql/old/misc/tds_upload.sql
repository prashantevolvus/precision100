-- File Name		: Lien.sql

-- File Created for	: Upload file for tds_upload

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure tds_upload(
v_mig_date IN TIMESTAMP
)
   as
   v_Account_number  	 	CHAR(15);
   v_Record_Type		CHAR(1);
   v_Interest_Amount 	 	CHAR(20);
   v_CR_OR_DR_AMT_IND	 	CHAR(1);
   v_Interest_Run_Indicator	CHAR(1);
   v_Record_Status		CHAR(1);
   v_Tran_date	 		CHAR(99);
   v_Tran_ID 	 		CHAR(9);
   v_Part_Tran_Srl_Num		CHAR(4);
   v_Cust_ID	 		CHAR(32);
   v_Rate_Percent		CHAR(9);
   v_Start_Date	 		CHAR(99);
   v_End_Date	 		CHAR(99);
   v_Tax_Amount	 		CHAR(99);
   v_Value_Date	 		CHAR(99);
   
   
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

EXECUTE IMMEDIATE 'truncate table TDS_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Account_number,v_Record_Type,v_Interest_Amount,v_CR_OR_DR_AMT_IND,v_Interest_Run_Indicator,v_Record_Status,v_Tran_date,v_Tran_ID,v_Part_Tran_Srl_Num,v_Cust_ID,v_Rate_Percent,v_Start_Date,v_End_Date,v_Tax_Amount,v_Value_Date;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into TDS_O_TABLE values (v_Account_number,v_Record_Type,v_Interest_Amount,v_CR_OR_DR_AMT_IND,v_Interest_Run_Indicator,v_Record_Status,v_Tran_date,v_Tran_ID,v_Part_Tran_Srl_Num,v_Cust_ID,v_Rate_Percent,v_Start_Date,v_End_Date,v_Tax_Amount,v_Value_Date ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;