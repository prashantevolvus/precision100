-- File Name		: feedet_upload.sql

-- File Created for	: Upload file for feedet

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure feedet_upload(
v_mig_date IN TIMESTAMP
)
   as
   v_Account_ID			 CHAR(16);
   v_Charge_Type		 CHAR(5);
   v_User_Calc_Charge_Amt	 CHAR(17);
   v_Currency_code		 CHAR(3);
   v_Charge_Waived		 CHAR(17);
   v_Charge_Amount_Collected	 CHAR(17);
   v_Amortization_flag		 CHAR(1);
   v_Amortized_Amount		 CHAR(17);
   v_Last_Amortization_date	 CHAR(10);
   v_Transaction_Date		 CHAR(10);
   v_Transaction_ID		 CHAR(9);
   v_Next_Assesment_date	 CHAR(10);
   v_Assesment_Frequency_type	 CHAR(1);
   v_Asses_Freq_Week_Num	 CHAR(1);
   v_Assess_Freq_Week_Day	 CHAR(1);
   v_Assess_Freq_Start_date	 CHAR(2);
   v_Assess_Freq_Hldy_Status	 CHAR(1);
   v_No_of_times_Assessed	 CHAR(3);
   v_Last_Assessment_date	 CHAR(10);
   v_Deductible_Flag		 CHAR(1);
   v_Event_Id_in_PTTM		 CHAR(25);
   v_Amort_Tenor		 CHAR(3);
   v_Pending_Amort_Tenor	 CHAR(3);
   v_Max_No_of_Assessments	 CHAR(3);
   v_IBAN			 CHAR(3);
   
   
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

EXECUTE IMMEDIATE 'truncate table FEEDET_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Account_ID,v_Charge_Type,v_User_Calc_Charge_Amt,v_Currency_code,v_Charge_Waived,v_Charge_Amount_Collected,v_Amortization_flag,v_Amortized_Amount,v_Last_Amortization_date,v_Transaction_Date,v_Transaction_ID,v_Next_Assesment_date,v_Assesment_Frequency_type,v_Asses_Freq_Week_Num,v_Assess_Freq_Week_Day,v_Assess_Freq_Start_date,v_Assess_Freq_Hldy_Status,v_No_of_times_Assessed,v_Last_Assessment_date,v_Deductible_Flag,v_Event_Id_in_PTTM,v_Amort_Tenor,v_Pending_Amort_Tenor,v_Max_No_of_Assessments,v_IBAN;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into FEEDET_O_TABLE values (v_Account_ID,v_Charge_Type,v_User_Calc_Charge_Amt,v_Currency_code,v_Charge_Waived,v_Charge_Amount_Collected,v_Amortization_flag,v_Amortized_Amount,v_Last_Amortization_date,v_Transaction_Date,v_Transaction_ID,v_Next_Assesment_date,v_Assesment_Frequency_type,v_Asses_Freq_Week_Num,v_Assess_Freq_Week_Day,v_Assess_Freq_Start_date,v_Assess_Freq_Hldy_Status,v_No_of_times_Assessed,v_Last_Assessment_date,v_Deductible_Flag,v_Event_Id_in_PTTM,v_Amort_Tenor,v_Pending_Amort_Tenor,v_Max_No_of_Assessments,v_IBAN ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;