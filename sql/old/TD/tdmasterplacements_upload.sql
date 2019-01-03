-- File Name		: tdmasterplacements_upload.sql

-- File Created for	: Upload file for tdmasterplacements

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure tdmasterplacements_upload(
v_mig_date IN TIMESTAMP
)
   as
   v_Indicator			    CHAR(3);
   v_Employee_Id		    CHAR(9);
   v_Customer_Credit_Pref_Percent   CHAR(10);
   v_Customer_Debit_Pref_Percent    CHAR(10);
   v_Account_Credit_Pref_Percent    CHAR(10);
   v_Account_Debit_Pref_Percent	    CHAR(10);
   v_Channel_Credit_Pref_Percent    CHAR(10);
   v_Channel_Debit_Pref_Percent	    CHAR(10);
   v_Pegged_Flag		    CHAR(1);
   v_Peg_Frequency_in_Months	    CHAR(4);
   v_Peg_Frequency_in_Days	    CHAR(3);
   v_sulabh_flg			    CHAR(1);
   v_interest_accrual_flag 	    CHAR(1);
   v_Passbook_Sheet_Receipt_Ind	    CHAR(1);
   v_With_holdng_tax_amt_scope_flg  CHAR(1);
   v_With_holding_tax_flag	    CHAR(1);
   v_safe_custody_flag		    CHAR(1);
   v_cash_excp_amount_limit	    CHAR(17);
   v_clearing_excp_amount_limit	    CHAR(17);
   v_Transfer_excp_amount_limit	    CHAR(17);
   v_cash_cr_excp_amt_lim	    CHAR(17);
   v_Clearing_cr_excp_amt_lim	    CHAR(17);
   v_Transfer_cr_excp_amt_lim	    CHAR(17);
   v_Deposit_Account_Number	    CHAR(16);
   v_Currency_Code		    CHAR(3);
   v_SOL_ID			    CHAR(8);
   v_GL_Sub_head_code		    CHAR(5);
   v_Scheme_Code		    CHAR(5);
   v_CIF_ID			    CHAR(32);
   v_Deposit_amount		    CHAR(17);
   v_Deposit_period_months	    CHAR(3);
   v_Deposit_period_days	    CHAR(3);
   v_Interest_table_code	    CHAR(5);
   v_Mode_of_operation		    CHAR(5);
   v_Account_location_code	    CHAR(5);
   v_Auto_Renewal_Flag		    CHAR(1);
   v_Prd_in_mnths_for_auto_renewal  CHAR(3);
   v_Prd_in_days_for_auto_renewal   CHAR(3);
   v_Account_Open_Date		    CHAR(8);
   v_Open_Effective_Date	    CHAR(8);
   v_Nominee_Print_Flag		    CHAR(1);
   v_Printing_Flag		    CHAR(1);
   v_Ledger_Number		    CHAR(3);
   v_Last_Credit_Int_Posted_Date    CHAR(8);
   v_Last_Credit_Int_Run_Date	    CHAR(8);
   v_Last_Interest_Provision_Date   CHAR(8);
   v_Printed_date		    CHAR(8);
   v_Cumulative_Interest_Paid	    CHAR(17);
   v_Cumulative_interest_credited   CHAR(17);
   v_Cumulative_installments_paid   CHAR(17);
   v_Maturity_amount		    CHAR(17);
   v_Operative_Account_Number	    CHAR(16);
   v_Operative_Account_Crncy_Code   CHAR(3);
   v_Operative_Account_SOL	    CHAR(8);
   v_Notice_prd_Mnts_forNotice_Dep  CHAR(3);
   v_Notice_prd_Days_forNotice_Dep  CHAR(3);
   v_Stamp_Duty_Borne_By_Cust	    CHAR(8);
   v_Stamp_Duty_Amount		    CHAR(1);
   v_Stamp_Duty_Amount_Crncy_Code   CHAR(17);
   v_Original_Deposit_Amt	    CHAR(3);
   v_Absolute_Rate_of_Interest	    CHAR(17);
   v_Exclude_for_combined_stmnt	    CHAR(8);
   v_Statement_CIF_ID		    CHAR(1);
   v_Maturity_Date		    CHAR(32);
   v_Treasury_Rate_MOR		    CHAR(8);
   v_Renewal_Option		    CHAR(8);
   v_Renewal_Amount		    CHAR(1);
   v_Additional_Amt		    CHAR(17);
   v_Addnl_Amt_Crncy		    CHAR(17);
   v_Renewal_Crncy		    CHAR(3);
   v_Additional_Source_Account	    CHAR(16);
   v_Aditional_Src_acct_Crncy_Code  CHAR(3);
   v_Additional_Ac_Sol_Id	    CHAR(8);
   v_Additional_Rate_Code	    CHAR(5);
   v_Renewal_Rate_Code		    CHAR(5);
   v_Additional_Rate		    CHAR(8);
   v_Renewal_Rate		    CHAR(8);
   v_Link_Operative_Account	    CHAR(16);
   v_Break_in_Steps_Of		    CHAR(17);
   v_wtax_level_flg		    CHAR(1);
   v_Wtax_pcnt			    CHAR(8);
   v_Wtax_floor_limit		    CHAR(17);
   v_Iban_number		    CHAR(34);
   v_Ias_code			    CHAR(5);
   v_Channel_ID			    CHAR(5);
   v_Channel_Level_Code		    CHAR(5);
   v_Master_acct_num		    CHAR(16);
   v_acct_status		    CHAR(1);
   v_acct_status_date		    CHAR(8);
   v_Dummy			    CHAR(100);
   v_ps_diff_freq_rel_party_flg	    CHAR(1);
   v_swift_diff_freq_rel_party_flg  CHAR(1);
   v_Fixed_instal_amt_Amt_topup	    CHAR(17);
   v_Normal_Installment_Percentage  CHAR(10);
   v_Installment_basis		    CHAR(1);
   v_Max_missed_contribut_allowed   CHAR(3);
   v_Auto_closure_of_irregular_act  CHAR(1);
   v_Total_num_of_missed_contribut  CHAR(3);
   v_Account_Irregular_status	    CHAR(1);
   v_Account_Irregular_Status_Date  CHAR(8);
   v_Cumulative_Normal_Instal_paid  CHAR(17);
   v_Cumulative_Initial_Dep_paid    CHAR(17);
   v_Cumulative_Top_up_paid	    CHAR(17);
   v_AutoClosure_Zero_Bal_Acct_Mnts CHAR(3);
   v_AutoClosure_Zero_Bal_Acct_Days CHAR(3);
   v_Last_Bonus_Run_Date	    CHAR(8);
   v_Last_Calculated_Bonus_Amount   CHAR(17);
   v_Bonus_Up_to_Date		    CHAR(17);
   v_Next_Bonus_Run_Date	    CHAR(8);
   v_Normal_Int_Paid_tilllast_Bonus CHAR(17);
   v_Bonus_Cycle		    CHAR(3);
   v_Last_Calc_Bonus_percentage	    CHAR(10);
   v_Penalty_Amount		    CHAR(17);
   v_Penalty_Charge_Event_Id	    CHAR(25);
   v_Address_Type		    CHAR(12);
   v_Phone_Type			    CHAR(12);
   v_Email_Type			    CHAR(12);
   v_Local_Deposit_period_months    CHAR(3);
   v_Local_Deposit_period_days	    CHAR(3);
   v_Is_Account_hedged_flag	    CHAR(1);
   v_Used_For_Netting_Off_flag	    CHAR(1);
   
   
