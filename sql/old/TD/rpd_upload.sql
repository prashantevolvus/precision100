-- File Name		: rpd_upload.sql

-- File Created for	: Upload file for RPD

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure rpd_upload(
v_mig_date IN TIMESTAMP
)
   as
   v_Indicator  		   CHAR(3);
   v_Account_Number		   CHAR(16);
   v_Currency			   CHAR(3);
   v_Service_Outlet		   CHAR(8);
   v_Record_Type		   CHAR(1);
   v_Name			   CHAR(80);
   v_Designation		   CHAR(5);
   v_Amount_allowed		   CHAR(17);
   v_Start_Date			   CHAR(8);
   v_End_Date			   CHAR(8);
   v_CIF_ID			   CHAR(32);
   v_Relation_Code		   CHAR(5);
   v_Pass_Sheet_Flag		   CHAR(1);
   v_Standing_Instruction_Adv_Flg  CHAR(1);
   v_TD_Maturity_Notice_Flg	   CHAR(1);
   v_Loan_Overdue_Notice_Flag	   CHAR(1);
   v_Communication_Address_1	   CHAR(45);
   v_Communication_Address_2	   CHAR(45);
   v_Communication_Address_3	   CHAR(45);
   v_Communication_City_Code	   CHAR(5);
   v_Communication_State_Code	   CHAR(5);
   v_Communication_Pin_Code	   CHAR(6);
   v_Communication_Country	   CHAR(5);
   v_Communication_Phone_Number	   CHAR(15);
   v_Communication_FAX_Number	   CHAR(15);
   v_Communication_Telex_Number	   CHAR(15);
   v_Communication_EMail_ID	   CHAR(50);
   v_Exclde_for_combined_statement CHAR(1);
   v_Statement_CIF_Id		   CHAR(32);
   v_Customer_Title_Code	   CHAR(5);
   v_Incert_print_flag		   CHAR(1);
   v_Incert_adv_flag		   CHAR(1);
   v_Guarantor_liab_Pcnt	   CHAR(8);
   v_Guarantor_liab_sequence	   CHAR(2);
   v_Pass_Sheet_Freq_Type	   CHAR(1);
   v_Pass_Sheet_Freq_Week_Number   CHAR(1);
   v_Pass_Sheet_Freq_Week_Day	   CHAR(1);
   v_Pass_Sheet_Freq_Day_of_Month  CHAR(2);
   v_Statement_Freq_in_case_Hldys  CHAR(1);
   v_Swift_Serial_Number	   CHAR(5);
   v_Despatch_Mode		   CHAR(1);
   v_Swift_Frequency_Type	   CHAR(1);
   v_Swift_Frequency_Week_Number   CHAR(1);
   v_Swift_Freq_Week_Day	   CHAR(1);
   v_Swift_Freq_Start_Day	   CHAR(1);
   v_Swift_Freq_Holiday_Status	   CHAR(1);
   v_Swift_Message_Type		   CHAR(1);
   v_Swift_Message_Receiver_BIC	   CHAR(12);
   v_Address_Type		   CHAR(12);
   v_Phone_Type			   CHAR(12);
   v_Email_Type			   CHAR(12);
   
   
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

EXECUTE IMMEDIATE 'truncate table RPD_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Indicator,v_Account_Number,v_Currency,v_Service_Outlet,v_Record_Type,v_Name,v_Designation,v_Amount_allowed,v_Start_Date,v_End_Date,v_CIF_ID,v_Relation_Code,v_Pass_Sheet_Flag,v_Standing_Instruction_Adv_Flg,v_TD_Maturity_Notice_Flg,v_Loan_Overdue_Notice_Flag,v_Communication_Address_1,v_Communication_Address_2,v_Communication_Address_3,v_Communication_City_Code,v_Communication_State_Code,v_Communication_Pin_Code,v_Communication_Country,v_Communication_Phone_Number,v_Communication_FAX_Number,v_Communication_Telex_Number,v_Communication_EMail_ID,v_Exclde_for_combined_statement,v_Statement_CIF_Id,v_Customer_Title_Code,v_Incert_print_flag,v_Incert_adv_flag,v_Guarantor_liab_Pcnt,v_Guarantor_liab_sequence,v_Pass_Sheet_Freq_Type,v_Pass_Sheet_Freq_Week_Number,v_Pass_Sheet_Freq_Week_Day,v_Pass_Sheet_Freq_Day_of_Month,v_Statement_Freq_in_case_Hldys,v_Swift_Serial_Number,v_Despatch_Mode,v_Swift_Frequency_Type,v_Swift_Frequency_Week_Number,v_Swift_Freq_Week_Day,v_Swift_Freq_Start_Day,v_Swift_Freq_Holiday_Status,v_Swift_Message_Type,v_Swift_Message_Receiver_BIC,v_Address_Type,v_Phone_Type,v_Email_Type;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into RPD_O_TABLE values (v_Indicator,v_Account_Number,v_Currency,v_Service_Outlet,v_Record_Type,v_Name,v_Designation,v_Amount_allowed,v_Start_Date,v_End_Date,v_CIF_ID,v_Relation_Code,v_Pass_Sheet_Flag,v_Standing_Instruction_Adv_Flg,v_TD_Maturity_Notice_Flg,v_Loan_Overdue_Notice_Flag,v_Communication_Address_1,v_Communication_Address_2,v_Communication_Address_3,v_Communication_City_Code,v_Communication_State_Code,v_Communication_Pin_Code,v_Communication_Country,v_Communication_Phone_Number,v_Communication_FAX_Number,v_Communication_Telex_Number,v_Communication_EMail_ID,v_Exclde_for_combined_statement,v_Statement_CIF_Id,v_Customer_Title_Code,v_Incert_print_flag,v_Incert_adv_flag,v_Guarantor_liab_Pcnt,v_Guarantor_liab_sequence,v_Pass_Sheet_Freq_Type,v_Pass_Sheet_Freq_Week_Number,v_Pass_Sheet_Freq_Week_Day,v_Pass_Sheet_Freq_Day_of_Month,v_Statement_Freq_in_case_Hldys,v_Swift_Serial_Number,v_Despatch_Mode,v_Swift_Frequency_Type,v_Swift_Frequency_Week_Number,v_Swift_Freq_Week_Day,v_Swift_Freq_Start_Day,v_Swift_Freq_Holiday_Status,v_Swift_Message_Type,v_Swift_Message_Receiver_BIC,v_Address_Type,v_Phone_Type,v_Email_Type ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;