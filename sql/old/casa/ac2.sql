create or replace
procedure ac2
   as
   v_Indicator  			CHAR(3);
   v_Account_Number		 	CHAR(16);
   v_Currency 			 	CHAR(3);
   v_Service_Outlet  			CHAR(8);
   v_Record_Type		 	CHAR(1);
   v_Name		 		CHAR(80);
   v_Designation		 	CHAR(5);
   v_Amount_allowed  			CHAR(17);
   v_Start_Date  			CHAR(8);
   v_End_Date	 			CHAR(8);
   v_CIF_ID			 	CHAR(32);
   v_Relation_Code			CHAR(5);
   v_Pass_Sheet_flag  			CHAR(1);
   v_Standing_Instruction_ad_flag  	CHAR(1);
   v_TD_Maturity_Notice_Flag  		CHAR(1);
   v_Loan_Overdue_Notice_Flag		CHAR(1);
   v_Communication_Address_1		CHAR(45);
   v_Communication_Address_2		CHAR(45);
   v_Communication_Address_3		CHAR(45);
   v_Communication_City_Code		CHAR(5);
   v_Communication_State_Code		CHAR(5);
   v_Communication_Pin_Code		CHAR(6);
   v_Communication_Country		CHAR(5);
   v_Communication_Phone_Number		CHAR(15);
   v_Communication_FAX_Number		CHAR(15);
   v_Communication_Telex_Number		CHAR(15);
   v_Communication_Email_Id		CHAR(50);
   v_Exclude_for_combined_stateme	CHAR(1);
   v_Statement_CIF_Id			CHAR(32);
   v_Customer_Title_Code		CHAR(5);
   v_Incert_print_flag			CHAR(1);
   v_Incert_adv_flag			CHAR(1);
   v_Guarantor_liab_Pcnt		CHAR(8);
   v_Guarantor_liab_sequence		CHAR(2);
   v_PS_freq_type		 	CHAR(1);
   v_PS_freq_week_num			CHAR(1);
   v_PS_freq_week_day			CHAR(1);
   v_PS_Freq_Start_month		CHAR(2);
   v_PS_freq_holiday_status		CHAR(1);
   v_SWIFT_statement_serial_num		CHAR(5);
   v_PS_despatch_mode			CHAR(1);
   v_SWIFT_frequency_type		CHAR(1);
   v_SWIFT_freq_week_number		CHAR(1);
   v_SWIFT_freq_week_day		CHAR(1);
   v_Swift_Freq_Start_Day		CHAR(2);
   v_SWIFT_freq_holiday_status		CHAR(1);
   v_SWIFT_message_type			CHAR(1);
   v_SWIFT_message_receiver_bic		CHAR(12);
   v_Address_type		 	CHAR(12);
   v_Phone_type			 	CHAR(12);
   v_Email_type			 	CHAR(12);   
   
--  DECLARE
   CURSOR c1 is
     select 'AC2',
--   v_Indicator  			CHAR(3);
--   v_Account_Number		 	CHAR(16);
            rpad(map_acc.fin_acc_num,16,' '),
-- v_Currency 			 	CHAR(3);
            lpad(scpf.scccy,3,' '),
--   v_Service_Outlet  			CHAR(8);
            rpad(map_acc.fin_sol_id,8,' '),
--   v_Record_Type		 	CHAR(1);
            lpad('O',1,' '),
--   v_Name		 		CHAR(80);
            lpad(' ',80,' '),
--   v_Designation		 	CHAR(5);
            lpad(' ',5,' '),
--   v_Amount_allowed  			CHAR(17);
            lpad(' ',17,' '),
--   v_Start_Date  			CHAR(8);
            lpad(' ',8,' '),
--   v_End_Date	 			CHAR(8);
            lpad(' ',8,' '),
--   v_CIF_ID			 	CHAR(32);
            lpad(map_acc.fin_cif_id,32,' '),
--   v_Relation_Code			CHAR(5);
            lpad('OTHERS',5,' '),
-- v_Pass_Sheet_flag  			CHAR(1);
            'Y',
--   v_Standing_Instruction_ad_flag  	CHAR(1);
            'Y',
-- v_TD_Maturity_Notice_Flag  		CHAR(1);
            'Y',
--   v_Loan_Overdue_Notice_Flag		CHAR(1);
            'Y',
--   v_Communication_Address_1		CHAR(45);
            lpad(' ',45,' '),
--   v_Communication_Address_2		CHAR(45);
            lpad(' ',45,' '),
--   v_Communication_Address_3		CHAR(45);
            lpad(' ',45,' '),
--   v_Communication_City_Code		CHAR(5);
            lpad(' ',5,' '),
--   v_Communication_State_Code		CHAR(5);
            lpad(' ',5,' '),
--   v_Communication_Pin_Code		CHAR(6);
            lpad(' ',6,' '),
--   v_Communication_Country		CHAR(5);
            lpad(' ',5,' '),
-- v_Communication_Phone_Number		CHAR(15);
            lpad(' ',15,' '),
--   v_Communication_FAX_Number		CHAR(15);
            lpad(' ',15,' '),
-- v_Communication_Telex_Number		CHAR(15);
            lpad(' ',15,' '),
--   v_Communication_Email_Id		CHAR(50);
            lpad(' ',50,' '),
--   v_Exclude_for_combined_stateme	CHAR(1);
            'Y',
--   v_Statement_CIF_Id			CHAR(32);
            lpad(' ',32,' '),
--   v_Customer_Title_Code		CHAR(5);
            rpad('MR',5,' '),