--  DECLARE
   CURSOR c1 is
-- v_Indicator			    CHAR(3);
     select 'TAM',
--   v_Employee_Id		    CHAR(9);
            lpad(' ',9,' '),
-- v_Customer_Credit_Pref_Percent   CHAR(10);
            lpad(' ',10,' '),
-- v_Customer_Debit_Pref_Percent    CHAR(10);
            lpad(' ',10,' '),
-- v_Account_Credit_Pref_Percent    CHAR(10);
            lpad(' ',10,' '),
-- v_Account_Debit_Pref_Percent	    CHAR(10);
            lpad(' ',10,' '),
-- v_Channel_Credit_Pref_Percent    CHAR(10);
            lpad(' ',10,' '),
-- v_Channel_Debit_Pref_Percent	    CHAR(10);
            lpad(' ',10,' '),
--   v_Pegged_Flag		    CHAR(1);
            'N',
--   v_Peg_Frequency_in_Months	    CHAR(4);
            lpad(' ',4,' '),
--   v_Peg_Frequency_in_Days	    CHAR(3);
            lpad(' ',3,' '),
-- v_sulabh_flg			    CHAR(1);
            'N',
--   v_interest_accrual_flag	    CHAR(1);
            'Y',
-- v_Passbook_Sheet_Receipt_Ind	    CHAR(1);
            'N',
