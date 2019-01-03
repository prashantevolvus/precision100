-- File Name		: tdmaster_upload.sql

-- File Created for	: Upload file for tdmaster

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure tdmaster_upload(
v_mig_date IN TIMESTAMP
)
   as
   v_Master_Account_ID		   CHAR(16);
   v_Cif_ID			   CHAR(50);
   v_Consol_Currency_Code	   CHAR(3);
   v_Acct_Name  		   CHAR(80);
   v_Acct_Short_Name		   CHAR(10);
   v_Ac_Open_Date		   CHAR(10);
   v_Mode_of_Oper_Code		   CHAR(5);
   v_Acct_Manager		   CHAR(15);
   v_Statement_Frequency_Type	   CHAR(1);
   v_Week_num_for_Statement_Date   CHAR(1);
   v_Week_Day_for_Statement_Date   CHAR(1);
   v_Start_Date_for_statement_Date CHAR(2);
   v_Statement_Freq_case_of_Hldy   CHAR(1);
   v_Statement_of_the_Account	   CHAR(1);
   v_Next_Print_date		   CHAR(10);
   v_Despatch_Mode		   CHAR(1);
   v_Application_Ref_Id		   CHAR(50);
   v_Acct_Auto_Close_Flag	   CHAR(1);
   v_Ac_Freeze_Code		   CHAR(1);
   v_Freeze_Reason_Code1	   CHAR(5);
   v_Freeze_Reason_Code2	   CHAR(5);
   v_Freeze_Reason_Code3	   CHAR(5);
   v_Freeze_Reason_Code4	   CHAR(5);
   v_Freeze_Reason_Code5	   CHAR(5);
   v_Last_Freeze_Date		   CHAR(10);
   v_Last_Un_Freeze_Date	   CHAR(10);
   v_Freeze_Remarks		   CHAR(60);
   v_Freeze_Remarks2		   CHAR(60);
   v_Freeze_Remarks3		   CHAR(60);
   v_Freeze_Remarks4		   CHAR(60);
   v_Freeze_Remarks5		   CHAR(60);
   v_Dormancy_Waiver_Flag	   CHAR(1);
   v_Dormancy_Individual_All_Flag  CHAR(1);
   v_Account_Access_Code	   CHAR(5);
   v_Scheme_Code		   CHAR(5);
   v_Swift_Frequency_Type	   CHAR(1);
   v_Swift_Frequency_Week_Number   CHAR(1);
   v_Swift_Freq_Week_Day	   CHAR(1);
   v_Swift_Freq_Start_Day	   CHAR(2);
   v_Swift_Freq_Holiday_Status	   CHAR(1);
   v_Swift_Next_Due_Date	   CHAR(10);
   v_Swift_Msg_Type		   CHAR(1);
   v_Swift_Msg_Receiver_BIC	   CHAR(12);
   v_Pass_Sheet_Related_Party_Flg  CHAR(1);
   v_Swift_Difrent_Related__Flg	   CHAR(1);
   v_Paysys_Id			   CHAR(5);
   v_Swift_Statement_Required_Flag CHAR(1);
   v_Module_Id			   CHAR(5);
   v_Address_Type		   CHAR(12);
   v_Related_party_Phone_Type	   CHAR(12);
   v_Related_party_Email_Type	   CHAR(12);
   v_Inactive_Waiver_Flag	   CHAR(1);
   v_Inactive_Individual_All_Flag  CHAR(1);
   v_Add_Calendar_Base_processing  CHAR(2);
   v_Calendar_Base_for_Stat_Freq   CHAR(2);
   v_Acct_Name1			   CHAR(80);
   v_Acct_Short_Name1		   CHAR(10);
   v_Freeze_Remarks1		   CHAR(60);
   
   
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

