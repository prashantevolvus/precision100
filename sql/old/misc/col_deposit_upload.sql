-- File Name		: col_deposit_upload.sql

-- File Created for	: Upload file for col_deposit

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure col_deposit_upload(
v_mig_date IN TIMESTAMP
)
   as
   v_Collateral_Id  	 	CHAR(10);
   v_Withdraw	 		CHAR(1);
   v_Value_Indicator 	 	CHAR(1);
   v_Reason_Code	 	CHAR(5);
   v_Lodged_Date	 	CHAR(8);
   v_Withdrawn_Date	 	CHAR(8);
   v_Review_Date	 	CHAR(8);
   v_Received_Date 	 	CHAR(8);
   v_Due_Date 	 		CHAR(8);
   v_Balance_Apportionable	CHAR(17);
   v_Aportioned_Value	 	CHAR(17);
   v_Apportioned_Value_CCY_Code	CHAR(3);
   v_Notes		 	CHAR(240);
   v_Full_Benefit	 	CHAR(1);
   v_CIF_ID	 		CHAR(99);
   v_Lien_Amount	 	CHAR(99);
   v_Denomination_Number	CHAR(99);
   v_Deposit_Account_ID	 	CHAR(16);
   
   
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

EXECUTE IMMEDIATE 'truncate table COL_DEPOSIT_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Collateral_Id,v_Withdraw,v_Value_Indicator,v_Reason_Code,v_Lodged_Date,v_Withdrawn_Date,v_Review_Date,v_Received_Date,v_Due_Date,v_Balance_Apportionable,v_Aportioned_Value,v_Apportioned_Value_CCY_Code,v_Notes,v_Full_Benefit,v_CIF_ID,v_Lien_Amount,v_Denomination_Number,v_Deposit_Account_ID;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into COL_DEPOSIT_O_TABLE values (v_Collateral_Id,v_Withdraw,v_Value_Indicator,v_Reason_Code,v_Lodged_Date,v_Withdrawn_Date,v_Review_Date,v_Received_Date,v_Due_Date,v_Balance_Apportionable,v_Aportioned_Value,v_Apportioned_Value_CCY_Code,v_Notes,v_Full_Benefit,v_CIF_ID,v_Lien_Amount,v_Denomination_Number,v_Deposit_Account_ID ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;