-- v_With_holdng_tax_amt_scope_flg  CHAR(1);
            lpad(' ',1,' '),
--   v_With_holding_tax_flag	    CHAR(1);
            lpad(' ',1,' '),
-- v_safe_custody_flag		    CHAR(1);
            'N',
--   v_cash_excp_amount_limit	    CHAR(17);
            lpad(' ',17,' '),
-- v_clearing_excp_amount_limit	    CHAR(17);
            lpad(' ',17,' '),
-- v_Transfer_excp_amount_limit	    CHAR(17);
            lpad(' ',17,' '),
--   v_cash_cr_excp_amt_lim	    CHAR(17);
            lpad(' ',17,' '),
--   v_Clearing_cr_excp_amt_lim	    CHAR(17);
            lpad(' ',17,' '),
--   v_Transfer_cr_excp_amt_lim	    CHAR(17);
            lpad(' ',17,' '),
--   v_Deposit_Account_Number	    CHAR(16);
            lpad(map_acc.fin_acc_num,16,' '),
--   v_Currency_Code		    CHAR(3);
            lpad(map_acc.currency,3,' '),
--   v_SOL_ID			    CHAR(8);
            lpad(map_acc.fin_sol_id,8,' '),
--   v_GL_Sub_head_code		    CHAR(5);
            lpad(map_acc.gl_sub_code,5,' '),
--   v_Scheme_Code		    CHAR(5);
            lpad(map_acc.schm_code,5,' '),
--   v_CIF_ID			    CHAR(32);
            lpad(map_acc.fin_cif_id,32,' '),
--   v_Deposit_amount		    CHAR(17);
            lpad(to_number((v5bal)/POWER(10,C8CED)),17,' '),
--   v_Deposit_period_months	    CHAR(3);
	    case 
		when v5prc=jrprc then vw_dep_period.period_in_months end,
--   v_Deposit_period_days	    CHAR(3);
		when v5prc=jrprc then vw_dep_period.period_in_days end,
--   v_Interest_table_code	    CHAR(5);
            lpad(map_acc.int_tbl_code,5,' '),
--  v_Mode_of_operation		    CHAR(5);
            'SINGL',
--   v_Account_location_code	    CHAR(5);
            lpad(' ',5,' '),
--  v_Auto_Renewal_Flag		    CHAR(1);
	   case
	      when v5nrd='9999999' then 'Y'
		else 'N' end,
-- v_Prd_in_mnths_for_auto_renewal  CHAR(3);
            lpad(' ',3,' '),
-- v_Prd_in_days_for_auto_renewal   CHAR(3);
            lpad(' ',3,' '),
--  v_Account_Open_Date		    CHAR(8);
	    to_char(to_date(pack_mig_EQ3.get_date_fm_btrv(otsdte),'DD/MM/YYYY'),'YYYYMMDD'),
--   v_Open_Effective_Date	    CHAR(8);
	    to_char(to_date(pack_mig_EQ3.get_date_fm_btrv(otsdte),'DD/MM/YYYY'),'YYYYMMDD'),
-- v_Nominee_Print_Flag		    CHAR(1);
            'Y',
--   v_Printing_Flag		    CHAR(1);
            'Y',
--   v_Ledger_Number		    CHAR(3);
            lpad(' ',3,' '),
-- v_Last_Credit_Int_Posted_Date    CHAR(8);
	    to_char(to_date(pack_mig_EQ3.get_date_fm_btrv(v5lcd),'DD/MM/YYYY'),'YYYYMMDD'),