EXECUTE IMMEDIATE 'truncate table TDMASTER_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Master_Account_ID,v_Cif_ID,v_Consol_Currency_Code,v_Acct_Name,v_Acct_Short_Name,v_Ac_Open_Date,v_Mode_of_Oper_Code,v_Acct_Manager,v_Statement_Frequency_Type,v_Week_num_for_Statement_Date,v_Week_Day_for_Statement_Date,v_Start_Date_for_statement_Date,v_Statement_Freq_case_of_Hldy,v_Statement_of_the_Account,v_Next_Print_date,v_Despatch_Mode,v_Application_Ref_Id,v_Acct_Auto_Close_Flag,v_Ac_Freeze_Code,v_Freeze_Reason_Code1,v_Freeze_Reason_Code2,v_Freeze_Reason_Code3,v_Freeze_Reason_Code4,v_Freeze_Reason_Code5,v_Last_Freeze_Date,v_Last_Un_Freeze_Date,v_Freeze_Remarks,v_Freeze_Remarks2,v_Freeze_Remarks3,v_Freeze_Remarks4,v_Freeze_Remarks5,v_Dormancy_Waiver_Flag,v_Dormancy_Individual_All_Flag,v_Account_Access_Code,v_Scheme_Code,v_Swift_Frequency_Type,v_Swift_Frequency_Week_Number,v_Swift_Freq_Week_Day,v_Swift_Freq_Start_Day,v_Swift_Freq_Holiday_Status,v_Swift_Next_Due_Date,v_Swift_Msg_Type,v_Swift_Msg_Receiver_BIC,v_Pass_Sheet_Related_Party_Flg,v_Swift_Difrent_Related__Flg,v_Paysys_Id,v_Swift_Statement_Required_Flag,v_Module_Id,v_Address_Type,v_Related_party_Phone_Type,v_Related_party_Email_Type,v_Inactive_Waiver_Flag,v_Inactive_Individual_All_Flag,v_Add_Calendar_Base_processing,v_Calendar_Base_for_Stat_Freq,v_Acct_Name1,v_Acct_Short_Name1,v_Freeze_Remarks1;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into TDMASTER_O_TABLE values (v_Master_Account_ID,v_Cif_ID,v_Consol_Currency_Code,v_Acct_Name,v_Acct_Short_Name,v_Ac_Open_Date,v_Mode_of_Oper_Code,v_Acct_Manager,v_Statement_Frequency_Type,v_Week_num_for_Statement_Date,v_Week_Day_for_Statement_Date,v_Start_Date_for_statement_Date,v_Statement_Freq_case_of_Hldy,v_Statement_of_the_Account,v_Next_Print_date,v_Despatch_Mode,v_Application_Ref_Id,v_Acct_Auto_Close_Flag,v_Ac_Freeze_Code,v_Freeze_Reason_Code1,v_Freeze_Reason_Code2,v_Freeze_Reason_Code3,v_Freeze_Reason_Code4,v_Freeze_Reason_Code5,v_Last_Freeze_Date,v_Last_Un_Freeze_Date,v_Freeze_Remarks,v_Freeze_Remarks2,v_Freeze_Remarks3,v_Freeze_Remarks4,v_Freeze_Remarks5,v_Dormancy_Waiver_Flag,v_Dormancy_Individual_All_Flag,v_Account_Access_Code,v_Scheme_Code,v_Swift_Frequency_Type,v_Swift_Frequency_Week_Number,v_Swift_Freq_Week_Day,v_Swift_Freq_Start_Day,v_Swift_Freq_Holiday_Status,v_Swift_Next_Due_Date,v_Swift_Msg_Type,v_Swift_Msg_Receiver_BIC,v_Pass_Sheet_Related_Party_Flg,v_Swift_Difrent_Related__Flg,v_Paysys_Id,v_Swift_Statement_Required_Flag,v_Module_Id,v_Address_Type,v_Related_party_Phone_Type,v_Related_party_Email_Type,v_Inactive_Waiver_Flag,v_Inactive_Individual_All_Flag,v_Add_Calendar_Base_processing,v_Calendar_Base_for_Stat_Freq,v_Acct_Name1,v_Acct_Short_Name1,v_Freeze_Remarks1 ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;