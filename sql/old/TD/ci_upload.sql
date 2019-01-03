-- File Name		: ci_upload.sql

-- File Created for	: Upload file for CI

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure ci_upload(
v_mig_date IN TIMESTAMP
)
   as
   v_Indicator  		 CHAR(16);
   v_SOL_ID			 CHAR(10);
   v_Term_Deposit_Account	 CHAR(17);
   v_Flow_code			 CHAR(1);
   v_Amount_Indicator		 CHAR(50);
   v_Currency_code		 CHAR(1);
   v_Fixed_amount		 CHAR(1);
   v_Balance_Indicator		 CHAR(1);
   v_Excess_Short_Indicator	 CHAR(99);
   v_Account_No			 CHAR(99);
   v_Account_Balance		 CHAR(99);
   v_Percentage			 CHAR(99);
   v_Amount_Round_off_Type	 CHAR(99);
   v_Round_off_value		 CHAR(99);
   v_Rate_Code			 CHAR(99);
   v_Collect_charges		 CHAR(99);
   v_Report_Code		 CHAR(99);
   v_Reference_number		 CHAR(99);
   v_Transaction_Particulars	 CHAR(99);
   v_Transaction_Remarks	 CHAR(99);
   v_Intent_code		 CHAR(99);
   v_DD_Payable_bank_code	 CHAR(99);
   v_DD_Payable_branch_code	 CHAR(99);
   v_Payee_name			 CHAR(99);
   v_Purchase_account_number	 CHAR(99);
   v_Purchase_name		 CHAR(99);
   v_IBAN_Number		 CHAR(99);
   
   
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

EXECUTE IMMEDIATE 'truncate table CI_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Indicator,v_SOL_ID,v_Term_Deposit_Account,v_Flow_code,v_Amount_Indicator,v_Currency_code,v_Fixed_amount,v_Balance_Indicator,v_Excess_Short_Indicator,v_Account_No,v_Account_Balance,v_Percentage,v_Amount_Round_off_Type,v_Round_off_value,v_Rate_Code,v_Collect_charges,v_Report_Code,v_Reference_number,v_Transaction_Particulars,v_Transaction_Remarks,v_Intent_code,v_DD_Payable_bank_code,v_DD_Payable_branch_code,v_Payee_name,v_Purchase_account_number,v_Purchase_name,v_IBAN_Number;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into CI_O_TABLE values (v_Indicator,v_SOL_ID,v_Term_Deposit_Account,v_Flow_code,v_Amount_Indicator,v_Currency_code,v_Fixed_amount,v_Balance_Indicator,v_Excess_Short_Indicator,v_Account_No,v_Account_Balance,v_Percentage,v_Amount_Round_off_Type,v_Round_off_value,v_Rate_Code,v_Collect_charges,v_Report_Code,v_Reference_number,v_Transaction_Particulars,v_Transaction_Remarks,v_Intent_code,v_DD_Payable_bank_code,v_DD_Payable_branch_code,v_Payee_name,v_Purchase_account_number,v_Purchase_name,v_IBAN_Number ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;