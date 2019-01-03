-- File Name		: lam_upload.sql

-- File Created for	: Upload file for lam

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure lam_upload(inp_sol_id IN VARCHAR2)
   as
   v_Account_Number		   CHAR(16);
   v_Customer_Credit_Pref_Percent  CHAR(10);
   v_Customer_Debit_Pref_Percent   CHAR(10);
   v_Acct_ID_Credit_Pref_Percent   CHAR(10);
   v_Acct_ID_Debit_Pref_Percent	   CHAR(10);
   v_Repricing_Plan		   CHAR(1);
   v_Pegging_Frequency_in_Months   CHAR(4);
   v_Pegging_Frequency_in_Days	   CHAR(3);
   v_Interest_Route_Flag	   CHAR(1);
   v_Acct_Currency_Code		   CHAR(3);
   v_Sol_ID			   CHAR(8);
   v_GL_Sub_Head_Code		   CHAR(5);
   v_Schm_Code  		   CHAR(5);
   v_CIF_ID  			   CHAR(32);
   v_Acct_Open_Date		   CHAR(10);
   v_Sanction_Limit		   CHAR(17);
   v_Ledger_Number		   CHAR(3);
   v_Sector_Code		   CHAR(5);
   v_Sub_Sector_Code		   CHAR(5);
   v_Purpose_of_Advance		   CHAR(5);
   v_Nature_of_Advance		   CHAR(5);
   v_Free_Code_3		   CHAR(5);
   v_Sanction_Reference_Number	   CHAR(25);
   v_Sanction_Limit_Date	   CHAR(10);
   v_Sanction_Level_Code	   CHAR(5);
   v_Limit_Expiry_Date		   CHAR(10);
   v_Sanction_Authority_Code	   CHAR(5);
   v_Loan_Paper_Date		   CHAR(10);
   v_Operative_Acct_ID		   CHAR(16);
   v_Operative_Currency_Code	   CHAR(3);
   v_Operative_Sol_ID		   CHAR(8);
   v_Demand_Satisfy_Method	   CHAR(1);
   v_Lien_on_Operative_Acct_Flag   CHAR(1);
   v_Repayment_currency_rate_code  CHAR(5);
   v_Interest_table_code	   CHAR(5);
   v_Interest_on_principal_Flag	   CHAR(1);
   v_Penal_int_ovdue_princ_dmd_Fl  CHAR(1);
   v_Princ_Dmd_Ovdue_end_month_Fl  CHAR(1);
   v_Int_On_Int_Demand_Flag	   CHAR(1);
   v_penal_int_overdue_int_dmd_Fl  CHAR(1);
   v_Int_Demand_Ovdue_End_Mnth_Fl  CHAR(1);
   v_Transfer_Effective_Date	   CHAR(10);
   v_Cumulative_Normal_int_am	   CHAR(17);
   v_Cumulative_penal_int_amt	   CHAR(17);
   v_cumulative_additional_int_am  CHAR(17);
   v_Liab_Transfer_Effective_date  CHAR(17);
   v_Disbursement_Previous_Sche    CHAR(17);
   v_Debit_Int_Calc_upto_date      CHAR(10);
   v_Repayment_Schedule_Date	   CHAR(10);
   v_Repayment_Period_in_months	   CHAR(3);
   v_Repayment_Period_in_Days	   CHAR(3);
   v_Past_Due_Flag		   CHAR(1);
   v_Past_Due_Transfer_Date	   CHAR(10);
   v_Prv_To_Pd_GL_Sub_Head_Code	   CHAR(5);
   v_Interest_Suspense_Amount	   CHAR(17);
   v_Penal_Interest_Suspense_Amt   CHAR(17);
   v_Charge_Off_Flag		   CHAR(1);
   v_Charge_Off_Date		   CHAR(10);
   v_Charge_Off_Principle	   CHAR(17);
   v_Pending_Interest		   CHAR(17);
   v_Principal_Recovery		   CHAR(17);
   v_Interest_Recovery		   CHAR(17);
   v_source_dealer_code		   CHAR(20);
   v_Disburse_dealer_code	   CHAR(20);
   v_Apply_late_fee_Flag	   CHAR(1);
   v_Late_Fee_Grace_Period_Months  CHAR(3);
   v_Late_Fee_Grace_Period_Days	   CHAR(3);
   v_Instal_amt_collect_upfront	   CHAR(1);
   v_Num_of_instal_collec_upfront  CHAR(2);
   v_upfront_instalment_amount	   CHAR(17);
   v_Demand_Past_Due_counter	   CHAR(5);
   v_Sum_of_the_princ_demand_amt   CHAR(17);
   v_Payoff_Flag		   CHAR(1);
   v_ExcLd_for_Combined_Statement  CHAR(1);
   v_Statement_CIF_ID		   CHAR(32);
   v_Transfer_Cycle_String	   CHAR(45);
   v_Bank_IRR_Rate		   CHAR(8);
   v_Value_Of_Asset		   CHAR(17);
   v_Occupation_code_customer	   CHAR(5);
   v_Borrower_category_code	   CHAR(5);
   v_Mode_of_the_advance	   CHAR(5);
   v_Type_of_the_advance	   CHAR(5);
   v_guarantee_coverage_Code	   CHAR(5);
   v_Industry_Type		   CHAR(5);
   v_Free_Code_1		   CHAR(5);
   v_Free_Code_2		   CHAR(5);
   v_Free_Code_4		   CHAR(5);
   v_Free_Code_5		   CHAR(5);
   v_Free_Code_6		   CHAR(5);
   v_Free_Code_7		   CHAR(5);
   v_Free_Code_8		   CHAR(5);
   v_Free_Code_9		   CHAR(5);
   v_Free_Code_10		   CHAR(5);
   v_Acct_Location_Code		   CHAR(5);
   v_credit_report_file_Ref_ID	   CHAR(15);
   v_DICGC_Fee_Percent		   CHAR(8);
   v_Last_Compound_Date		   CHAR(10);
   v_Daily_Compound_Interest_Flag  CHAR(1);
   v_CalculateOverdue_Int_rate_Fl  CHAR(1);
   v_EI_paying_period_start_date   CHAR(10);
   v_EI_paying_period_end_date	   CHAR(10);
   v_IRR_Rate			   CHAR(8);
   v_Advance_interest_amount	   CHAR(17);
   v_Amortised_Amount		   CHAR(17);
   v_Debit_Booked_Upto_Date	   CHAR(10);
   v_Adv_Int_Collection_upto_Date  CHAR(10);
   v_Accrual_Rate		   CHAR(9);
   v_Int_Rate_Sanction_Limit_Flg   CHAR(1);
   v_Interest_Rest_Frequency	   CHAR(1);
   v_Interest_Rest_Basis	   CHAR(1);
   v_Charge_Route_Flag		   CHAR(1);
   v_Final_Disbursement_Flag	   CHAR(1);
   v_Auto_Resch_after_Holiday_Prd  CHAR(1);
   v_total_number_of_deferments	   CHAR(2);
   v_num_deferments_current_repay  CHAR(2);
   v_End_Date			   CHAR(10);
   v_Penal_interest_on_Outstandin  CHAR(1);
   v_Charge_off_type		   CHAR(1);
   v_Deferred_appli_int_rate_fl    CHAR(1);
   v_Def_applicable_int_rate	   CHAR(10);
   v_Deferred_Interest_Amount	   CHAR(17);
   v_Auto_Reschedule_Not_Allowed   CHAR(1);
   v_Rescheduled_Overdue_Principa CHAR(17);
   v_Reschedule_Overdue_Interest   CHAR(17);
   v_Loan_Type			   CHAR(1);
   v_Pay_Off_Reason_Code	   CHAR(5);
   v_Related_Deposit_Acct_ID	   CHAR(16);
   v_Last_AckNowledgt_Dr_Prd_date  CHAR(10);
   v_Refinance_Sanction_Date	   CHAR(10);
   v_Refinance_Amount		   CHAR(17);
   v_Subsidy_Acct_ID		   CHAR(16);
   v_Subsidy_Agency		   CHAR(16);
   v_Subsidy_Claimed_Date	   CHAR(10);
   v_Subsidy_Activity_Code	   CHAR(10);
   v_Debit_AckNowledgement_Type	   CHAR(1);
   v_Refinance_Sanction_Number	   CHAR(25);
   v_Refinance_Reference_Number	   CHAR(25);
   v_Refinance_Claimed_Date	   CHAR(10);
   v_Subsidy_Amount		   CHAR(17);
   v_Subsidy_Received_Date	   CHAR(10);
   v_Preprocess_Fee		   CHAR(17);
   v_Activity_Code		   CHAR(6);
   v_Probation_Period_in_Months	   CHAR(3);
   v_Probation_Period_in_Days	   CHAR(3);
   v_Compound_Rest_Indicator_Flag  CHAR(1);
   v_Discounted_Int_Rate_Flag	   CHAR(1);
   v_Collect_Interest_Flag	   CHAR(1);
   v_Despatch_mode		   CHAR(1);
   v_Acct_Manager		   CHAR(15);
   v_Mode_of_Oper_Code		   CHAR(5);
   v_Statement_Frequency_Type	   CHAR(1);
   v_Week_num_for_Statement_Date   CHAR(1);
   v_Week_Day_for_Statement_Date   CHAR(1);
   v_Week_Dt_for_Statement_Date	   CHAR(2);
   v_Statement_Freq_case_of_Hldys  CHAR(1);
   v_Statement_of_the_Account	   CHAR(1);
   v_Next_Print_date		   CHAR(10);
   v_Fixed_Rate_Term_in_Months	   CHAR(3);
   v_Fixed_Rate_Term_in_Days	   CHAR(3);
   v_Minimum_Int_Percent_Debit	   CHAR(10);
   v_Maximum_Int_Percent_Debit	   CHAR(10);
   v_Instalment_Income_Ratio	   CHAR(9);
   v_Product_Group		   CHAR(5);
   v_Free_Text			   CHAR(240);
   v_Linked_Account_ID		   CHAR(16);
   v_Delinquency_Resch_Method_Flg  CHAR(1);
   v_Total_Number_of_Switch_Over   CHAR(3);
   v_Non_Starter_Flag		   CHAR(1);
   v_Floating_Interest_Table_Code  CHAR(5);
   v_Floating_Repricing_Frequency  CHAR(3);
   v_Floating_Repricing_Freq_Days  CHAR(3);
   v_Single_EMI_Turn_Over_Diff_Fl  CHAR(1);
   v_IBAN_Number		   CHAR(34);
   v_IAS_CLASSIFICATION_CODE	   CHAR(5);
   v_Account_Number1		   CHAR(16);
   v_Type_of_top_up		   CHAR(1);
   v_Negotiated_Rate_Debit_Percen  CHAR(10);
   v_Normal_Int_Product_Method	   CHAR(1);
   v_Penal_Interest_Rate_Method	   CHAR(1);
   v_Penal_Interest_Method	   CHAR(1);
   v_hldy_prd_frm_first_disb_flg   CHAR(1);
   v_EI_Scheme_Flag		   CHAR(1);
   v_EI_Method			   CHAR(1);
   v_Ei_Formula_Flag		   CHAR(1);
   v_Normal_Holiday_Period_in_Mnt  CHAR(3);
   v_Holiday_Period_Interest_Flag  CHAR(1);
   v_Holiday_Period_Interest_Amt   CHAR(17);
   v_Resche_by_Adjust_TeNor_Amt	   CHAR(1);
   v_Auto_Reschedule_every_Disb	   CHAR(1);
   v_Auto_Reschule_Int_Rate_Chang  CHAR(1);
   v_Auto_Reschedule_Prepayment	   CHAR(1);
   v_Rescheduling_Amount_flag	   CHAR(1);
   v_Capitalize_Int_on_Rephasemen  CHAR(1);
   v_Carry_over_Demands		   CHAR(1);
   v_Type_Instalment_Combination   CHAR(1);
   v_Cap_Int_to_EMI_Flg		   CHAR(1);
   v_Deferred_Int_Due_to_EMI_Cap   CHAR(17);
   v_Month_for_Deferment	   CHAR(2);
   v_Num_Months_Deferred	   CHAR(2);
   v_Channel_Credit_Pref_Percent   CHAR(10);
   v_Channel_Debit_Pref_Percent	   CHAR(10);
   v_Channel_Id			   CHAR(5);
   v_Channel_Level_Code		   CHAR(5);
   v_Instalment_Effective_Flag	   CHAR(1);
   v_Notice_Period		   CHAR(3);
   v_Shift_Instalment_Flag	   CHAR(1);
   v_Include_Maturity_Date	   CHAR(1);
   v_Interest_Rule_Code		   CHAR(5);
   v_Cumulative_Capitalize_Fees	   CHAR(17);
   v_upfront_instalment_int_amoun  CHAR(17);
   v_Recall_Flag		   CHAR(1);
   v_Recall_Date		   CHAR(10);
   v_Diff_PS_Freq_For_Rel_Part	   CHAR(1);
   v_Diff_Swift_Freq_For_Rel_Part  CHAR(1);
   v_Penal_Interest_table_code	   CHAR(5);
   v_Penal_Preferential_Percent	   CHAR(10);
   v_RA_ref_number		   CHAR(16);
   v_Interest_table_Version	   CHAR(5);
   v_Address_Type		   CHAR(12);
   v_Phone_Type			   CHAR(12);
   v_Email_Type			   CHAR(12);
   v_Accrued_Penal_Int_Recover	   CHAR(17);
   v_Penal_Interest_Recovery	   CHAR(17);
   v_Collection_Interest_Recovery  CHAR(17);
   v_Collection_Penal_Int_Recover  CHAR(17);
   v_Mark_Up_Applicable_Flag	   CHAR(1);   
   v_Pref_Calendar_base_processin  CHAR(2);
   v_Purchase_Reference		   CHAR(12);
   v_Frez_code			   CHAR(1);
   v_Frez_reason_code		   CHAR(5);
   
