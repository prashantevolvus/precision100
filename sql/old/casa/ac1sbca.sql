-- File Name		: balance.sql

-- File Created for	: Upload file for balance

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure ac1sbca
   as
   v_Indicator  			CHAR(3);
   v_Account_Number		 	CHAR(16);
   v_With_holding_tax_flg		CHAR(1);
   v_With_holding_tax_Amt_scope_f	CHAR(1);
   v_With_holding_tax_percent		CHAR(8);
   v_With_holding_tax_floor_limit	CHAR(17);
   v_CIF_ID			 	CHAR(32);
   v_Customer_Cr_Pref_Percent		CHAR(10);
   v_Customer_Dr_Pref_Percent		CHAR(10);
   v_Account_Cr_Pref_Percent	 	CHAR(10);
   v_Account_Dr_Pref_Percent		CHAR(10);
   v_Channel_Cr_Pref		 	CHAR(10);
   v_Channel_Dr_Pref		 	CHAR(10);
   v_Pegged_Flag		 	CHAR(1);
   v_Peg_Frequency_in_Mnth		CHAR(4);
   v_Peg_Frequency_in_Days		CHAR(3);
   v_Int_freq_type_Credit		CHAR(1);
   v_Int_freq_week_num_Credit		CHAR(1);
   v_Int_freq_week_day_Credit		CHAR(1);
   v_Int_freq_start_dd_Credit		CHAR(2);
   v_Int_freq_hldy_stat_Credit		CHAR(1);
   v_Next_Cr_interest_run_date		CHAR(8);
   v_Int_freq_type_Debit		CHAR(1);
   v_Int_freq_week_num_Debit		CHAR(1);
   v_Int_freq_week_day_Debit		CHAR(1);
   v_Int_freq_start_dd_Debit		CHAR(2);
   v_Int_freq_hldy_stat_Debit		CHAR(1);
   v_Next_Debit_interest_run_dt		CHAR(8);
   v_Ledger_Number			CHAR(3);
   v_Employee_Id			CHAR(10);
   v_Account_Open_Date			CHAR(8);
   v_Mode_of_Operation_Code		CHAR(5);
   v_Gl_Sub_Head_Code			CHAR(5);
   v_Scheme_Code		 	CHAR(5);
   v_Cheque_Allowed_Flag		CHAR(1);
   v_Pass_Book_Pass_Sheet_Code		CHAR(1);
   v_Freeze_Code		 	CHAR(1);
   v_Freeze_Reason_Code		 	CHAR(5);
   v_Free_Text		 		CHAR(240);
   v_Account_Dormant_Flag		CHAR(1);
   v_Free_Code_1			CHAR(5);
   v_Free_Code_2			CHAR(5);
   v_Free_Code_3			CHAR(5);
   v_Free_Code_4			CHAR(5);
   v_Free_Code_5			CHAR(5);
   v_Free_Code_6			CHAR(5);
   v_Free_Code_7			CHAR(5);
   v_Free_Code_8			CHAR(5);
   v_Free_Code_9			CHAR(5);
   v_Free_Code_10			CHAR(5);
   v_Interest_Table_Code		CHAR(5);
   v_Account_Location_Code		CHAR(5);
   v_Currency_Code		 	CHAR(3);
   v_Service_Outlet		 	CHAR(8);
   v_Account_Mgr_User_Id		CHAR(15);
   v_Account_Name		 	CHAR(80);
   v_Swift_Allowed_Flg		 	CHAR(1);
   v_Last_Transaction_Date		CHAR(8);
   v_Last_Transaction_any_date		CHAR(8);
   v_Exclude_for_combined_stateme	CHAR(1);
   v_Statement_CIF_ID		 	CHAR(32);
   v_Charge_Level_Code		 	CHAR(5);
   v_PBF_download_Flag		 	CHAR(1);
   v_wtax_level_flg		 	CHAR(1);
   v_Sanction_Limit		 	CHAR(17);
   v_Drawing_Power		 	CHAR(17);
   v_DACC_ABSOLUTE_LIMIT		CHAR(17);
   v_DACC_PERCENT_LIMIT		 	CHAR(8);
   v_Maximum_Allowed_Limit		CHAR(17);
   v_Health_Code		 	CHAR(5);
   v_Sanction_Level_Code		CHAR(5);
   v_Sanction_Reference_Number		CHAR(25);
   v_Limit_Sanction_Date		CHAR(8);
   v_Limit_Expiring_Date		CHAR(8);
   v_Account_Review_Date		CHAR(8);
   v_Loan_Paper_Date		 	CHAR(8);
   v_Sanction_Authority_Code		CHAR(5);
   v_Last_Compound_date		 	CHAR(8);
   v_Daily_compounding_of_int_fla	CHAR(1);
   v_Comp_rest_day_flag		 	CHAR(1);
   v_Use_discount_rate_flg		CHAR(1);
   v_Dummy		 		CHAR(100);
   v_Account_status_date		CHAR(8);
   v_Iban_number		 	CHAR(34);
   v_Ias_code		 		CHAR(5);
   v_channel_id		 		CHAR(5);
   v_channel_level_code		 	CHAR(5);
   v_int_suspense_amt		 	CHAR(17);
   v_penal_int_suspense_amt		CHAR(17);
   v_chrge_off_flg		 	CHAR(1);
   v_pd_flg		 		CHAR(1);
   v_pd_xfer_date		 	CHAR(8);
   v_chrge_off_date		 	CHAR(8);
   v_chrge_off_principal		CHAR(17);
   v_pending_interest		 	CHAR(17);
   v_principal_recovery		 	CHAR(17);
   v_interest_recovery		 	CHAR(17);
   v_charge_off_type		 	CHAR(1);
   v_Master_acct_num		 	CHAR(16);
   v_ps_diff_freq_rel_party_flg		CHAR(1);
   v_swift_diff_freq_rel_party_fl	CHAR(1);
   v_Address_Type		 	CHAR(12);
   v_Phone_Type		 		CHAR(12);
   v_Email_Type		 		CHAR(12);   
   v_Alternate_Account_Name		CHAR(80);
   v_Interest_Rate_Period_Months	CHAR(4);
   v_Interest_Rate_Period_Days 		CHAR(3);
   v_Interpolation_Method	 	CHAR(1);
   v_Is_Account_hedged_Flag 		CHAR(1);
   v_Used_for_netting_off_flag 		CHAR(1);
   v_Security_Indicator	 		CHAR(10);
   v_Debt_Security	 		CHAR(1);
   v_Security_Code	 		CHAR(8);
   v_schm_Type		 		CHAR(5);   
   
