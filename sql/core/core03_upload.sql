-- File Name		: Related Party details

-- File Created for	: Upload file for balance

-- Created By		: Prashant

-- Client		: ENBD

-- Created On		: 01-11-2011
-------------------------------------------------------------------
truncate table AC2_O_TABLE;  
insert into AC2_O_TABLE  
  select 'AC2',
--   v_Indicator  			CHAR(3)
--   v_Account_Number		 	CHAR(16)
            rpad(map_acc.fin_acc_num,16,' '),
-- v_Currency 			 	CHAR(3)
            lpad(scpf.scccy,3,' '),
--   v_Service_Outlet  			CHAR(8)
            rpad(map_acc.fin_sol_id,8,' '),
--   v_Record_Type		 	CHAR(1)
            lpad('J',1,' '),
--   v_Name		 		CHAR(80)
            lpad(' ',80,' '),
--   v_Designation		 	CHAR(5)
            lpad(' ',5,' '),
--   v_Amount_allowed  			CHAR(17)
            lpad(' ',17,' '),
--   v_Start_Date  			CHAR(8)
    case when scoad <> 0 and get_date_fm_btrv(scoad) <> 'ERROR' then
           lpad(get_date_fm_btrv(scoad),8,' ')
        else lpad(' ',8,' ')
    end,
--   v_End_Date	 			CHAR(8)
            to_char(to_date(get_date_fm_btrv(get_param('CYYMMDD')),'YYYYMMDD')+1,'YYYYMMDD'),
--   v_CIF_ID			 	CHAR(32)
            lpad(map_cif.FIN_CIF_ID,32,' '),
--   v_Relation_Code			CHAR(5)
            lpad('OTHERS',5,' '),
-- v_Pass_Sheet_flag  			CHAR(1)
            'Y',
--   v_Standing_Instruction_ad_flag  	CHAR(1)
            'Y',
-- v_TD_Maturity_Notice_Flag  		CHAR(1)
            'Y',
--   v_Loan_Overdue_Notice_Flag		CHAR(1)
            'Y',
--   v_Communication_Address_1		CHAR(45)
            lpad(' ',45,' '),
--   v_Communication_Address_2		CHAR(45)
            lpad(' ',45,' '),
--   v_Communication_Address_3		CHAR(45)
            lpad(' ',45,' '),
--   v_Communication_City_Code		CHAR(5)
            lpad(' ',5,' '),
--   v_Communication_State_Code		CHAR(5)
            lpad(' ',5,' '),
--   v_Communication_Pin_Code		CHAR(6)
            lpad(' ',10,' '),
--   v_Communication_Country		CHAR(5)
            lpad(' ',5,' '),
-- v_Communication_Phone_Number		CHAR(15)
            lpad(' ',15,' '),
--   v_Communication_FAX_Number		CHAR(15)
            lpad(' ',15,' '),
-- v_Communication_Telex_Number		CHAR(15)
            lpad(' ',15,' '),
--   v_Communication_Email_Id		CHAR(50)
            lpad(' ',50,' '),
--   v_Exclude_for_combined_stateme	CHAR(1)
            'Y',
--   v_Statement_CIF_Id			CHAR(32)
            lpad(' ',32,' '),
--   v_Customer_Title_Code		CHAR(5)
            rpad(' ',5,' '),
-- v_Incert_print_flag			CHAR(1)
            lpad(' ',1,' '),
--   v_Incert_adv_flag			CHAR(1)
            lpad(' ',1,' '),
--   v_Guarantor_liab_Pcnt		CHAR(8)
            lpad(' ',8,' '),
--   v_Guarantor_liab_sequence		CHAR(2)
            lpad(' ',2,' '),
--   v_PS_freq_type		 	CHAR(1)
            lpad(' ',1,' '),
--   v_PS_freq_week_num			CHAR(1)
        lpad(' ',1,' ') end,
--   v_PS_freq_week_day			CHAR(1)
            lpad(' ',1,' '),
--   v_PS_Freq_Start_month		CHAR(2)
            lpad(' ',2,' '),
--   v_PS_freq_holiday_status		CHAR(1)
            ' ',
-- v_SWIFT_statement_serial_num		CHAR(5)
            lpad(' ',5,' '),
--   v_PS_despatch_mode			CHAR(1)
            lpad(' ',1,' '),
--   v_SWIFT_frequency_type		CHAR(1)
            lpad(' ',1,' '),
--   v_SWIFT_freq_week_number		CHAR(1)
            lpad(' ',1,' '),
--   v_SWIFT_freq_week_day		CHAR(1)
            lpad(' ',1,' '),
--   v_Swift_Freq_Start_Day		CHAR(2)
            lpad(' ',2,' '),
-- v_SWIFT_freq_holiday_status		CHAR(1)
            lpad(' ',1,' '),
-- v_SWIFT_message_type			CHAR(1)
            lpad(' ',1,' '),
-- v_SWIFT_message_receiver_bic		CHAR(12)
            lpad(' ',12,' '),
--   v_Address_type		 	CHAR(12)
            lpad(' ',12,' '),
-- v_Phone_type			 	CHAR(12)
            lpad(' ',12,' '),
-- v_Email_type			 	CHAR(12)   
            lpad(' ',12,' ')
  	from map_acc
    inner join scpf on scpf.scab||scpf.scan||scpf.scas = map_acc.LEG_ACC_NUM 
	inner join RKPF on scpf.scab||scpf.scan||scpf.scas = rkab||rkan||rkas 
	inner join map_cif on RKPCUS = LEG_CUST_NUMBER;
      COMMIT;
exit;