--  DECLARE
   CURSOR c1 is
--   v_Account_Number		   CHAR(16);
     select lpad(map_acc.fin_acc_num,16,' '),
-- v_Customer_Credit_Pref_Percent  CHAR(10);
            lpad(' ',10,' '),
-- v_Customer_Debit_Pref_Percent   CHAR(10);
            lpad(' ',10,' '),
-- v_Acct_ID_Credit_Pref_Percent   CHAR(10);
            lpad(' ',10,' '),
-- v_Acct_ID_Debit_Pref_Percent	   CHAR(10);
            lpad(' ',10,' '),
--   v_Repricing_Plan		   CHAR(1);
            lpad(' ',1,' '),
-- v_Pegging_Frequency_in_Months   CHAR(4);
            lpad(' ',4,' '),
-- v_Pegging_Frequency_in_Days	   CHAR(3);
            lpad(' ',3,' '),
--   v_Interest_Route_Flag	   CHAR(1);
            lpad(' ',1,' '),
-- v_Acct_Currency_Code		   CHAR(3);
            lpad(otpf.otccy,3,' '),
--   v_Sol_ID			   CHAR(8);
            lpad(otpf.otbrnm,8,' '),
--   v_GL_Sub_Head_Code		   CHAR(5);
            lpad(' ',5,' '),
