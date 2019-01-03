-- File Name		: col_insu_upload.sql

-- File Created for	: Upload file for col_insu

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure col_insu_upload(
v_mig_date IN TIMESTAMP
)
   as
   v_Collateral_Id  	 	CHAR(10);
   v_Insurance_Type	 	CHAR(5);
   v_Insurer_Details 	 	CHAR(100);
   v_Policy_No	 		CHAR(15);
   v_Policy_Amt_Ccy_Code	CHAR(3);
   v_Policy_Amt	 		CHAR(17);
   v_Risk_Cover_Start_Date	CHAR(8);
   v_Risk_Cover_End_Date 	CHAR(8);
   v_Last_Premium_Paid_Date	CHAR(8);
   v_Premium_Amt_Ccy_Code	CHAR(3);
   v_Premium_Amt	 	CHAR(17);
   v_Freq		 	CHAR(1);
   v_Items_Insured	 	CHAR(80);
   v_Notes	 		CHAR(80);
   v_Del		 	CHAR(1);
   
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

EXECUTE IMMEDIATE 'truncate table COL_INSU_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Collateral_Id,v_Insurance_Type,v_Insurer_Details,v_Policy_No,v_Policy_Amt_Ccy_Code,v_Policy_Amt,v_Risk_Cover_Start_Date,v_Risk_Cover_End_Date,v_Last_Premium_Paid_Date,v_Premium_Amt_Ccy_Code,v_Premium_Amt,v_Freq,v_Items_Insured,v_Notes,v_Del;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into COL_INSU_O_TABLE values (v_Collateral_Id,v_Insurance_Type,v_Insurer_Details,v_Policy_No,v_Policy_Amt_Ccy_Code,v_Policy_Amt,v_Risk_Cover_Start_Date,v_Risk_Cover_End_Date,v_Last_Premium_Paid_Date,v_Premium_Amt_Ccy_Code,v_Premium_Amt,v_Freq,v_Items_Insured,v_Notes,v_Del ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;