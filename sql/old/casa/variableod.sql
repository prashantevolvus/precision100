-- File Name		: variableod.sql

-- File Created for	: Upload file for variableod

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure variableod(
v_mig_date IN TIMESTAMP
)
   as
   v_Account_ID  		 CHAR(16);
   v_Interest_table_code	 CHAR(5);
   v_Customer_Debit_Pref_Percent  CHAR(10);
   v_Customer_Credit_Pref_Percent CHAR(10);
   v_Acct_Id_Debit_Pref_Percent	  CHAR(10);
   v_Acct_Id_Credit_Pref_Percent  CHAR(10);
   v_Channel_Debit_Pref_Percent	  CHAR(10);
   v_Channel_Credit_Pref_Percent  CHAR(10);
   v_Minimum_Int_Percent_Debit	  CHAR(10);
   v_Minimum_Int_Percent_Credit	  CHAR(10);
   v_Maximum_Int_Percent_Debit	  CHAR(10);
   v_Maximum_Int_Percent_Credit	  CHAR(10);
   v_Pegged_Flag 		  CHAR(1);
   v_Pegging_Frequency_in_Months  CHAR(3);
   v_Pegging_Frequency_in_Days	  CHAR(3);
   v_Start_Date			  CHAR(10);
   v_End_Date			  CHAR(10);
   
--  DECLARE
   CURSOR c1 is
     select 'ALT',
   v_Account_ID  		 CHAR(16);
            lpad(' ',16,' '),
   v_Interest_table_code	 CHAR(5);
            lpad(' ',5,' '),
   v_Customer_Debit_Pref_Percent  CHAR(10);
            lpad(' ',10,' '),
   v_Customer_Credit_Pref_Percent CHAR(10);
            lpad(' ',10,' '),
   v_Acct_Id_Debit_Pref_Percent	  CHAR(10);
            lpad(' ',10,' '),
   v_Acct_Id_Credit_Pref_Percent  CHAR(10);
            lpad(' ',10,' '),
   v_Channel_Debit_Pref_Percent	  CHAR(10);
            lpad(' ',10,' '),
   v_Channel_Credit_Pref_Percent  CHAR(10);
            lpad(' ',10,' '),
   v_Minimum_Int_Percent_Debit	  CHAR(10);
            lpad(' ',10,' '),
   v_Minimum_Int_Percent_Credit	  CHAR(10);
            lpad(' ',10,' '),
   v_Maximum_Int_Percent_Debit	  CHAR(10);
            lpad(' ',10,' '),
   v_Maximum_Int_Percent_Credit	  CHAR(10);
            lpad(' ',10,' '),
   v_Pegged_Flag 		  CHAR(1);
            lpad(' ',1,' '),
   v_Pegging_Frequency_in_Months  CHAR(3);
            lpad(' ',3,' '),
   v_Pegging_Frequency_in_Days	  CHAR(3);
            lpad(' ',3,' '),
   v_Start_Date			  CHAR(10);
            lpad(' ',10,' '),
   v_End_Date			  CHAR(10);
            lpad(' ',10,' ')

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

EXECUTE IMMEDIATE 'truncate table VARIABLEOD_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Account_ID,v_Interest_table_code,v_Customer_Debit_Pref_Percent,v_Customer_Credit_Pref_Percent,v_Acct_Id_Debit_Pref_Percent,v_Acct_Id_Credit_Pref_Percent,v_Channel_Debit_Pref_Percent,v_Channel_Credit_Pref_Percent,v_Minimum_Int_Percent_Debit,v_Minimum_Int_Percent_Credit,v_Maximum_Int_Percent_Debit,v_Maximum_Int_Percent_Credit,v_Pegged_Flag,v_Pegging_Frequency_in_Months,v_Pegging_Frequency_in_Days,v_Start_Date,v_End_Date;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into VARIABLEOD_O_TABLE values (v_Account_ID,v_Interest_table_code,v_Customer_Debit_Pref_Percent,v_Customer_Credit_Pref_Percent,v_Acct_Id_Debit_Pref_Percent,v_Acct_Id_Credit_Pref_Percent,v_Channel_Debit_Pref_Percent,v_Channel_Credit_Pref_Percent,v_Minimum_Int_Percent_Debit,v_Minimum_Int_Percent_Credit,v_Maximum_Int_Percent_Debit,v_Maximum_Int_Percent_Credit,v_Pegged_Flag,v_Pegging_Frequency_in_Months,v_Pegging_Frequency_in_Days,v_Start_Date,v_End_Date ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;