--   v_Schm_Code  		   CHAR(5);
            lpad(map_acc.schm_code,5,' '),
--   v_CIF_ID  			   CHAR(32);
            lpad(map_acc.fin_cif_id,32,' '),
--   v_Acct_Open_Date		   CHAR(10);
	    to_char(to_date(pack_mig_EQ3.get_date_fm_btrv(otsdte),'DD/MM/YYYY'),'YYYYMMDD'),
--   v_Sanction_Limit		   CHAR(17);
            lpad(to_number((otdla2)/POWER(10,C8CED)),17,' '),
--   v_Ledger_Number		   CHAR(3);
            lpad(' ',3,' '),
--   v_Sector_Code		   CHAR(5);
            lpad(' ',5,' '),
--   v_Sub_Sector_Code		   CHAR(5);
            lpad(' ',5,' '),
-- v_Purpose_of_Advance		   CHAR(5);
            lpad(' ',5,' '),
--  v_Nature_of_Advance		   CHAR(5);
            lpad(' ',5,' '),
--   v_Free_Code_3		   CHAR(5);
            lpad('MIG',5,' '),
--  v_Sanction_Reference_Number	   CHAR(25);
            lpad(' ',25,' '),
--   v_Sanction_Limit_Date	   CHAR(10);
	    to_char(to_date(pack_mig_EQ3.get_date_fm_btrv(otsdte),'DD/MM/YYYY'),'YYYYMMDD'),
--   v_Sanction_Level_Code	   CHAR(5);
            lpad('MIG',5,' '),
--  v_Limit_Expiry_Date		   CHAR(10);
	    to_char(to_date(pack_mig_EQ3.get_date_fm_btrv(otmdt),'DD/MM/YYYY'),'YYYYMMDD'),
--   v_Sanction_Authority_Code	   CHAR(5);
            lpad('MIG',5,' '),
--   v_Loan_Paper_Date		   CHAR(10);
	    to_char(to_date(pack_mig_EQ3.get_date_fm_btrv(otsdte),'DD/MM/YYYY'),'YYYYMMDD'),
--  v_Operative_Acct_ID		   CHAR(16);
            lpad(' ',16,' '),
--   v_Operative_Currency_Code	   CHAR(3);
            lpad(' ',3,' '),
--   v_Operative_Sol_ID		   CHAR(8);
            lpad(' ',8,' '),
--   v_Demand_Satisfy_Method	   CHAR(1);
            lpad(' ',1,' '),
-- v_Lien_on_Operative_Acct_Flag   CHAR(1);
            lpad(' ',1,' '),
-- v_Repayment_currency_rate_code  CHAR(5);
            lpad(' ',5,' '),
--   v_Interest_table_code	   CHAR(5);
            lpad(map_acc.int_tbl_code,5,' '),
-- v_Interest_on_principal_Flag	   CHAR(1);
            lpad(' ',1,' '),
-- v_Penal_int_ovdue_princ_dmd_Fl CHAR(1);
            lpad(' ',1,' '),
-- v_Princ_Dmd_Ovdue_end_month_Fl CHAR(1);
            lpad(' ',1,' '),
--   v_Int_On_Int_Demand_Flag	   CHAR(1);
            lpad(' ',1,' '),
-- v_penal_int_overdue_int_dmd_Fl CHAR(1);
            lpad(' ',1,' '),
-- v_Int_Demand_Ovdue_End_Mnth_Fl CHAR(1);
            lpad(' ',1,' '),
--   v_Transfer_Effective_Date	   CHAR(10);
            lpad(' ',10,' '),
-- v_Cumulative_Normal_int_am	   CHAR(17);
            lpad(' ',17,' '),
--   v_Cumulative_penal_int_amt	   CHAR(17);
            lpad(' ',17,' '),
-- v_cumulative_additional_int_am CHAR(17);
            lpad(' ',17,' '),
-- v_Liab_Transfer_Effective_date  CHAR(17);
            lpad(to_number((v5bal)/POWER(10,C8CED)),17,' '),
-- v_Disbursement_Previous_Sche    CHAR(17);
            lpad(' ',17,' '),
-- v_Debit_Int_Calc_upto_date      CHAR(10);
	    to_char(to_date(pack_mig_EQ3.get_date_fm_btrv(v5lcd),'DD/MM/YYYY'),'YYYYMMDD'),
--   v_Repayment_Schedule_Date	   CHAR(10);
	    to_char(to_date(pack_mig_EQ3.get_date_fm_btrv(otsdte),'DD/MM/YYYY'),'YYYYMMDD'),
-- v_Repayment_Period_in_months	   CHAR(3);
            lpad(izpf.iznpy,3,' '),
--   v_Repayment_Period_in_Days	   CHAR(3);
            '0',
--   v_Past_Due_Flag		   CHAR(1);
            lpad(' ',1,' '),
--   v_Past_Due_Transfer_Date	   CHAR(10);
            lpad(' ',10,' '),
-- v_Prv_To_Pd_GL_Sub_Head_Code	   CHAR(5);
            lpad(' ',5,' '),
--   v_Interest_Suspense_Amount	   CHAR(17);
            lpad(' ',17,' '),
-- v_Penal_Interest_Suspense_Amt   CHAR(17);
            lpad(' ',17,' '),
