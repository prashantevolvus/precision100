-- File Name		: ato.sql

-- File Created for	: Upload file for ato

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure ato(
v_mig_date IN TIMESTAMP
)
   as
   v_Indicator  			CHAR(3);
   v_Account_Number		 	CHAR(16);
   v_Start_Date 			CHAR(8);
   v_Crncy_Code  			CHAR(3);
   v_End_Date		 		CHAR(8);
   v_Total_No_of_Days_Debit		CHAR(5);
   v_Total_No_of_Days_Credit		CHAR(5);
   v_Total_Debit_Balance  		CHAR(20);
   v_Total_Credit_Balance  		CHAR(20);
   v_Highest_Debit_Balance	 	CHAR(20);
   v_Highest_Credit_Balance		CHAR(20);
   v_Total_Debits			CHAR(20);
   v_Total_Credits  			CHAR(20);
   v_Total_Credit_Clearing_Balance	CHAR(20);
   v_No_of_Instruments_Clearing  	CHAR(5);
   v_Total_No_of_TODs_Granted		CHAR(3);
   v_Interest_Collected			CHAR(17);
   v_Interest_Paid			CHAR(17);
   v_Time_taken_to_clear_TODs		CHAR(5);
   v_No_of_Regular_TODs			CHAR(3);
   v_No_of_Inward_Chq_Returned		CHAR(3);
   v_No_of_Outward_Chq_Returned		CHAR(3);
   v_No_of_Debit_Transactions		CHAR(5);
   v_No_of_Credit_Transactions		CHAR(5);
   v_Credit_Interest_Accrued		CHAR(20);
   v_Debit_Interest_Accrued		CHAR(20);
   v_Lowest_Credit_Balance		CHAR(17);
   v_Lowest_Debit_Balance		CHAR(17);
   v_Inward_Clg_Cheque_Return_Amt	CHAR(20);
   v_Outward_Clg_Cheque_Return_Amt	CHAR(20);   
   
--  DECLARE
   CURSOR c1 is
     select 'ATO',
--   v_Indicator  			CHAR(3);
--   v_Account_Number		 	CHAR(16);
            lpad(' ',16,' '),
--   v_Start_Date 			CHAR(8);
            lpad(' ',8,' '),
--   v_Crncy_Code  			CHAR(3);
            lpad(' ',3,' '),
--   v_End_Date		 		CHAR(8);
            lpad(' ',8,' '),
--   v_Total_No_of_Days_Debit		CHAR(5);
            lpad(' ',5,' '),
--   v_Total_No_of_Days_Credit		CHAR(5);
            lpad(' ',5,' '),
--   v_Total_Debit_Balance  		CHAR(20);
            lpad(' ',20,' '),
--   v_Total_Credit_Balance  		CHAR(20);
            lpad(' ',20,' '),
--   v_Highest_Debit_Balance	 	CHAR(20);
            lpad(' ',20,' '),
--   v_Highest_Credit_Balance		CHAR(20);
            lpad(' ',20,' '),
--   v_Total_Debits			CHAR(20);
            lpad(' ',20,' '),
--   v_Total_Credits  			CHAR(20);
            lpad(' ',20,' '),
--   v_Total_Credit_Clearing_Balance	CHAR(20);
            lpad(' ',20,' '),
--   v_No_of_Instruments_Clearing  	CHAR(5);
            lpad(' ',5,' '),
--   v_Total_No_of_TODs_Granted		CHAR(3);
            lpad(' ',3,' '),
-- v_Interest_Collected			CHAR(17);
            lpad(' ',17,' '),
--   v_Interest_Paid			CHAR(17);
            lpad(' ',17,' '),
--   v_Time_taken_to_clear_TODs		CHAR(5);
            lpad(' ',5,' '),
-- v_No_of_Regular_TODs			CHAR(3);
            lpad(' ',3,' '),
-- v_No_of_Inward_Chq_Returned		CHAR(3);
            lpad(' ',3,' '),