-- v_Incert_print_flag			CHAR(1);
            lpad(' ',1,' '),
--   v_Incert_adv_flag			CHAR(1);
            lpad(' ',1,' '),
--   v_Guarantor_liab_Pcnt		CHAR(8);
            lpad(' ',8,' '),
--   v_Guarantor_liab_sequence		CHAR(2);
            lpad(' ',2,' '),
--   v_PS_freq_type		 	CHAR(1);
            lpad(MapFrequency(scsfc),1,' '),
--   v_PS_freq_week_num			CHAR(1);
        case
           when MapFrequency(scsfc)='M' then 'L'
           else lpad(' ',1,' ') end,
--   v_PS_freq_week_day			CHAR(1);
            lpad(' ',1,' '),
--   v_PS_Freq_Start_month		CHAR(2);
            lpad(substr(SCSFC,2,2),2,' '),
--   v_PS_freq_holiday_status		CHAR(1);
            'P',
-- v_SWIFT_statement_serial_num		CHAR(5);
            lpad(' ',5,' '),
--   v_PS_despatch_mode			CHAR(1);
            lpad('A',1,' '),
--   v_SWIFT_frequency_type		CHAR(1);
            lpad(' ',1,' '),
--   v_SWIFT_freq_week_number		CHAR(1);
            lpad(' ',1,' '),
--   v_SWIFT_freq_week_day		CHAR(1);
            lpad(' ',1,' '),
--   v_Swift_Freq_Start_Day		CHAR(2);
            lpad(' ',2,' '),
-- v_SWIFT_freq_holiday_status		CHAR(1);
            lpad(' ',1,' '),
-- v_SWIFT_message_type			CHAR(1);
            lpad(' ',1,' '),
-- v_SWIFT_message_receiver_bic		CHAR(12);
            lpad(' ',12,' '),
--   v_Address_type		 	CHAR(12);
            lpad(' ',12,' '),
-- v_Phone_type			 	CHAR(12);
            lpad(' ',12,' '),
-- v_Email_type			 	CHAR(12);   
            lpad(' ',12,' ')
  	from map_acc
    inner join scpf on scpf.scab||scpf.scan||scpf.scas = map_acc.LEG_ACC_NUM
    inner join s5pf on s5pf.s5ab||s5pf.s5an||s5pf.s5as = map_acc.LEG_ACC_NUM
    inner join map_cif on leg_cust_number = map_acc.leg_cust_id
    where s5ii30 ='N'
    and rownum <=10;
	   
BEGIN

Begin

EXECUTE IMMEDIATE 'truncate table AC2_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Indicator,v_Account_Number,v_Currency,v_Service_Outlet,v_Record_Type,v_Name,v_Designation,v_Amount_allowed,v_Start_Date,v_End_Date,v_CIF_ID,v_Relation_Code,v_Pass_Sheet_flag,v_Standing_Instruction_ad_flag,v_TD_Maturity_Notice_Flag,v_Loan_Overdue_Notice_Flag,v_Communication_Address_1,v_Communication_Address_2,v_Communication_Address_3,v_Communication_City_Code,v_Communication_State_Code,v_Communication_Pin_Code,v_Communication_Country,v_Communication_Phone_Number,v_Communication_FAX_Number,v_Communication_Telex_Number,v_Communication_Email_Id,v_Exclude_for_combined_stateme,v_Statement_CIF_Id,v_Customer_Title_Code,v_Incert_print_flag,v_Incert_adv_flag,v_Guarantor_liab_Pcnt,v_Guarantor_liab_sequence,v_PS_freq_type,v_PS_freq_week_num,v_PS_freq_week_day,v_PS_Freq_Start_month,v_PS_freq_holiday_status,v_SWIFT_statement_serial_num,v_PS_despatch_mode,v_SWIFT_frequency_type,v_SWIFT_freq_week_number,v_SWIFT_freq_week_day,v_Swift_Freq_Start_Day,v_SWIFT_freq_holiday_status,v_SWIFT_message_type,v_SWIFT_message_receiver_bic,v_Address_type,v_Phone_type,v_Email_type;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into AC2_O_TABLE values (v_Indicator,v_Account_Number,v_Currency,v_Service_Outlet,v_Record_Type,v_Name,v_Designation,v_Amount_allowed,v_Start_Date,v_End_Date,v_CIF_ID,v_Relation_Code,v_Pass_Sheet_flag,v_Standing_Instruction_ad_flag,v_TD_Maturity_Notice_Flag,v_Loan_Overdue_Notice_Flag,v_Communication_Address_1,v_Communication_Address_2,v_Communication_Address_3,v_Communication_City_Code,v_Communication_State_Code,v_Communication_Pin_Code,v_Communication_Country,v_Communication_Phone_Number,v_Communication_FAX_Number,v_Communication_Telex_Number,v_Communication_Email_Id,v_Exclude_for_combined_stateme,v_Statement_CIF_Id,v_Customer_Title_Code,v_Incert_print_flag,v_Incert_adv_flag,v_Guarantor_liab_Pcnt,v_Guarantor_liab_sequence,v_PS_freq_type,v_PS_freq_week_num,v_PS_freq_week_day,v_PS_Freq_Start_month,v_PS_freq_holiday_status,v_SWIFT_statement_serial_num,v_PS_despatch_mode,v_SWIFT_frequency_type,v_SWIFT_freq_week_number,v_SWIFT_freq_week_day,v_Swift_Freq_Start_Day,v_SWIFT_freq_holiday_status,v_SWIFT_message_type,v_SWIFT_message_receiver_bic,v_Address_type,v_Phone_type,v_Email_type ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;