--   v_Charge_Off_Flag		   CHAR(1);
            'N',
--   v_Charge_Off_Date		   CHAR(10);
            lpad(' ',10,' '),
--   v_Charge_Off_Principle	   CHAR(17);
            lpad(' ',17,' '),
--   v_Pending_Interest		   CHAR(17);
            lpad(' ',17,' '),
-- v_Principal_Recovery		   CHAR(17);
            lpad(' ',17,' '),
-- v_Interest_Recovery		   CHAR(17);
            lpad(' ',17,' '),
-- v_source_dealer_code		   CHAR(20);
            lpad(' ',20,' '),
--   v_Disburse_dealer_code	   CHAR(20);
            lpad(' ',20,' '),
--   v_Apply_late_fee_Flag	   CHAR(1);
            lpad(' ',1,' '),
-- v_Late_Fee_Grace_Period_Months  CHAR(3);
            lpad(' ',3,' '),
-- v_Late_Fee_Grace_Period_Days	   CHAR(3);
            lpad(' ',3,' '),
-- v_Instal_amt_collect_upfront	   CHAR(1);
            lpad(' ',1,' '),
-- v_Num_of_instal_collec_upfront  CHAR(2);
            lpad(' ',2,' '),
-- v_upfront_instalment_amount	   CHAR(17);
            lpad(' ',17,' '),
--   v_Demand_Past_Due_counter	   CHAR(5);
            lpad(' ',5,' '),
-- v_Sum_of_the_princ_demand_amt   CHAR(17);
            lpad(' ',17,' '),
--   v_Payoff_Flag		   CHAR(1);
            'N',
-- v_ExcLd_for_Combined_Statement  CHAR(1);
            'Y',
--   v_Statement_CIF_ID		   CHAR(32);
            lpad(' ',32,' '),
--   v_Transfer_Cycle_String	   CHAR(45);
            lpad(' ',45,' '),
--   v_Bank_IRR_Rate		   CHAR(8);
            lpad(' ',8,' '),
--   v_Value_Of_Asset		   CHAR(17);
            lpad(' ',17,' '),
--   v_Occupation_code_customer	   CHAR(5);
            lpad(' ',5,' '),
--   v_Borrower_category_code	   CHAR(5);
            lpad(' ',5,' '),
--   v_Mode_of_the_advance	   CHAR(5);
            lpad(' ',5,' '),
--   v_Type_of_the_advance	   CHAR(5);
            lpad(' ',5,' '),
--   v_guarantee_coverage_Code	   CHAR(5);
            lpad(' ',5,' '),
--   v_Industry_Type		   CHAR(5);
            lpad(' ',5,' '),
--   v_Free_Code_1		   CHAR(5);
            lpad(' ',5,' '),
--   v_Free_Code_2		   CHAR(5);
            lpad(' ',5,' '),
--   v_Free_Code_4		   CHAR(5);
            lpad(' ',5,' '),
--   v_Free_Code_5		   CHAR(5);
            lpad(' ',5,' '),
--   v_Free_Code_6		   CHAR(5);
            lpad(' ',5,' '),
--   v_Free_Code_7		   CHAR(5);
            lpad(' ',5,' '),
--   v_Free_Code_8		   CHAR(5);
            lpad(' ',5,' '),
--   v_Free_Code_9		   CHAR(5);
            lpad(' ',5,' '),
--   v_Free_Code_10		   CHAR(5);
            lpad(' ',5,' '),
-- v_Acct_Location_Code		   CHAR(5);
            lpad(' ',5,' '),
-- v_credit_report_file_Ref_ID	   CHAR(15);
            lpad(' ',15,' '),
-- v_DICGC_Fee_Percent		   CHAR(8);
            lpad(' ',8,' '),
-- v_Last_Compound_Date		   CHAR(10);
            lpad(' ',10,' '),
-- v_Daily_Compound_Interest_Flag  CHAR(1);
            lpad(' ',1,' '),
-- v_CalculateOverdue_Int_rate_Fl  CHAR(1);
            lpad(' ',1,' '),
-- v_EI_paying_period_start_date   CHAR(10);
            lpad(' ',10,' '),
-- v_EI_paying_period_end_date	   CHAR(10);
            lpad(' ',10,' '),
--   v_IRR_Rate			   CHAR(8);
            lpad(' ',8,' '),
--   v_Advance_interest_amount	   CHAR(17);
            lpad(' ',17,' '),
--   v_Amortised_Amount		   CHAR(17);
            lpad(' ',17,' '),
--   v_Debit_Booked_Upto_Date	   CHAR(10);
            lpad(' ',10,' '),
-- v_Adv_Int_Collection_upto_Date  CHAR(10);
            lpad(' ',10,' '),
--   v_Accrual_Rate		   CHAR(9);
            lpad(' ',9,' '),
-- v_Int_Rate_Sanction_Limit_Flg   CHAR(1);
            lpad(' ',1,' '),
--   v_Interest_Rest_Frequency	   CHAR(1);
            lpad(' ',1,' '),
--   v_Interest_Rest_Basis	   CHAR(1);
            lpad(' ',1,' '),
-- v_Charge_Route_Flag		   CHAR(1);
            lpad(' ',1,' '),
--   v_Final_Disbursement_Flag	   CHAR(1);
            'N',
-- v_Auto_Resch_after_Holiday_Prd  CHAR(1);
            lpad(' ',1,' '),
-- v_total_number_of_deferments	   CHAR(2);
            lpad(' ',2,' '),
-- v_num_deferments_current_repay  CHAR(2);
            lpad(' ',2,' '),
--   v_End_Date			   CHAR(10);
            lpad(' ',10,' '),
-- v_Penal_interest_on_Outstandin  CHAR(1);
            lpad(' ',1,' '),
--   v_Charge_off_type		   CHAR(1);
            lpad(' ',1,' '),
-- v_Deferred_appli_int_rate_fl    CHAR(1);
            lpad(' ',1,' '),
--   v_Def_applicable_int_rate	   CHAR(10);
            lpad(' ',10,' '),
--   v_Deferred_Interest_Amount	   CHAR(17);
            lpad(' ',17,' '),
-- v_Auto_Reschedule_Not_Allowed   CHAR(1);
            lpad(' ',1,' '),
-- v_Rescheduled_Overdue_Principa  CHAR(17);
            lpad(' ',17,' '),
-- v_Reschedule_Overdue_Interest   CHAR(17);
            lpad(' ',17,' '),
-- v_Loan_Type			   CHAR(1);
            lpad(' ',1,' '),
--   v_Pay_Off_Reason_Code	   CHAR(5);
            lpad(' ',5,' '),
--   v_Related_Deposit_Acct_ID	   CHAR(16);
            lpad(' ',16,' '),
-- v_Last_AckNowledgt_Dr_Prd_date  CHAR(10);
            lpad(' ',10,' '),