--  DECLARE
   CURSOR c1 is
     select 'AC1',
--   v_Indicator  			CHAR(3);
--   v_Account_Number		 	CHAR(16);
            rpad(map_acc.fin_acc_num,16,' '),
--   v_With_holding_tax_flg		CHAR(1);
            lpad(' ',1,' '),
--	case
--	  when schm_code = 'SBNRO' then 'W'
--	  else ' ' end,
--   v_With_holding_tax_Amt_scope_f	CHAR(1);
--	case
--	  when schm_code = 'SBNRO' then 'P'
--	  else ' ' end,
            lpad(' ',1,' '),
--   v_With_holding_tax_percent		CHAR(8);
            lpad(' ',8,' '),
--   v_With_holding_tax_floor_limit	CHAR(17);
            lpad(' ',17,' '),
--   v_CIF_ID			 	CHAR(32);
            rpad(map_cif.fin_cif_id,32,' '),
--   v_Customer_Cr_Pref_Percent		CHAR(10);
            lpad(' ',10,' '),
--   v_Customer_Dr_Pref_Percent		CHAR(10);
            lpad(' ',10,' '),
--   v_Account_Cr_Pref_Percent	 	CHAR(10);
            lpad('0',10,' '),
--   v_Account_Dr_Pref_Percent		CHAR(10);
            lpad(to_number(map_acc.ACCT_PREF_INT_CR),10,' '),
