-- File Name		: lrs_upload.sql

-- File Created for	: Upload file for lrs

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure lrs_upload(
v_mig_date IN TIMESTAMP
)
   as
   v_Account_Number		   CHAR(16);
   v_Flow_ID			   CHAR(5);
   v_Flow_Start_Date		   CHAR(10);
   v_Frequency_Type		   CHAR(1);
   v_Freq_Week_Num_for_Principal   CHAR(1);
   v_Freq_Week_Day_for_Principal   CHAR(1);
   v_Freq_Start_DD_for_Principal   CHAR(2);
   v_Freq_Hldy_Status_Principal	   CHAR(1);
   v_Number_of_Flows		   CHAR(3);
   v_Installment_Amount		   CHAR(17);
   v_Installment_Percentage	   CHAR(8);
   v_Number_of_Demands_Raised	   CHAR(3);
   v_Next_Installment_Date	   CHAR(10);
   v_Next_Int_Installment_Date	   CHAR(10);
   v_Frequency_Type_for_Interest   CHAR(1);
   v_Frequency_Week_Number_for_Int CHAR(1);
   v_Frequency_Week_day_for_Int	   CHAR(1);
   v_Frequency_Start_DD_for_Int	   CHAR(2);
   v_Freq_Holiday_Status_for_Int   CHAR(1);
   v_Installment_Indicator	   CHAR(1);
   
   
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

EXECUTE IMMEDIATE 'truncate table LRS_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Account_Number,v_Flow_ID,v_Flow_Start_Date,v_Frequency_Type,v_Freq_Week_Num_for_Principal,v_Freq_Week_Day_for_Principal,v_Freq_Start_DD_for_Principal,v_Freq_Hldy_Status_Principal,v_Number_of_Flows,v_Installment_Amount,v_Installment_Percentage,v_Number_of_Demands_Raised,v_Next_Installment_Date,v_Next_Int_Installment_Date,v_Frequency_Type_for_Interest,v_Frequency_Week_Number_for_Int,v_Frequency_Week_day_for_Int,v_Frequency_Start_DD_for_Int,v_Freq_Holiday_Status_for_Int,v_Installment_Indicator;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into LRS_O_TABLE values (v_Account_Number,v_Flow_ID,v_Flow_Start_Date,v_Frequency_Type,v_Freq_Week_Num_for_Principal,v_Freq_Week_Day_for_Principal,v_Freq_Start_DD_for_Principal,v_Freq_Hldy_Status_Principal,v_Number_of_Flows,v_Installment_Amount,v_Installment_Percentage,v_Number_of_Demands_Raised,v_Next_Installment_Date,v_Next_Int_Installment_Date,v_Frequency_Type_for_Interest,v_Frequency_Week_Number_for_Int,v_Frequency_Week_day_for_Int,v_Frequency_Start_DD_for_Int,v_Freq_Holiday_Status_for_Int,v_Installment_Indicator ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;