--   v_Refinance_Sanction_Date	   CHAR(10);
            lpad(' ',10,' '),
--   v_Refinance_Amount		   CHAR(17);
            lpad(' ',17,' '),
--   v_Subsidy_Acct_ID		   CHAR(16);
            lpad(' ',16,' '),
--   v_Subsidy_Agency		   CHAR(16);
            lpad(' ',16,' '),
--   v_Subsidy_Claimed_Date	   CHAR(10);
            lpad(' ',10,' '),
--   v_Subsidy_Activity_Code	   CHAR(10);
            lpad(' ',10,' '),
-- v_Debit_AckNowledgement_Type	   CHAR(1);
            lpad(' ',1,' '),
-- v_Refinance_Sanction_Number	   CHAR(25);
            lpad(' ',25,' '),
-- v_Refinance_Reference_Number	   CHAR(25);
            lpad(' ',25,' '),
--   v_Refinance_Claimed_Date	   CHAR(10);
            lpad(' ',10,' '),
--   v_Subsidy_Amount		   CHAR(17);
            lpad(' ',17,' '),
--   v_Subsidy_Received_Date	   CHAR(10);
            lpad(' ',10,' '),
--   v_Preprocess_Fee		   CHAR(17);
            lpad(' ',17,' '),
--   v_Activity_Code		   CHAR(6);
            lpad(' ',6,' '),
-- v_Probation_Period_in_Months	   CHAR(3);
            lpad(' ',3,' '),
--   v_Probation_Period_in_Days	   CHAR(3);
            lpad(' ',3,' '),
-- v_Compound_Rest_Indicator_Flag  CHAR(1);
            lpad(' ',1,' '),
--   v_Discounted_Int_Rate_Flag	   CHAR(1);
            lpad(' ',1,' '),
--   v_Collect_Interest_Flag	   CHAR(1);
            lpad(' ',1,' '),
--   v_Despatch_mode		   CHAR(1);
            'A',
--   v_Acct_Manager		   CHAR(15);
            lpad(' ',15,' '),
-- v_Mode_of_Oper_Code		   CHAR(5);
            lpad(' ',5,' '),
--   v_Statement_Frequency_Type	   CHAR(1);
            'M',
-- v_Week_num_for_Statement_Date   CHAR(1);
            lpad(' ',1,' '),
-- v_Week_Day_for_Statement_Date   CHAR(1);
            lpad(' ',1,' '),
-- v_Week_Dt_for_Statement_Date	   CHAR(2);
            '31',
-- v_Statement_Freq_case_of_Hldys  CHAR(1);
            'P',
--   v_Statement_of_the_Account	   CHAR(1);
            'S',
--   v_Next_Print_date		   CHAR(10);
            lpad(' ',10,' '),
-- v_Fixed_Rate_Term_in_Months	   CHAR(3);
            lpad(' ',3,' '),
--   v_Fixed_Rate_Term_in_Days	   CHAR(3);
            lpad(' ',3,' '),
-- v_Minimum_Int_Percent_Debit	   CHAR(10);
            lpad(' ',10,' '),
-- v_Maximum_Int_Percent_Debit	   CHAR(10);
            lpad(' ',10,' '),
--   v_Instalment_Income_Ratio	   CHAR(9);
            lpad(' ',9,' '),
--   v_Product_Group		   CHAR(5);
            lpad(' ',5,' '),
-- v_Free_Text			   CHAR(240);
            lpad(' ',250,' '),
-- v_Linked_Account_ID		   CHAR(16);
            lpad(' ',16,' '),
-- v_Delinquency_Resch_Method_Flg  CHAR(1);
            lpad(' ',1,' '),
-- v_Total_Number_of_Switch_Over   CHAR(3);
            lpad(' ',3,' '),
--   v_Non_Starter_Flag		   CHAR(1);
            lpad(' ',1,' '),
-- v_Floating_Interest_Table_Code  CHAR(5);
            lpad(' ',5,' '),
-- v_Floating_Repricing_Frequency  CHAR(3);
            lpad(' ',3,' '),
-- v_Floating_Repricing_Freq_Days  CHAR(3);
            lpad(' ',3,' '),
-- v_Single_EMI_Turn_Over_Diff_Fl  CHAR(1);
            lpad(' ',1,' '),
--   v_IBAN_Number		   CHAR(34);
            lpad(' ',34,' '),
--   v_IAS_CLASSIFICATION_CODE	   CHAR(5);
            lpad(' ',5,' '),
--   v_Account_Number1		   CHAR(16);
            lpad(' ',16,' '),
--   v_Type_of_top_up		   CHAR(1);
            lpad(' ',1,' '),
-- v_Negotiated_Rate_Debit_Percen CHAR(10);
            lpad(' ',10,' '),
-- v_Normal_Int_Product_Method	   CHAR(1);
            lpad(' ',1,' '),
-- v_Penal_Interest_Rate_Method	   CHAR(1);
            lpad(' ',1,' '),
--   v_Penal_Interest_Method	   CHAR(1);
            lpad(' ',1,' '),
-- v_hldy_prd_frm_first_disb_flg   CHAR(1);
            lpad(' ',1,' '),
--   v_EI_Scheme_Flag		   CHAR(1);
            lpad(' ',1,' '),
-- v_EI_Method			   CHAR(1);
            lpad(' ',1,' '),
--   v_Ei_Formula_Flag		   CHAR(1);
            lpad(' ',1,' '),
-- v_Normal_Holiday_Period_in_Mnt CHAR(3);
            lpad(' ',3,' '),
-- v_Holiday_Period_Interest_Flag  CHAR(1);
            lpad(' ',1,' '),
-- v_Holiday_Period_Interest_Amt   CHAR(17);
            lpad(' ',17,' '),
-- v_Resche_by_Adjust_TeNor_Amt	   CHAR(1);
            lpad(' ',1,' '),
-- v_Auto_Reschedule_every_Disb	   CHAR(1);
            lpad(' ',1,' '),
-- v_Auto_Reschule_Int_Rate_Chang  CHAR(1);
            lpad(' ',1,' '),
-- v_Auto_Reschedule_Prepayment	   CHAR(1);
            lpad(' ',1,' '),
--   v_Rescheduling_Amount_flag	   CHAR(1);
            lpad(' ',1,' '),
-- v_Capitalize_Int_on_Rephasemen  CHAR(1);
            lpad(' ',1,' '),
-- v_Carry_over_Demands		   CHAR(1);
            lpad(' ',1,' '),
-- v_Type_Instalment_Combination   CHAR(1);
            lpad(' ',1,' '),
-- v_Cap_Int_to_EMI_Flg		   CHAR(1);
            lpad(' ',1,' '),
-- v_Deferred_Int_Due_to_EMI_Cap   CHAR(17);
            lpad(' ',17,' '),
--   v_Month_for_Deferment	   CHAR(2);
            lpad(' ',2,' '),