--   v_Last_Credit_Int_Run_Date	    CHAR(8);
	    to_char(to_date(pack_mig_EQ3.get_date_fm_btrv(v5lcd),'DD/MM/YYYY'),'YYYYMMDD'),
-- v_Last_Interest_Provision_Date   CHAR(8);
            lpad(' ',8,' '),
--   v_Printed_date		    CHAR(8);
	    to_char(to_date(pack_mig_EQ3.get_date_fm_btrv(otsdte),'DD/MM/YYYY'),'YYYYMMDD'),
--   v_Cumulative_Interest_Paid	    CHAR(17);
		case
		   when map_acc.CAPITALISED_FLG = 'N' then lpad(to_number((v5am4)/POWER(10,C8CED)),17,' ')
		else '0' end,
-- v_Cumulative_interest_credited   CHAR(17);
            lpad(to_number((v5am4)/POWER(10,C8CED)),17,' '),
-- v_Cumulative_installments_paid   CHAR(17);
            lpad(' ',17,' '),
--   v_Maturity_amount		    CHAR(17);
            lpad(' ',17,' '),
--   v_Operative_Account_Number	    CHAR(16);
            lpad(' ',16,' '),
-- v_Operative_Account_Crncy_Code   CHAR(3);
            lpad(' ',3,' '),
--   v_Operative_Account_SOL	    CHAR(8);
            lpad(' ',8,' '),
-- v_Notice_prd_Mnts_forNotice_Dep  CHAR(3);
            lpad(' ',3,' '),
-- v_Notice_prd_Days_forNotice_Dep  CHAR(3);
            lpad(' ',3,' '),
--   v_Stamp_Duty_Borne_By_Cust	    CHAR(8);
            lpad(' ',8,' '),
-- v_Stamp_Duty_Amount		    CHAR(1);
            lpad(' ',1,' '),
-- v_Stamp_Duty_Amount_Crncy_Code   CHAR(17);
            lpad(' ',17,' '),
--   v_Original_Deposit_Amt	    CHAR(3);
            lpad(' ',3,' '),
-- v_Absolute_Rate_of_Interest	    CHAR(17);
            lpad(v5pf.v5rat,17,' '),
-- v_Exclude_for_combined_stmnt	    CHAR(8);
            lpad(' ',8,' '),
--   v_Statement_CIF_ID		    CHAR(1);
            lpad(' ',1,' '),
--   v_Maturity_Date		    CHAR(32);
            lpad(' ',32,' '),
--  v_Treasury_Rate_MOR		    CHAR(8);
            lpad(' ',8,' '),
--   v_Renewal_Option		    CHAR(8);
            'M',
--   v_Renewal_Amount		    CHAR(1);
            lpad(' ',1,' '),
--   v_Additional_Amt		    CHAR(17);
            lpad(' ',17,' '),
--   v_Addnl_Amt_Crncy		    CHAR(17);
            lpad(' ',17,' '),
--   v_Renewal_Crncy		    CHAR(3);
            lpad(' ',3,' '),
-- v_Additional_Source_Account	    CHAR(16);
            lpad(' ',16,' '),
-- v_Aditional_Src_acct_Crncy_Code  CHAR(3);
            lpad(' ',3,' '),
--   v_Additional_Ac_Sol_Id	    CHAR(8);
            lpad(' ',8,' '),
--   v_Additional_Rate_Code	    CHAR(5);
            lpad(' ',5,' '),
--  v_Renewal_Rate_Code		    CHAR(5);
            lpad(' ',5,' '),
--   v_Additional_Rate		    CHAR(8);
            lpad(' ',8,' '),
--   v_Renewal_Rate		    CHAR(8);
            lpad(' ',8,' '),
--   v_Link_Operative_Account	    CHAR(16);
            lpad(' ',16,' '),
--  v_Break_in_Steps_Of		    CHAR(17);
            lpad(' ',17,' '),
--   v_wtax_level_flg		    CHAR(1);
            lpad(' ',1,' '),
--  v_Wtax_pcnt			    CHAR(8);
            lpad(' ',8,' '),
--   v_Wtax_floor_limit		    CHAR(17);
            lpad(' ',17,' '),
--   v_Iban_number		    CHAR(34);
            lpad(' ',34,' '),