--   v_Channel_Cr_Pref		 	CHAR(10);
            lpad('0',10,' '),
--   v_Channel_Dr_Pref		 	CHAR(10);
            lpad('0',10,' '),
--   v_Pegged_Flag		 	CHAR(1);
            'N',
--   v_Peg_Frequency_in_Mnth		CHAR(4);
            lpad(' ',4,' '),
--   v_Peg_Frequency_in_Days		CHAR(3);
            lpad(' ',3,' '),
--   v_Int_freq_type_Credit		CHAR(1);
	case
	   when schm_type = 'SBA' then 'H'
	   else ' ' end,
--   v_Int_freq_week_num_Credit		CHAR(1);
            lpad(' ',1,' '),
--   v_Int_freq_week_day_Credit		CHAR(1);
            lpad(' ',1,' '),
--   v_Int_freq_start_dd_Credit		CHAR(2);
            lpad(' ',2,' '),
--  v_Int_freq_hldy_stat_Credit		CHAR(1);
    case
    when schm_type ='SBA' then 'P'
    else ' ' end,
--  v_Next_Cr_interest_run_date		CHAR(8);
	   lpad(' ',8,' '),
--   v_Int_freq_type_Debit		CHAR(1);
            'M',
--   v_Int_freq_week_num_Debit		CHAR(1);
            lpad(' ',1,' '),
--   v_Int_freq_week_day_Debit		CHAR(1);
            lpad(' ',1,' '),
--   v_Int_freq_start_dd_Debit		CHAR(2);
            lpad(' ',2,' '),
--   v_Int_freq_hldy_stat_Debit		CHAR(1);
            'P',
-- v_Next_Debit_interest_run_dt		CHAR(8);
            lpad(' ',8,' '),
--   v_Ledger_Number			CHAR(3);
            lpad(' ',3,' '),
--   v_Employee_Id			CHAR(10);
            lpad(' ',10,' '),
--  v_Account_Open_Date			CHAR(8);
	    to_char(to_date(pack_mig_EQ3.get_date_fm_btrv(scoad),'DD/MM/YYYY'),'YYYYMMDD'),
--   v_Mode_of_Operation_Code		CHAR(5);
            lpad(' ',5,' '),
--   v_Gl_Sub_Head_Code			CHAR(5);
            lpad(tbaadm.gss.GL_SUB_HEAD_CODE,5,' '),
--   v_Scheme_Code		 	CHAR(5);
            lpad(MAP_ACC.SCHM_CODE,5,' '),
--   v_Cheque_Allowed_Flag		CHAR(1);
            'Y',
--  v_Pass_Book_Pass_Sheet_Code		CHAR(1);
            'S',
--   v_Freeze_Code		 	CHAR(1);
	  case
	     when scai17 = 'Y' then 'T'
	     when scai11 = 'Y' then 'C'
	     when scai12 = 'Y' then 'D'
	       else ' ' end,
-- v_Freeze_Reason_Code		 	CHAR(5);
      case
         when v_Freeze_Code = ' ' then ' '
         else rpad('MIG',5,' ') end,
--  v_Free_Text		 		CHAR(240);
            lpad(' ',240,' '),
--   v_Account_Dormant_Flag		CHAR(1);
	  case
	     when scai20 = 'Y' then 'D'
	     when scai95 = 'Y' then 'I'
	       else 'A' end,
--   v_Free_Code_1			CHAR(5);
            lpad(' ',5,' '),
--   v_Free_Code_2			CHAR(5);
            lpad(' ',5,' '),