--   v_Num_Months_Deferred	   CHAR(2);
            lpad(' ',2,' '),
-- v_Channel_Credit_Pref_Percent   CHAR(10);
            lpad(' ',10,' '),
-- v_Channel_Debit_Pref_Percent	   CHAR(10);
            lpad(' ',10,' '),
-- v_Channel_Id			   CHAR(5);
            lpad(' ',5,' '),
-- v_Channel_Level_Code		   CHAR(5);
            lpad(' ',5,' '),
-- v_Instalment_Effective_Flag	   CHAR(1);
            lpad(' ',1,' '),
--   v_Notice_Period		   CHAR(3);
            lpad(' ',3,' '),
--   v_Shift_Instalment_Flag	   CHAR(1);
            lpad(' ',1,' '),
--   v_Include_Maturity_Date	   CHAR(1);
            lpad(' ',1,' '),
-- v_Interest_Rule_Code		   CHAR(5);
            lpad(' ',5,' '),
-- v_Cumulative_Capitalize_Fees	   CHAR(17);
            lpad(' ',17,' '),
-- v_upfront_instalment_int_amoun  CHAR(17);
            lpad(' ',17,' '),
--   v_Recall_Flag		   CHAR(1);
            lpad(' ',1,' '),
--   v_Recall_Date		   CHAR(10);
            lpad(' ',10,' '),
-- v_Diff_PS_Freq_For_Rel_Part	   CHAR(1);
            lpad(' ',1,' '),
-- v_Diff_Swift_Freq_For_Rel_Part  CHAR(1);
            lpad(' ',1,' '),
-- v_Penal_Interest_table_code	   CHAR(5);
            lpad(' ',5,' '),
-- v_Penal_Preferential_Percent	   CHAR(10);
            lpad(' ',10,' '),
--   v_RA_ref_number		   CHAR(16);
            lpad(' ',16,' '),
--   v_Interest_table_Version	   CHAR(5);
            lpad(' ',5,' '),
--   v_Address_Type		   CHAR(12);
            lpad(' ',12,' '),
-- v_Phone_Type			   CHAR(12);
            lpad(' ',12,' '),
-- v_Email_Type			   CHAR(12);
            lpad(' ',12,' '),
-- v_Accrued_Penal_Int_Recover	   CHAR(17);
            lpad(' ',17,' '),
-- v_Penal_Interest_Recovery	   CHAR(17);
            lpad(' ',17,' '),
-- v_Collection_Interest_Recovery  CHAR(17);
            lpad(' ',17,' '),
-- v_Collection_Penal_Int_Recover  CHAR(17);
            lpad(' ',17,' '),
--   v_Mark_Up_Applicable_Flag	   CHAR(1);   
            lpad(' ',1,' '),
-- v_Pref_Calendar_base_processin CHAR(2);
            lpad(' ',2,' '),
-- v_Purchase_Reference		   CHAR(12);
            lpad(' ',12,' '),
--  v_Frez_code			   CHAR(1);
            lpad(' ',1,' '),
--   v_Frez_reason_code		   CHAR(5);
            lpad(' ',5,' ')
  	from map_acc,izpf,lspf,ltpf,v5pf,ompf,otpf
	inner join c8pf on c8ccy = otccy
	     where map_acc.leg_acc_num = otpf.otbrnm||otdlp||otdlr
	     and map_acc.leg_acc_num = izpf.izbrnm||izdlp||izdlr
	     and map_acc.leg_acc_num = lspf.lsbrnm||lsdlp||lsdlr
	     and map_acc.leg_acc_num = ltpf.ltbrnm||ltdlp||ltdlr
	     and map_acc.leg_acc_num = v5pf.v5brnm||v5dlp||v5dlr
	     and map_acc.leg_acc_num = ompf.ombrnm||omdlp||omdlr;

   
BEGIN

Begin