--   v_Ias_code			    CHAR(5);
            lpad(' ',5,' '),
-- v_Channel_ID			    CHAR(5);
            lpad(' ',5,' '),
-- v_Channel_Level_Code		    CHAR(5);
            lpad(' ',5,' '),
--   v_Master_acct_num		    CHAR(16);
            lpad(' ',16,' '),
--   v_acct_status		    CHAR(1);
            'A',
--   v_acct_status_date		    CHAR(8);
            lpad(' ',8,' '),
--   v_Dummy			    CHAR(100);
            lpad(' ',100,' '),
-- v_ps_diff_freq_rel_party_flg	    CHAR(1);
            lpad(' ',1,' '),
-- v_swift_diff_freq_rel_party_flg  CHAR(1);
            lpad(' ',1,' '),
-- v_Fixed_instal_amt_Amt_topup	    CHAR(17);
            lpad(' ',17,' '),
-- v_Normal_Installment_Percentage  CHAR(10);
            lpad(' ',10,' '),
-- v_Installment_basis		    CHAR(1);
            lpad(' ',1,' '),
-- v_Max_missed_contribut_allowed   CHAR(3);
            lpad(' ',3,' '),
-- v_Auto_closure_of_irregular_act  CHAR(1);
            lpad(' ',1,' '),
-- v_Total_num_of_missed_contribut  CHAR(3);
            lpad(' ',3,' '),
--   v_Account_Irregular_status	    CHAR(1);
            lpad(' ',1,' '),
-- v_Account_Irregular_Status_Date  CHAR(8);
            lpad(' ',8,' '),
-- v_Cumulative_Normal_Instal_paid  CHAR(17);
            lpad(' ',17,' '),
-- v_Cumulative_Initial_Dep_paid    CHAR(17);
            lpad(' ',17,' '),
--   v_Cumulative_Top_up_paid	    CHAR(17);
            lpad(' ',17,' '),
-- v_AutoClosure_Zero_Bal_Acct_Mnts CHAR(3);
            lpad(' ',3,' '),
-- v_AutoClosure_Zero_Bal_Acct_Days CHAR(3);
            lpad(' ',3,' '),
--   v_Last_Bonus_Run_Date	    CHAR(8);
            lpad(' ',8,' '),
-- v_Last_Calculated_Bonus_Amount   CHAR(17);
            lpad(' ',17,' '),
--   v_Bonus_Up_to_Date		    CHAR(17);
            lpad(' ',17,' '),
--   v_Next_Bonus_Run_Date	    CHAR(8);
            lpad(' ',8,' '),
-- v_Normal_Int_Paid_tilllast_Bonus CHAR(17);
            lpad(' ',17,' '),
--   v_Bonus_Cycle		    CHAR(3);
            lpad(' ',3,' '),
-- v_Last_Calc_Bonus_percentage	    CHAR(10);
            lpad(' ',10,' '),
--   v_Penalty_Amount		    CHAR(17);
            lpad(' ',17,' '),
--   v_Penalty_Charge_Event_Id	    CHAR(25);
            lpad(' ',25,' '),
--   v_Address_Type		    CHAR(12);
            lpad(' ',12,' '),
-- v_Phone_Type			    CHAR(12);
            lpad(' ',12,' '),
-- v_Email_Type			    CHAR(12);
            lpad(' ',12,' '),
-- v_Local_Deposit_period_months    CHAR(3);
            lpad(' ',3,' '),
--  v_Local_Deposit_period_days	    CHAR(3);
            lpad(' ',3,' '),
--   v_Is_Account_hedged_flag	    CHAR(1);
            lpad(' ',1,' '),
--  v_Used_For_Netting_Off_flag	    CHAR(1);
            lpad(' ',1,' ')
  	from map_acc,;





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