--   v_Free_Code_3			CHAR(5);
            lpad('MIG',5,' '),
--   v_Free_Code_4			CHAR(5);
            lpad(' ',5,' '),
--   v_Free_Code_5			CHAR(5);
            lpad(' ',5,' '),
--   v_Free_Code_6			CHAR(5);
            lpad(' ',5,' '),
--   v_Free_Code_7			CHAR(5);
            lpad(' ',5,' '),
--   v_Free_Code_8			CHAR(5);
            lpad(' ',5,' '),
--   v_Free_Code_9			CHAR(5);
            lpad(' ',5,' '),
--   v_Free_Code_10			CHAR(5);
            lpad(' ',5,' '),
--   v_Interest_Table_Code		CHAR(5);
            lpad(MAP_ACC.INT_TBL_CODE,5,' '),
--   v_Account_Location_Code		CHAR(5);
            rpad(map_acc.fin_sol_id,5,' '),
--   v_Currency_Code		 	CHAR(3);
            lpad(scpf.scccy,3,' '),
--   v_Service_Outlet		 	CHAR(8);
            rpad(map_acc.fin_sol_id,8,' '),
--   v_Account_Mgr_User_Id		CHAR(15);
            lpad(' ',15,' '),
--   v_Account_Name		 	CHAR(80);
            rpad(scpf.scshn,80,' '),
--  v_Swift_Allowed_Flg		 	CHAR(1);
            'N',
--   v_Last_Transaction_Date		CHAR(8);
            lpad(' ',8,' '),
--  v_Last_Transaction_any_date		CHAR(8);
            lpad(' ',8,' '),
--   v_Exclude_for_combined_stateme	CHAR(1);
            lpad(' ',1,' '),
--   v_Statement_CIF_ID		 	CHAR(32);
            lpad(' ',32,' '),
--  v_Charge_Level_Code		 	CHAR(5);
            lpad(' ',5,' '),
-- v_PBF_download_Flag		 	CHAR(1);
            'Y',
--   v_wtax_level_flg		 	CHAR(1);
            'S',
--   v_Sanction_Limit		 	CHAR(17);
            lpad(' ',5,' '),
--   v_Drawing_Power		 	CHAR(17);
            lpad(substr(scpf.scodl,1,17),17,' '),
--   v_DACC_ABSOLUTE_LIMIT		CHAR(17);
            lpad(' ',17,' '),
-- v_DACC_PERCENT_LIMIT		 	CHAR(8);
            lpad(' ',8,' '),
--   v_Maximum_Allowed_Limit		CHAR(17);
            '99999999999999.99',
--   v_Health_Code		 	CHAR(5);
            lpad('MIG',5,' '),
--   v_Sanction_Level_Code		CHAR(5);
            lpad(' ',5,' '),
-- v_Sanction_Reference_Number		CHAR(25);
            lpad(' ',25,' '),
--   v_Limit_Sanction_Date		CHAR(8);
            lpad(' ',8,' '),
--   v_Limit_Expiring_Date		CHAR(8);
            lpad(' ',8,' '),
--   v_Account_Review_Date		CHAR(8);
            lpad(' ',8,' '),
--   v_Loan_Paper_Date		 	CHAR(8);
            lpad(' ',8,' '),
--   v_Sanction_Authority_Code		CHAR(5);
            lpad(' ',5,' '),
-- v_Last_Compound_date		 	CHAR(8);
            lpad(' ',8,' '),
--   v_Daily_compounding_of_int_fla	CHAR(1);
            lpad(' ',1,' '),
-- v_Comp_rest_day_flag		 	CHAR(1);
            lpad(' ',1,' '),
--   v_Use_discount_rate_flg		CHAR(1);
            lpad(' ',1,' '),
--   v_Dummy		 		CHAR(100);
            lpad(' ',100,' '),
--   v_Account_status_date		CHAR(8);
            lpad(' ',8,' '),