EXECUTE IMMEDIATE 'truncate table LAM_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Account_Number,v_Customer_Credit_Pref_Percent,v_Customer_Debit_Pref_Percent,v_Acct_ID_Credit_Pref_Percent,v_Acct_ID_Debit_Pref_Percent,v_Repricing_Plan,v_Pegging_Frequency_in_Months,v_Pegging_Frequency_in_Days,v_Interest_Route_Flag,v_Acct_Currency_Code,v_Sol_ID,v_GL_Sub_Head_Code,v_Schm_Code,v_CIF_ID,v_Acct_Open_Date,v_Sanction_Limit,v_Ledger_Number,v_Sector_Code,v_Sub_Sector_Code,v_Purpose_of_Advance,v_Nature_of_Advance,v_Free_Code_3,v_Sanction_Reference_Number,v_Sanction_Limit_Date,v_Sanction_Level_Code,v_Limit_Expiry_Date,v_Sanction_Authority_Code,v_Loan_Paper_Date,v_Operative_Acct_ID,v_Operative_Currency_Code,v_Operative_Sol_ID,v_Demand_Satisfy_Method,v_Lien_on_Operative_Acct_Flag,v_Repayment_currency_rate_code,v_Interest_table_code,v_Interest_on_principal_Flag,v_Penal_int_ovdue_princ_dmd_Fl,v_Princ_Dmd_Ovdue_end_month_Fl,v_Int_On_Int_Demand_Flag,v_penal_int_overdue_int_dmd_Fl,v_Int_Demand_Ovdue_End_Mnth_Fl,v_Transfer_Effective_Date,v_Cumulative_Normal_int_am,v_Cumulative_penal_int_amt,v_cumulative_additional_int_am,v_Liab_Transfer_Effective_date,v_Disbursement_Previous_Sche,v_Debit_Int_Calc_upto_date,v_Repayment_Schedule_Date,v_Repayment_Period_in_months,v_Repayment_Period_in_Days,v_Past_Due_Flag,v_Past_Due_Transfer_Date,v_Prv_To_Pd_GL_Sub_Head_Code,v_Interest_Suspense_Amount,v_Penal_Interest_Suspense_Amt,v_Charge_Off_Flag,v_Charge_Off_Date,v_Charge_Off_Principle,v_Pending_Interest,v_Principal_Recovery,v_Interest_Recovery,v_source_dealer_code,v_Disburse_dealer_code,v_Apply_late_fee_Flag,v_Late_Fee_Grace_Period_Months,v_Late_Fee_Grace_Period_Days,v_Instal_amt_collect_upfront,v_Num_of_instal_collec_upfront,v_upfront_instalment_amount,v_Demand_Past_Due_counter,v_Sum_of_the_princ_demand_amt,v_Payoff_Flag,v_ExcLd_for_Combined_Statement,v_Statement_CIF_ID,v_Transfer_Cycle_String,v_Bank_IRR_Rate,v_Value_Of_Asset,v_Occupation_code_customer,v_Borrower_category_code,v_Mode_of_the_advance,v_Type_of_the_advance,v_guarantee_coverage_Code,v_Industry_Type,v_Free_Code_1,v_Free_Code_2,v_Free_Code_4,v_Free_Code_5,v_Free_Code_6,v_Free_Code_7,v_Free_Code_8,v_Free_Code_9,v_Free_Code_10,v_Acct_Location_Code,v_credit_report_file_Ref_ID,v_DICGC_Fee_Percent,v_Last_Compound_Date,v_Daily_Compound_Interest_Flag,v_CalculateOverdue_Int_rate_Fl,v_EI_paying_period_start_date,v_EI_paying_period_end_date,v_IRR_Rate,v_Advance_interest_amount,v_Amortised_Amount,v_Debit_Booked_Upto_Date,v_Adv_Int_Collection_upto_Date,v_Accrual_Rate,v_Int_Rate_Sanction_Limit_Flg,v_Interest_Rest_Frequency,v_Interest_Rest_Basis,v_Charge_Route_Flag,v_Final_Disbursement_Flag,v_Auto_Resch_after_Holiday_Prd,v_total_number_of_deferments,v_num_deferments_current_repay,v_End_Date,v_Penal_interest_on_Outstandin,v_Charge_off_type,v_Deferred_appli_int_rate_fl,v_Def_applicable_int_rate,v_Deferred_Interest_Amount,v_Auto_Reschedule_Not_Allowed,v_Rescheduled_Overdue_Principa,v_Reschedule_Overdue_Interest,v_Loan_Type,v_Pay_Off_Reason_Code,v_Related_Deposit_Acct_ID,v_Last_AckNowledgt_Dr_Prd_date,v_Refinance_Sanction_Date,v_Refinance_Amount,v_Subsidy_Acct_ID,v_Subsidy_Agency,v_Subsidy_Claimed_Date,v_Subsidy_Activity_Code,v_Debit_AckNowledgement_Type,v_Refinance_Sanction_Number,v_Refinance_Reference_Number,v_Refinance_Claimed_Date,v_Subsidy_Amount,v_Subsidy_Received_Date,v_Preprocess_Fee,v_Activity_Code,v_Probation_Period_in_Months,v_Probation_Period_in_Days,v_Compound_Rest_Indicator_Flag,v_Discounted_Int_Rate_Flag,v_Collect_Interest_Flag,v_Despatch_mode,v_Acct_Manager,v_Mode_of_Oper_Code,v_Statement_Frequency_Type,v_Week_num_for_Statement_Date,v_Week_Day_for_Statement_Date,v_Week_Dt_for_Statement_Date,v_Statement_Freq_case_of_Hldys,v_Statement_of_the_Account,v_Next_Print_date,v_Fixed_Rate_Term_in_Months,v_Fixed_Rate_Term_in_Days,v_Minimum_Int_Percent_Debit,v_Maximum_Int_Percent_Debit,v_Instalment_Income_Ratio,v_Product_Group,v_Free_Text,v_Linked_Account_ID,v_Delinquency_Resch_Method_Flg,v_Total_Number_of_Switch_Over,v_Non_Starter_Flag,v_Floating_Interest_Table_Code,v_Floating_Repricing_Frequency,v_Floating_Repricing_Freq_Days,v_Single_EMI_Turn_Over_Diff_Fl,v_IBAN_Number,v_IAS_CLASSIFICATION_CODE,v_Account_Number1,v_Type_of_top_up,v_Negotiated_Rate_Debit_Percen,v_Normal_Int_Product_Method,v_Penal_Interest_Rate_Method,v_Penal_Interest_Method,v_hldy_prd_frm_first_disb_flg,v_EI_Scheme_Flag,v_EI_Method,v_Ei_Formula_Flag,v_Normal_Holiday_Period_in_Mnt,v_Holiday_Period_Interest_Flag,v_Holiday_Period_Interest_Amt,v_Resche_by_Adjust_TeNor_Amt,v_Auto_Reschedule_every_Disb,v_Auto_Reschule_Int_Rate_Chang,v_Auto_Reschedule_Prepayment,v_Rescheduling_Amount_flag,v_Capitalize_Int_on_Rephasemen,v_Carry_over_Demands,v_Type_Instalment_Combination,v_Cap_Int_to_EMI_Flg,v_Deferred_Int_Due_to_EMI_Cap,v_Month_for_Deferment,v_Num_Months_Deferred,v_Channel_Credit_Pref_Percent,v_Channel_Debit_Pref_Percent,v_Channel_Id,v_Channel_Level_Code,v_Instalment_Effective_Flag,v_Notice_Period,v_Shift_Instalment_Flag,v_Include_Maturity_Date,v_Interest_Rule_Code,v_Cumulative_Capitalize_Fees,v_upfront_instalment_int_amoun,v_Recall_Flag,v_Recall_Date,v_Diff_PS_Freq_For_Rel_Part,v_Diff_Swift_Freq_For_Rel_Part,v_Penal_Interest_table_code,v_Penal_Preferential_Percent,v_RA_ref_number,v_Interest_table_Version,v_Address_Type,v_Phone_Type,v_Email_Type,v_Accrued_Penal_Int_Recover,v_Penal_Interest_Recovery,v_Collection_Interest_Recovery,v_Collection_Penal_Int_Recover,v_Mark_Up_Applicable_Flag,v_Pref_Calendar_base_processin,v_Purchase_Reference,v_Frez_code,v_Frez_reason_code ;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into LAM_O_TABLE values (v_Account_Number,v_Customer_Credit_Pref_Percent,v_Customer_Debit_Pref_Percent,v_Acct_ID_Credit_Pref_Percent,v_Acct_ID_Debit_Pref_Percent,v_Repricing_Plan,v_Pegging_Frequency_in_Months,v_Pegging_Frequency_in_Days,v_Interest_Route_Flag,v_Acct_Currency_Code,v_Sol_ID,v_GL_Sub_Head_Code,v_Schm_Code,v_CIF_ID,v_Acct_Open_Date,v_Sanction_Limit,v_Ledger_Number,v_Sector_Code,v_Sub_Sector_Code,v_Purpose_of_Advance,v_Nature_of_Advance,v_Free_Code_3,v_Sanction_Reference_Number,v_Sanction_Limit_Date,v_Sanction_Level_Code,v_Limit_Expiry_Date,v_Sanction_Authority_Code,v_Loan_Paper_Date,v_Operative_Acct_ID,v_Operative_Currency_Code,v_Operative_Sol_ID,v_Demand_Satisfy_Method,v_Lien_on_Operative_Acct_Flag,v_Repayment_currency_rate_code,v_Interest_table_code,v_Interest_on_principal_Flag,v_Penal_int_ovdue_princ_dmd_Fl,v_Princ_Dmd_Ovdue_end_month_Fl,v_Int_On_Int_Demand_Flag,v_penal_int_overdue_int_dmd_Fl,v_Int_Demand_Ovdue_End_Mnth_Fl,v_Transfer_Effective_Date,v_Cumulative_Normal_int_am,v_Cumulative_penal_int_amt,v_cumulative_additional_int_am,v_Liab_Transfer_Effective_date,v_Disbursement_Previous_Sche,v_Debit_Int_Calc_upto_date,v_Repayment_Schedule_Date,v_Repayment_Period_in_months,v_Repayment_Period_in_Days,v_Past_Due_Flag,v_Past_Due_Transfer_Date,v_Prv_To_Pd_GL_Sub_Head_Code,v_Interest_Suspense_Amount,v_Penal_Interest_Suspense_Amt,v_Charge_Off_Flag,v_Charge_Off_Date,v_Charge_Off_Principle,v_Pending_Interest,v_Principal_Recovery,v_Interest_Recovery,v_source_dealer_code,v_Disburse_dealer_code,v_Apply_late_fee_Flag,v_Late_Fee_Grace_Period_Months,v_Late_Fee_Grace_Period_Days,v_Instal_amt_collect_upfront,v_Num_of_instal_collec_upfront,v_upfront_instalment_amount,v_Demand_Past_Due_counter,v_Sum_of_the_princ_demand_amt,v_Payoff_Flag,v_ExcLd_for_Combined_Statement,v_Statement_CIF_ID,v_Transfer_Cycle_String,v_Bank_IRR_Rate,v_Value_Of_Asset,v_Occupation_code_customer,v_Borrower_category_code,v_Mode_of_the_advance,v_Type_of_the_advance,v_guarantee_coverage_Code,v_Industry_Type,v_Free_Code_1,v_Free_Code_2,v_Free_Code_4,v_Free_Code_5,v_Free_Code_6,v_Free_Code_7,v_Free_Code_8,v_Free_Code_9,v_Free_Code_10,v_Acct_Location_Code,v_credit_report_file_Ref_ID,v_DICGC_Fee_Percent,v_Last_Compound_Date,v_Daily_Compound_Interest_Flag,v_CalculateOverdue_Int_rate_Fl,v_EI_paying_period_start_date,v_EI_paying_period_end_date,v_IRR_Rate,v_Advance_interest_amount,v_Amortised_Amount,v_Debit_Booked_Upto_Date,v_Adv_Int_Collection_upto_Date,v_Accrual_Rate,v_Int_Rate_Sanction_Limit_Flg,v_Interest_Rest_Frequency,v_Interest_Rest_Basis,v_Charge_Route_Flag,v_Final_Disbursement_Flag,v_Auto_Resch_after_Holiday_Prd,v_total_number_of_deferments,v_num_deferments_current_repay,v_End_Date,v_Penal_interest_on_Outstandin,v_Charge_off_type,v_Deferred_appli_int_rate_fl,v_Def_applicable_int_rate,v_Deferred_Interest_Amount,v_Auto_Reschedule_Not_Allowed,v_Rescheduled_Overdue_Principa,v_Reschedule_Overdue_Interest,v_Loan_Type,v_Pay_Off_Reason_Code,v_Related_Deposit_Acct_ID,v_Last_AckNowledgt_Dr_Prd_date,v_Refinance_Sanction_Date,v_Refinance_Amount,v_Subsidy_Acct_ID,v_Subsidy_Agency,v_Subsidy_Claimed_Date,v_Subsidy_Activity_Code,v_Debit_AckNowledgement_Type,v_Refinance_Sanction_Number,v_Refinance_Reference_Number,v_Refinance_Claimed_Date,v_Subsidy_Amount,v_Subsidy_Received_Date,v_Preprocess_Fee,v_Activity_Code,v_Probation_Period_in_Months,v_Probation_Period_in_Days,v_Compound_Rest_Indicator_Flag,v_Discounted_Int_Rate_Flag,v_Collect_Interest_Flag,v_Despatch_mode,v_Acct_Manager,v_Mode_of_Oper_Code,v_Statement_Frequency_Type,v_Week_num_for_Statement_Date,v_Week_Day_for_Statement_Date,v_Week_Dt_for_Statement_Date,v_Statement_Freq_case_of_Hldys,v_Statement_of_the_Account,v_Next_Print_date,v_Fixed_Rate_Term_in_Months,v_Fixed_Rate_Term_in_Days,v_Minimum_Int_Percent_Debit,v_Maximum_Int_Percent_Debit,v_Instalment_Income_Ratio,v_Product_Group,v_Free_Text,v_Linked_Account_ID,v_Delinquency_Resch_Method_Flg,v_Total_Number_of_Switch_Over,v_Non_Starter_Flag,v_Floating_Interest_Table_Code,v_Floating_Repricing_Frequency,v_Floating_Repricing_Freq_Days,v_Single_EMI_Turn_Over_Diff_Fl,v_IBAN_Number,v_IAS_CLASSIFICATION_CODE,v_Account_Number1,v_Type_of_top_up,v_Negotiated_Rate_Debit_Percen,v_Normal_Int_Product_Method,v_Penal_Interest_Rate_Method,v_Penal_Interest_Method,v_hldy_prd_frm_first_disb_flg,v_EI_Scheme_Flag,v_EI_Method,v_Ei_Formula_Flag,v_Normal_Holiday_Period_in_Mnt,v_Holiday_Period_Interest_Flag,v_Holiday_Period_Interest_Amt,v_Resche_by_Adjust_TeNor_Amt,v_Auto_Reschedule_every_Disb,v_Auto_Reschule_Int_Rate_Chang,v_Auto_Reschedule_Prepayment,v_Rescheduling_Amount_flag,v_Capitalize_Int_on_Rephasemen,v_Carry_over_Demands,v_Type_Instalment_Combination,v_Cap_Int_to_EMI_Flg,v_Deferred_Int_Due_to_EMI_Cap,v_Month_for_Deferment,v_Num_Months_Deferred,v_Channel_Credit_Pref_Percent,v_Channel_Debit_Pref_Percent,v_Channel_Id,v_Channel_Level_Code,v_Instalment_Effective_Flag,v_Notice_Period,v_Shift_Instalment_Flag,v_Include_Maturity_Date,v_Interest_Rule_Code,v_Cumulative_Capitalize_Fees,v_upfront_instalment_int_amoun,v_Recall_Flag,v_Recall_Date,v_Diff_PS_Freq_For_Rel_Part,v_Diff_Swift_Freq_For_Rel_Part,v_Penal_Interest_table_code,v_Penal_Preferential_Percent,v_RA_ref_number,v_Interest_table_Version,v_Address_Type,v_Phone_Type,v_Email_Type,v_Accrued_Penal_Int_Recover,v_Penal_Interest_Recovery,v_Collection_Interest_Recovery,v_Collection_Penal_Int_Recover,v_Mark_Up_Applicable_Flag,v_Pref_Calendar_base_processin,v_Purchase_Reference,v_Frez_code,v_Frez_reason_code ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;