EXECUTE IMMEDIATE 'truncate table TDMASTERPLACEMENTS_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Indicator,v_Employee_Id,v_Customer_Credit_Pref_Percent,v_Customer_Debit_Pref_Percent,v_Account_Credit_Pref_Percent,v_Account_Debit_Pref_Percent,v_Channel_Credit_Pref_Percent,v_Channel_Debit_Pref_Percent,v_Pegged_Flag,v_Peg_Frequency_in_Months,v_Peg_Frequency_in_Days,v_sulabh_flg,v_interest_accrual_flag,v_Passbook_Sheet_Receipt_Ind,v_With_holdng_tax_amt_scope_flg,v_With_holding_tax_flag,v_safe_custody_flag,v_cash_excp_amount_limit,v_clearing_excp_amount_limit,v_Transfer_excp_amount_limit,v_cash_cr_excp_amt_lim,v_Clearing_cr_excp_amt_lim,v_Transfer_cr_excp_amt_lim,v_Deposit_Account_Number,v_Currency_Code,v_SOL_ID,v_GL_Sub_head_code,v_Scheme_Code,v_CIF_ID,v_Deposit_amount,v_Deposit_period_months,v_Deposit_period_days,v_Interest_table_code,v_Mode_of_operation,v_Account_location_code,v_Auto_Renewal_Flag,v_Prd_in_mnths_for_auto_renewal,v_Prd_in_days_for_auto_renewal,v_Account_Open_Date,v_Open_Effective_Date,v_Nominee_Print_Flag,v_Printing_Flag,v_Ledger_Number,v_Last_Credit_Int_Posted_Date,v_Last_Credit_Int_Run_Date,v_Last_Interest_Provision_Date,v_Printed_date,v_Cumulative_Interest_Paid,v_Cumulative_interest_credited,v_Cumulative_installments_paid,v_Maturity_amount,v_Operative_Account_Number,v_Operative_Account_Crncy_Code,v_Operative_Account_SOL,v_Notice_prd_Mnts_forNotice_Dep,v_Notice_prd_Days_forNotice_Dep,v_Stamp_Duty_Borne_By_Cust,v_Stamp_Duty_Amount,v_Stamp_Duty_Amount_Crncy_Code,v_Original_Deposit_Amt,v_Absolute_Rate_of_Interest,v_Exclude_for_combined_stmnt,v_Statement_CIF_ID,v_Maturity_Date,v_Treasury_Rate_MOR,v_Renewal_Option,v_Renewal_Amount,v_Additional_Amt,v_Addnl_Amt_Crncy,v_Renewal_Crncy,v_Additional_Source_Account,v_Aditional_Src_acct_Crncy_Code,v_Additional_Ac_Sol_Id,v_Additional_Rate_Code,v_Renewal_Rate_Code,v_Additional_Rate,v_Renewal_Rate,v_Link_Operative_Account,v_Break_in_Steps_Of,v_wtax_level_flg,v_Wtax_pcnt,v_Wtax_floor_limit,v_Iban_number,v_Ias_code,v_Channel_ID,v_Channel_Level_Code,v_Master_acct_num,v_acct_status,v_acct_status_date,v_Dummy,v_ps_diff_freq_rel_party_flg,v_swift_diff_freq_rel_party_flg,v_Fixed_instal_amt_Amt_topup,v_Normal_Installment_Percentage,v_Installment_basis,v_Max_missed_contribut_allowed,v_Auto_closure_of_irregular_act,v_Total_num_of_missed_contribut,v_Account_Irregular_status,v_Account_Irregular_Status_Date,v_Cumulative_Normal_Instal_paid,v_Cumulative_Initial_Dep_paid,v_Cumulative_Top_up_paid,v_AutoClosure_Zero_Bal_Acct_Mnts,v_AutoClosure_Zero_Bal_Acct_Days,v_Last_Bonus_Run_Date,v_Last_Calculated_Bonus_Amount,v_Bonus_Up_to_Date,v_Next_Bonus_Run_Date,v_Normal_Int_Paid_tilllast_Bonus,v_Bonus_Cycle,v_Last_Calc_Bonus_percentage,v_Penalty_Amount,v_Penalty_Charge_Event_Id,v_Address_Type,v_Phone_Type,v_Email_Type,v_Local_Deposit_period_months,v_Local_Deposit_period_days,v_Is_Account_hedged_flag,v_Used_For_Netting_Off_flag;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into TDMASTERPLACEMENTS_O_TABLE values (v_Indicator,v_Employee_Id,v_Customer_Credit_Pref_Percent,v_Customer_Debit_Pref_Percent,v_Account_Credit_Pref_Percent,v_Account_Debit_Pref_Percent,v_Channel_Credit_Pref_Percent,v_Channel_Debit_Pref_Percent,v_Pegged_Flag,v_Peg_Frequency_in_Months,v_Peg_Frequency_in_Days,v_sulabh_flg,v_interest_accrual_flag,v_Passbook_Sheet_Receipt_Ind,v_With_holdng_tax_amt_scope_flg,v_With_holding_tax_flag,v_safe_custody_flag,v_cash_excp_amount_limit,v_clearing_excp_amount_limit,v_Transfer_excp_amount_limit,v_cash_cr_excp_amt_lim,v_Clearing_cr_excp_amt_lim,v_Transfer_cr_excp_amt_lim,v_Deposit_Account_Number,v_Currency_Code,v_SOL_ID,v_GL_Sub_head_code,v_Scheme_Code,v_CIF_ID,v_Deposit_amount,v_Deposit_period_months,v_Deposit_period_days,v_Interest_table_code,v_Mode_of_operation,v_Account_location_code,v_Auto_Renewal_Flag,v_Prd_in_mnths_for_auto_renewal,v_Prd_in_days_for_auto_renewal,v_Account_Open_Date,v_Open_Effective_Date,v_Nominee_Print_Flag,v_Printing_Flag,v_Ledger_Number,v_Last_Credit_Int_Posted_Date,v_Last_Credit_Int_Run_Date,v_Last_Interest_Provision_Date,v_Printed_date,v_Cumulative_Interest_Paid,v_Cumulative_interest_credited,v_Cumulative_installments_paid,v_Maturity_amount,v_Operative_Account_Number,v_Operative_Account_Crncy_Code,v_Operative_Account_SOL,v_Notice_prd_Mnts_forNotice_Dep,v_Notice_prd_Days_forNotice_Dep,v_Stamp_Duty_Borne_By_Cust,v_Stamp_Duty_Amount,v_Stamp_Duty_Amount_Crncy_Code,v_Original_Deposit_Amt,v_Absolute_Rate_of_Interest,v_Exclude_for_combined_stmnt,v_Statement_CIF_ID,v_Maturity_Date,v_Treasury_Rate_MOR,v_Renewal_Option,v_Renewal_Amount,v_Additional_Amt,v_Addnl_Amt_Crncy,v_Renewal_Crncy,v_Additional_Source_Account,v_Aditional_Src_acct_Crncy_Code,v_Additional_Ac_Sol_Id,v_Additional_Rate_Code,v_Renewal_Rate_Code,v_Additional_Rate,v_Renewal_Rate,v_Link_Operative_Account,v_Break_in_Steps_Of,v_wtax_level_flg,v_Wtax_pcnt,v_Wtax_floor_limit,v_Iban_number,v_Ias_code,v_Channel_ID,v_Channel_Level_Code,v_Master_acct_num,v_acct_status,v_acct_status_date,v_Dummy,v_ps_diff_freq_rel_party_flg,v_swift_diff_freq_rel_party_flg,v_Fixed_instal_amt_Amt_topup,v_Normal_Installment_Percentage,v_Installment_basis,v_Max_missed_contribut_allowed,v_Auto_closure_of_irregular_act,v_Total_num_of_missed_contribut,v_Account_Irregular_status,v_Account_Irregular_Status_Date,v_Cumulative_Normal_Instal_paid,v_Cumulative_Initial_Dep_paid,v_Cumulative_Top_up_paid,v_AutoClosure_Zero_Bal_Acct_Mnts,v_AutoClosure_Zero_Bal_Acct_Days,v_Last_Bonus_Run_Date,v_Last_Calculated_Bonus_Amount,v_Bonus_Up_to_Date,v_Next_Bonus_Run_Date,v_Normal_Int_Paid_tilllast_Bonus,v_Bonus_Cycle,v_Last_Calc_Bonus_percentage,v_Penalty_Amount,v_Penalty_Charge_Event_Id,v_Address_Type,v_Phone_Type,v_Email_Type,v_Local_Deposit_period_months,v_Local_Deposit_period_days,v_Is_Account_hedged_flag,v_Used_For_Netting_Off_flag ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;