--	    to_char(to_date(pack_mig_EQ3.get_date_fm_btrv(scdlm),'DD/MM/YYYY'),'YYYYMMDD'),
--   v_Iban_number		 	CHAR(34);
            lpad(' ',34,' '),
--   v_Ias_code		 		CHAR(5);
            lpad(' ',5,' '),
-- v_channel_id		 		CHAR(5);
            lpad(' ',5,' '),
-- v_channel_level_code		 	CHAR(5);
            lpad(' ',5,' '),
--   v_int_suspense_amt		 	CHAR(17);
            lpad('0',17,' '),
--   v_penal_int_suspense_amt		CHAR(17);
            lpad('0',17,' '),
--   v_chrge_off_flg		 	CHAR(1);
            lpad(' ',1,' '),
--   v_pd_flg		 		CHAR(1);
            'N',
--   v_pd_xfer_date		 	CHAR(8);
            lpad(' ',8,' '),
--   v_chrge_off_date		 	CHAR(8);
            lpad(' ',8,' '),
--   v_chrge_off_principal		CHAR(17);
            lpad(' ',17,' '),
--   v_pending_interest		 	CHAR(17);
            lpad(' ',17,' '),
-- v_principal_recovery		 	CHAR(17);
            lpad(' ',17,' '),
-- v_interest_recovery		 	CHAR(17);
            lpad(' ',17,' '),
--   v_charge_off_type		 	CHAR(1);
            lpad(' ',1,' '),
--   v_Master_acct_num		 	CHAR(16);
            lpad(' ',16,' '),
-- v_ps_diff_freq_rel_party_flg		CHAR(1);
            lpad(' ',1,' '),
--   v_swift_diff_freq_rel_party_fl	CHAR(1);
            lpad(' ',1,' '),
--   v_Address_Type		 	CHAR(12);
            lpad(' ',12,' '),
-- v_Phone_Type		 		CHAR(12);
            lpad(' ',12,' '),
-- v_Email_Type		 		CHAR(12);   
            lpad(' ',12,' '),
--   v_Alternate_Account_Name		CHAR(80);
            lpad(' ',80,' '),
--   v_Interest_Rate_Period_Months	CHAR(4);
            lpad(' ',4,' '),
-- v_Interest_Rate_Period_Days 		CHAR(3);
            lpad(' ',3,' '),
--   v_Interpolation_Method	 	CHAR(1);
            lpad(' ',1,' '),
--   v_Is_Account_hedged_Flag 		CHAR(1);
            lpad(' ',1,' '),
-- v_Used_for_netting_off_flag 		CHAR(1);
            lpad(' ',1,' '),
-- v_Security_Indicator	 		CHAR(10);
            lpad(' ',10,' '),
--   v_Debt_Security	 		CHAR(1);
            lpad(' ',1,' '),
--   v_Security_Code	 		CHAR(8);
            lpad('999',8,' '),
	    map_acc.schm_type
  	from map_acc
    inner join scpf on scpf.scab||scpf.scan||scpf.scas= map_acc.LEG_ACC_NUM
    inner join s5pf on s5pf.s5ab||s5pf.s5an||s5pf.s5as = map_acc.LEG_ACC_NUM
    inner join map_cif on leg_cust_number = map_acc.leg_cust_id
--    left join bgpf on bgpf.bgab||bgpf.bgan||bgpf.bgas = map_acc.LEG_ACC_NUM
    left join tbaadm.gss on tbaadm.gss.schm_code = map_acc.schm_code
--	where map_acc.LEG_ACC_NUM=scpf.scab||scpf.scan||scpf.scas
--	and map_acc.LEG_ACC_NUM=s5pf.s5ab||s5pf.s5an||s5pf.s5as
--	and map_acc.LEG_ACC_NUM=bgpf.bgab||bgpf.bgan||bgpf.bgas
	where schm_type in ('SBA','CAA')
  and s5ii30 ='N'
  and tbaadm.gss.schm_code = map_acc.schm_code
  and tbaadm.gss.DEFAULT_FLG='Y'
  and map_acc.fin_sol_id='0006';
