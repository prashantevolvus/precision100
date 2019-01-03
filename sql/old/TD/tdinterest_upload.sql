-- File Name		: tdinterest_upload.sql

-- File Created for	: Upload file for tdinterest

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure tdinterest_upload(
v_mig_date IN TIMESTAMP
)
   as
   v_Indicator			  CHAR(3);
   v_Account_Number		  CHAR(16);
   v_Currency_Code		  CHAR(3);
   v_SOL_ID			  CHAR(8);
   v_Credit_Interest_Transfer_Amt CHAR(17);
   v_Credit_Int_Calculated_Upto	  CHAR(8);
   v_Credit_Interest_Accrued_Upto CHAR(8);
   v_Credit_Interest_Booked_Upto  CHAR(8);
   v_Debit_Interest_Transfer_Amt  CHAR(17);
   v_Debit_Int_Calculated_Upto	  CHAR(8);
   v_Debit_Interest_Accrued_Upto  CHAR(8);
   v_Debit_Interest_Booked_Upto	  CHAR(8);
   v_Dummy			  CHAR(99);
   
   
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

EXECUTE IMMEDIATE 'truncate table TDINTEREST_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Indicator,v_Account_Number,v_Currency_Code,v_SOL_ID,v_Credit_Interest_Transfer_Amt,v_Credit_Int_Calculated_Upto,v_Credit_Interest_Accrued_Upto,v_Credit_Interest_Booked_Upto,v_Debit_Interest_Transfer_Amt,v_Debit_Int_Calculated_Upto,v_Debit_Interest_Accrued_Upto,v_Debit_Interest_Booked_Upto,v_Dummy;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into TDINTEREST_O_TABLE values (v_Indicator,v_Account_Number,v_Currency_Code,v_SOL_ID,v_Credit_Interest_Transfer_Amt,v_Credit_Int_Calculated_Upto,v_Credit_Interest_Accrued_Upto,v_Credit_Interest_Booked_Upto,v_Debit_Interest_Transfer_Amt,v_Debit_Int_Calculated_Upto,v_Debit_Interest_Accrued_Upto,v_Debit_Interest_Booked_Upto,v_Dummy ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;