-- v_No_of_Outward_Chq_Returned		CHAR(3);
            lpad(' ',3,' '),
--   v_No_of_Debit_Transactions		CHAR(5);
            lpad(' ',5,' '),
--  v_No_of_Credit_Transactions		CHAR(5);
            lpad(' ',5,' '),
--   v_Credit_Interest_Accrued		CHAR(20);
            lpad(' ',20,' '),
--   v_Debit_Interest_Accrued		CHAR(20);
            lpad(' ',20,' '),
--   v_Lowest_Credit_Balance		CHAR(17);
            lpad(' ',17,' '),
--   v_Lowest_Debit_Balance		CHAR(17);
            lpad(' ',17,' '),
--   v_Inward_Clg_Cheque_Return_Amt	CHAR(20);
            lpad(' ',20,' '),
--   v_Outward_Clg_Cheque_Return_Amt	CHAR(20);   
            lpad(' ',20,' ')

--            jubno,
--            JUHAMT,
--            lpad(' ',3,' '),
--            lpad(' ',5,' '),
--            lpad(nvl(pack_mig_bm.get_date_fm_btrv(jusdte),' '),8,' '),
--            lpad(nvl(pack_mig_bm.get_date_fm_btrv(juhed),' '),8,' '),
--            lpad(' ',5,' '),
--            lpad(' ',16,' '),
--            lpad(' ',20,' '),
--            lpad(' ',12,' '),
--            lpad(' ',5,' '),
--            lpad(' ',16,' '),
--            lpad(' ',16,' '),
--            rpad(jupf.jubbn,8,' '),
--            rpad(jupf.juhdd1,50,' ')
--  	from jupf;

   
BEGIN

Begin

EXECUTE IMMEDIATE 'truncate table ATO_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Indicator,v_Account_Number,v_Start_Date,v_Crncy_Code,v_End_Date,v_Total_No_of_Days_Debit,v_Total_No_of_Days_Credit,v_Total_Debit_Balance,v_Total_Credit_Balance,v_Highest_Debit_Balance,v_Highest_Credit_Balance,v_Total_Debits,v_Total_Credits,v_Total_Credit_Clearing_Balance,v_No_of_Instruments_Clearing,v_Total_No_of_TODs_Granted,v_Interest_Collected,v_Interest_Paid,v_Time_taken_to_clear_TODs,v_No_of_Regular_TODs,v_No_of_Inward_Chq_Returned,v_No_of_Outward_Chq_Returned,v_No_of_Debit_Transactions,v_No_of_Credit_Transactions,v_Credit_Interest_Accrued,v_Debit_Interest_Accrued,v_Lowest_Credit_Balance,v_Lowest_Debit_Balance,v_Inward_Clg_Cheque_Return_Amt,v_Outward_Clg_Cheque_Return_Amt;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into ATO_O_TABLE values (v_Indicator,v_Account_Number,v_Start_Date,v_Crncy_Code,v_End_Date,v_Total_No_of_Days_Debit,v_Total_No_of_Days_Credit,v_Total_Debit_Balance,v_Total_Credit_Balance,v_Highest_Debit_Balance,v_Highest_Credit_Balance,v_Total_Debits,v_Total_Credits,v_Total_Credit_Clearing_Balance,v_No_of_Instruments_Clearing,v_Total_No_of_TODs_Granted,v_Interest_Collected,v_Interest_Paid,v_Time_taken_to_clear_TODs,v_No_of_Regular_TODs,v_No_of_Inward_Chq_Returned,v_No_of_Outward_Chq_Returned,v_No_of_Debit_Transactions,v_No_of_Credit_Transactions,v_Credit_Interest_Accrued,v_Debit_Interest_Accrued,v_Lowest_Credit_Balance,v_Lowest_Debit_Balance,v_Inward_Clg_Cheque_Return_Amt,v_Outward_Clg_Cheque_Return_Amt ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;