--  and tbaadm.gss.del_flg <>'Y'
--  and rownum <=10;


BEGIN
   
begin

EXECUTE IMMEDIATE 'truncate table AC1SBCA_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Indicator,v_Account_Number,v_With_holding_tax_flg,v_With_holding_tax_Amt_scope_f,v_With_holding_tax_percent,v_With_holding_tax_floor_limit,v_CIF_ID,v_Customer_Cr_Pref_Percent,v_Customer_Dr_Pref_Percent,v_Account_Cr_Pref_Percent,v_Account_Dr_Pref_Percent,v_Channel_Cr_Pref,v_Channel_Dr_Pref,v_Pegged_Flag,v_Peg_Frequency_in_Mnth,v_Peg_Frequency_in_Days,v_Int_freq_type_Credit,v_Int_freq_week_num_Credit,v_Int_freq_week_day_Credit,v_Int_freq_start_dd_Credit,v_Int_freq_hldy_stat_Credit,v_Next_Cr_interest_run_date,v_Int_freq_type_Debit,v_Int_freq_week_num_Debit,v_Int_freq_week_day_Debit,v_Int_freq_start_dd_Debit,v_Int_freq_hldy_stat_Debit,v_Next_Debit_interest_run_dt,v_Ledger_Number,v_Employee_Id,v_Account_Open_Date,v_Mode_of_Operation_Code,v_Gl_Sub_Head_Code,v_Scheme_Code,v_Cheque_Allowed_Flag,v_Pass_Book_Pass_Sheet_Code,v_Freeze_Code,v_Freeze_Reason_Code,v_Free_Text,v_Account_Dormant_Flag,v_Free_Code_1,v_Free_Code_2,v_Free_Code_3,v_Free_Code_4,v_Free_Code_5,v_Free_Code_6,v_Free_Code_7,v_Free_Code_8,v_Free_Code_9,v_Free_Code_10,v_Interest_Table_Code,v_Account_Location_Code,v_Currency_Code,v_Service_Outlet,v_Account_Mgr_User_Id,v_Account_Name,v_Swift_Allowed_Flg,v_Last_Transaction_Date,v_Last_Transaction_any_date,v_Exclude_for_combined_stateme,v_Statement_CIF_ID,v_Charge_Level_Code,v_PBF_download_Flag,v_wtax_level_flg,v_Sanction_Limit,v_Drawing_Power,v_DACC_ABSOLUTE_LIMIT,v_DACC_PERCENT_LIMIT,v_Maximum_Allowed_Limit,v_Health_Code,v_Sanction_Level_Code,v_Sanction_Reference_Number,v_Limit_Sanction_Date,v_Limit_Expiring_Date,v_Account_Review_Date,v_Loan_Paper_Date,v_Sanction_Authority_Code,v_Last_Compound_date,v_Daily_compounding_of_int_fla,v_Comp_rest_day_flag,v_Use_discount_rate_flg,v_Dummy,v_Account_status_date,v_Iban_number,v_Ias_code,v_channel_id,v_channel_level_code,v_int_suspense_amt,v_penal_int_suspense_amt,v_chrge_off_flg,v_pd_flg,v_pd_xfer_date,v_chrge_off_date,v_chrge_off_principal,v_pending_interest,v_principal_recovery,v_interest_recovery,v_charge_off_type,v_Master_acct_num,v_ps_diff_freq_rel_party_flg,v_swift_diff_freq_rel_party_fl,v_Address_Type,v_Phone_Type,v_Email_Type,v_Alternate_Account_Name,v_Interest_Rate_Period_Months,v_Interest_Rate_Period_Days,v_Interpolation_Method,v_Is_Account_hedged_Flag,v_Used_for_netting_off_flag,v_Security_Indicator,v_Debt_Security,v_Security_Code,v_schm_Type;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into AC1SBCA_O_TABLE values (v_Indicator,v_Account_Number,v_With_holding_tax_flg,v_With_holding_tax_Amt_scope_f,v_With_holding_tax_percent,v_With_holding_tax_floor_limit,v_CIF_ID,v_Customer_Cr_Pref_Percent,v_Customer_Dr_Pref_Percent,v_Account_Cr_Pref_Percent,v_Account_Dr_Pref_Percent,v_Channel_Cr_Pref,v_Channel_Dr_Pref,v_Pegged_Flag,v_Peg_Frequency_in_Mnth,v_Peg_Frequency_in_Days,v_Int_freq_type_Credit,v_Int_freq_week_num_Credit,v_Int_freq_week_day_Credit,v_Int_freq_start_dd_Credit,v_Int_freq_hldy_stat_Credit,v_Next_Cr_interest_run_date,v_Int_freq_type_Debit,v_Int_freq_week_num_Debit,v_Int_freq_week_day_Debit,v_Int_freq_start_dd_Debit,v_Int_freq_hldy_stat_Debit,v_Next_Debit_interest_run_dt,v_Ledger_Number,v_Employee_Id,v_Account_Open_Date,v_Mode_of_Operation_Code,v_Gl_Sub_Head_Code,v_Scheme_Code,v_Cheque_Allowed_Flag,v_Pass_Book_Pass_Sheet_Code,v_Freeze_Code,v_Freeze_Reason_Code,v_Free_Text,v_Account_Dormant_Flag,v_Free_Code_1,v_Free_Code_2,v_Free_Code_3,v_Free_Code_4,v_Free_Code_5,v_Free_Code_6,v_Free_Code_7,v_Free_Code_8,v_Free_Code_9,v_Free_Code_10,v_Interest_Table_Code,v_Account_Location_Code,v_Currency_Code,v_Service_Outlet,v_Account_Mgr_User_Id,v_Account_Name,v_Swift_Allowed_Flg,v_Last_Transaction_Date,v_Last_Transaction_any_date,v_Exclude_for_combined_stateme,v_Statement_CIF_ID,v_Charge_Level_Code,v_PBF_download_Flag,v_wtax_level_flg,v_Sanction_Limit,v_Drawing_Power,v_DACC_ABSOLUTE_LIMIT,v_DACC_PERCENT_LIMIT,v_Maximum_Allowed_Limit,v_Health_Code,v_Sanction_Level_Code,v_Sanction_Reference_Number,v_Limit_Sanction_Date,v_Limit_Expiring_Date,v_Account_Review_Date,v_Loan_Paper_Date,v_Sanction_Authority_Code,v_Last_Compound_date,v_Daily_compounding_of_int_fla,v_Comp_rest_day_flag,v_Use_discount_rate_flg,v_Dummy,v_Account_status_date,v_Iban_number,v_Ias_code,v_channel_id,v_channel_level_code,v_int_suspense_amt,v_penal_int_suspense_amt,v_chrge_off_flg,v_pd_flg,v_pd_xfer_date,v_chrge_off_date,v_chrge_off_principal,v_pending_interest,v_principal_recovery,v_interest_recovery,v_charge_off_type,v_Master_acct_num,v_ps_diff_freq_rel_party_flg,v_swift_diff_freq_rel_party_fl,v_Address_Type,v_Phone_Type,v_Email_Type,v_Alternate_Account_Name,v_Interest_Rate_Period_Months,v_Interest_Rate_Period_Days,v_Interpolation_Method,v_Is_Account_hedged_Flag,v_Used_for_netting_off_flag,v_Security_Indicator,v_Debt_Security,v_Security_Code ); 
      

      COMMIT;


   END LOOP;
   CLOSE c1;
END;