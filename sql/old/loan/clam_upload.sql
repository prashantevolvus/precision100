-- File Name		: clam_upload.sql

-- File Created for	: Upload file for clam

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure clam_upload(
v_mig_date IN TIMESTAMP
)
   as
   v_Account_Number		   CHAR(16);
   v_Customer_Credit_Pref_Percent  CHAR(10);
   v_Customer_Debit_Pref_Percent   CHAR(10);
   v_Acct_ID_Credit_Pref_Percent   CHAR(10);
   v_Acct_ID_Debit_Pref_Percent	   CHAR(10);
   v_Pegged_Flag		   CHAR(1);
   v_Pegging_Frequency_in_Months   CHAR(3);
   v_Pegging_Frequency_in_Days	   CHAR(3);
   v_Interest_Route_Flag	   CHAR(1);
   v_Acct_Currency_Code		   CHAR(3);
   v_Sol_ID			   CHAR(8);
   v_GL_Sub_Head_Code		   CHAR(5);
   v_Schm_Code  		   CHAR(5);
   v_CIF_ID  			   CHAR(32);
   v_Acct_Open_Date		   CHAR(8);
   v_Sanction_Limit		   CHAR(17);
   v_Ledger_Number		   CHAR(3);
   v_Sector_Code		   CHAR(5);
   v_Sub_Sector_Code		   CHAR(5);
   v_Purpose_of_Advance		   CHAR(5);
   v_Nature_of_Advance		   CHAR(5);
   v_Free_Code_3		   CHAR(5);
   v_Sanction_Reference_Number	   CHAR(25);
   v_Sanction_Limit_Date	   CHAR(8);
   v_Sanction_Level_Code	   CHAR(5);
   v_Limit_Expiry_Date		   CHAR(8);
   v_Sanction_Authority_Code	   CHAR(5);
   v_Loan_Paper_Date		   CHAR(8);
   v_Operative_Acct_ID		   CHAR(16);
   v_Operative_Currency_Code	   CHAR(3);
   v_Operative_Sol_ID		   CHAR(8);
   v_Demand_Satisfy_Method	   CHAR(1);
   v_Lien_on_Operative_Acct_Flag   CHAR(1);
   v_Demand_Satisfaction_Rate_Code CHAR(5);
   v_Interest_table_code	   CHAR(5);
   v_Interest_on_principal_Flag	   CHAR(1);
   v_Penal_int_ovdue_princ_dmd_Flg CHAR(1);
   v_Princ_Dmd_Ovdue_end_month_Flg CHAR(1);
   v_Int_On_Int_Demand_Flag	   CHAR(1);
   v_penal_int_onovdue_int_dmd_Flg CHAR(1);
   v_Int_Demand_Ovdue_EndMnth_Flg  CHAR(1);
   v_Transfer_Effective_Date	   CHAR(8);
   v_Cumulative_Normal_int_amt	   CHAR(17);
   v_Cumulative_penal_int_amt	   CHAR(17);
   v_cumulative_additional_int_amt CHAR(17);
   v_Liab_as_on_Transfer_Eff_date  CHAR(17);
   v_Disbursement_in_Prev_Schedule CHAR(17);
   v_Last_interest_posted_date     CHAR(8);
   v_Repayment_Schedule_Date	   CHAR(8);
   v_Repayment_Period_in_months	   CHAR(3);
   v_Repayment_Period_in_Days	   CHAR(3);
   v_Past_Due_Flag		   CHAR(1);
   v_Past_Due_date		   CHAR(8);
   v_Normal_GL_subhead_Code	   CHAR(5);
   v_Interest_Suspense_Amount	   CHAR(17);
   v_Penal_Interest_Suspense_Amt   CHAR(17);
   v_Charge_Off_Flag		   CHAR(1);
   v_Charge_Off_Date		   CHAR(8);
   v_Charge_Off_Principle	   CHAR(17);
   v_Pending_Interest		   CHAR(17);
   v_Principal_Recovery		   CHAR(17);
   v_Interest_Recovery		   CHAR(17);
   v_source_dealer_code		   CHAR(20);
   v_Disburse_dealer_code	   CHAR(20);
   v_Apply_late_fee_Flag	   CHAR(1);
   v_Late_Fee_Grace_Period_Months  CHAR(3);
   v_Late_Fee_Grace_Period_Days	   CHAR(3);
   v_Days_Past_Due_counter	   CHAR(5);
   v_Sum_principal_demand_amount   CHAR(17);
   v_Payoff_Flag		   CHAR(1);
   v_ExcLd_for_Combined_Statement  CHAR(1);
   v_Statement_CIF_ID		   CHAR(32);
   v_Transfer_Cycle_String	   CHAR(45);
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
   v_Last_Compound_Date		   CHAR(8);
   v_Daily_Compound_Interest_Flag  CHAR(1);
   v_CalculateOverdue_Int_rate_Flg CHAR(8);
   v_EI_period_start_date	   CHAR(8);
   v_Charge_Route_flag	 	   CHAR(1);
   v_Total_Number_of_Deferments    CHAR(2);
   v_Deferments_in_curr_schedule   CHAR(2);
   v_Collection_int_in_adv_flag    CHAR(1);
   v_Reserve_account	 	   CHAR(16);
   v_Draw_down_level_int_rate_flg  CHAR(1);
   v_EI_flag		 	   CHAR(1);
   v_Installment_date_extd 	   CHAR(8);
   v_Extended_overdue_Date 	   CHAR(8);
   v_Def_applicable_int_rate_flg   CHAR(1);
   v_Def_applicable_int_rate 	   CHAR(10);
   v_Deferred_Interest_Amount 	   CHAR(17);
   v_Last_prepayment_date	   CHAR(8);
   v_Refinance_end_date	 	   CHAR(8);
   v_Refinance_reference_number    CHAR(25);
   v_Charge_off_type	 	   CHAR(1);
   v_Crystallization_reqd	   CHAR(1);
   v_Crystallization_Currency 	   CHAR(3);
   v_Contract_date	 	   CHAR(8);
   v_Crystallization_Ac	 	   CHAR(16);
   v_Account_Status	 	   CHAR(1);
   v_Commitment_fee_methods 	   CHAR(1);
   v_Shift_installment_flag 	   CHAR(1);
   v_Parent_cif_id	 	   CHAR(32);
   v_Peg_Review_Date	 	   CHAR(8);
   v_Refinance_Ref_Number	   CHAR(25);
   v_Penal_Int_based_on_Outstnding CHAR(1);
   v_Delinquency_Resch_Method_Flg  CHAR(1);
   v_Probation_Period_in_Months    CHAR(3);
   v_Probation_Period_in_Days 	   CHAR(3);
   v_Total_Number_of_Switch_Over   CHAR(3);
   v_Non_Starter_Flag	 	   CHAR(1);
   v_Repricing_Plan	 	   CHAR(1);
   v_Fixed_Rate_Term_in_Months 	   CHAR(3);
   v_Fixed_Rate_Term_in_Years 	   CHAR(3);
   v_Floating_Interest_Table_Code  CHAR(5);
   v_Floating_Repricing_Frequency  CHAR(3);
   v_Floating_Repricing_Freq_Days  CHAR(3);
   v_Auto_Reschedule_Not_Allowed   CHAR(1);
   v_Reschedule_Overdue_Principal  CHAR(17);
   v_Reschedule_Overdue_Interest   CHAR(17);
   v_Loan_Type		 	   CHAR(1);
   v_Pay_Off_Reason_Code	   CHAR(5);
   v_Refinance_Sanction_Date 	   CHAR(8);
   v_Refinance_Amount	 	   CHAR(17);
   v_Subsidy_Acct_Id	 	   CHAR(16);
   v_Subsidy_Agency	 	   CHAR(5);
   v_Subsidy_Claimed_Date	   CHAR(8);
   v_Subsidy_Activity_Code 	   CHAR(10);
   v_Debit_Acknowledgement_Type    CHAR(1);
   v_Refinance_Sanction_Number 	   CHAR(25);
   v_Refinance_Claimed_Date 	   CHAR(8);
   v_Subsidy_Amount	 	   CHAR(17);
   v_Subsidy_Received_Date 	   CHAR(8);
   v_Compound_Rest_Indicator_Flag  CHAR(1);
   v_Collect_Interest_Flag 	   CHAR(1);
   v_Despatch_Mode	 	   CHAR(1);
   v_Acct_Manager		   CHAR(15);
   v_Mode_of_Oper_Code	 	   CHAR(5);
   v_Statement_Frequency_Type 	   CHAR(1);
   v_Week_num_for_Statement_Date   CHAR(1);
   v_Week_Day_for_Statement_Date   CHAR(1);
   v_Start_Date_for_Acct_Statement CHAR(2);
   v_Statement_Freq_case_of_Hldys  CHAR(1);
   v_Statement_of_the_Account 	   CHAR(1);
   v_Next_Print_date	 	   CHAR(8);
   v_Minimum_Int_Percent_Debit 	   CHAR(10);
   v_Maximum_Int_Percent_Debit 	   CHAR(10);
   v_Product_Group	 	   CHAR(5);
   v_Free_Text		 	   CHAR(240);
   v_penal_prod_mthd_flg	   CHAR(1);
   v_penal_rate_mthd_flg	   CHAR(1);
   v_Iban_Number		   CHAR(34);
   v_IAS_CLASSIFICATION_CODE 	   CHAR(5);
   v_Negotiated_Rate_Debit_Percent CHAR(10);
   v_Interest_Rule_Code	 	   CHAR(5);
   v_Recall_Flag		   CHAR(1);
   v_Recall_Date		   CHAR(8);
   v_Diff_PS_Freq_For_Rel_Party	   CHAR(1);
   v_Diff_Swift_Freq_For_Rel_Party CHAR(1);
   v_Penal_interest_table_code 	   CHAR(5);
   v_Penal_Preferential_Percent    CHAR(10);
   v_Interest_table_Version 	   CHAR(5);
   v_Address_Type		   CHAR(12);
   v_Related_Party_Phone_Type 	   CHAR(12);
   v_Related_Party_Email_Type 	   CHAR(12);
   v_Advance_interest_amount 	   CHAR(17);
   v_Amortised_Amount	 	   CHAR(17);
   v_Adv_Int_Collection_upto_Date  CHAR(8);
   v_Accrual_Rate		   CHAR(9);
   v_Accrued_Penal_Int_Recovery	   CHAR(17);
   v_Penal_Interest_Recovery 	   CHAR(17);
   v_Collection_Interest_Recovery  CHAR(17);
   v_Collection_Penal_Int_Recovery CHAR(17);
   
   
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

EXECUTE IMMEDIATE 'truncate table CLAM_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Account_Number,v_Customer_Credit_Pref_Percent,v_Customer_Debit_Pref_Percent,v_Acct_ID_Credit_Pref_Percent,v_Acct_ID_Debit_Pref_Percent,v_Pegged_Flag,v_Pegging_Frequency_in_Months,v_Pegging_Frequency_in_Days,v_Interest_Route_Flag,v_Acct_Currency_Code,v_Sol_ID,v_GL_Sub_Head_Code,v_Schm_Code,v_CIF_ID,v_Acct_Open_Date,v_Sanction_Limit,v_Ledger_Number,v_Sector_Code,v_Sub_Sector_Code,v_Purpose_of_Advance,v_Nature_of_Advance,v_Free_Code_3,v_Sanction_Reference_Number,v_Sanction_Limit_Date,v_Sanction_Level_Code,v_Limit_Expiry_Date,v_Sanction_Authority_Code,v_Loan_Paper_Date,v_Operative_Acct_ID,v_Operative_Currency_Code,v_Operative_Sol_ID,v_Demand_Satisfy_Method,v_Lien_on_Operative_Acct_Flag,v_Demand_Satisfaction_Rate_Code,v_Interest_table_code,v_Interest_on_principal_Flag,v_Penal_int_ovdue_princ_dmd_Flg,v_Princ_Dmd_Ovdue_end_month_Flg,v_Int_On_Int_Demand_Flag,v_penal_int_onovdue_int_dmd_Flg,v_Int_Demand_Ovdue_EndMnth_Flg,v_Transfer_Effective_Date,v_Cumulative_Normal_int_amt,v_Cumulative_penal_int_amt,v_cumulative_additional_int_amt,v_Liab_as_on_Transfer_Eff_date,v_Disbursement_in_Prev_Schedule,v_Last_interest_posted_date,v_Repayment_Schedule_Date,v_Repayment_Period_in_months,v_Repayment_Period_in_Days,v_Past_Due_Flag,v_Past_Due_date,v_Normal_GL_subhead_Code,v_Interest_Suspense_Amount,v_Penal_Interest_Suspense_Amt,v_Charge_Off_Flag,v_Charge_Off_Date,v_Charge_Off_Principle,v_Pending_Interest,v_Principal_Recovery,v_Interest_Recovery,v_source_dealer_code,v_Disburse_dealer_code,v_Apply_late_fee_Flag,v_Late_Fee_Grace_Period_Months,v_Late_Fee_Grace_Period_Days,v_Days_Past_Due_counter,v_Sum_principal_demand_amount,v_Payoff_Flag,v_ExcLd_for_Combined_Statement,v_Statement_CIF_ID,v_Transfer_Cycle_String,v_Value_Of_Asset,v_Occupation_code_customer,v_Borrower_category_code,v_Mode_of_the_advance,v_Type_of_the_advance,v_guarantee_coverage_Code,v_Industry_Type,v_Free_Code_1,v_Free_Code_2,v_Free_Code_4,v_Free_Code_5,v_Free_Code_6,v_Free_Code_7,v_Free_Code_8,v_Free_Code_9,v_Free_Code_10,v_Acct_Location_Code,v_credit_report_file_Ref_ID,v_Last_Compound_Date,v_Daily_Compound_Interest_Flag,v_CalculateOverdue_Int_rate_Flg,v_EI_period_start_date,v_Charge_Route_flag,v_Total_Number_of_Deferments,v_Deferments_in_curr_schedule,v_Collection_int_in_adv_flag,v_Reserve_account,v_Draw_down_level_int_rate_flg,v_EI_flag,v_Installment_date_extd,v_Extended_overdue_Date,v_Def_applicable_int_rate_flg,v_Def_applicable_int_rate,v_Deferred_Interest_Amount,v_Last_prepayment_date,v_Refinance_end_date,v_Refinance_reference_number,v_Charge_off_type,v_Crystallization_reqd,v_Crystallization_Currency,v_Contract_date,v_Crystallization_Ac,v_Account_Status,v_Commitment_fee_methods,v_Shift_installment_flag,v_Parent_cif_id,v_Peg_Review_Date,v_Refinance_Ref_Number,v_Penal_Int_based_on_Outstnding,v_Delinquency_Resch_Method_Flg,v_Probation_Period_in_Months,v_Probation_Period_in_Days,v_Total_Number_of_Switch_Over,v_Non_Starter_Flag,v_Repricing_Plan,v_Fixed_Rate_Term_in_Months,v_Fixed_Rate_Term_in_Years,v_Floating_Interest_Table_Code,v_Floating_Repricing_Frequency,v_Floating_Repricing_Freq_Days,v_Auto_Reschedule_Not_Allowed,v_Reschedule_Overdue_Principal,v_Reschedule_Overdue_Interest,v_Loan_Type,v_Pay_Off_Reason_Code,v_Refinance_Sanction_Date,v_Refinance_Amount,v_Subsidy_Acct_Id,v_Subsidy_Agency,v_Subsidy_Claimed_Date,v_Subsidy_Activity_Code,v_Debit_Acknowledgement_Type,v_Refinance_Sanction_Number,v_Refinance_Claimed_Date,v_Subsidy_Amount,v_Subsidy_Received_Date,v_Compound_Rest_Indicator_Flag,v_Collect_Interest_Flag,v_Despatch_Mode,v_Acct_Manager,v_Mode_of_Oper_Code,v_Statement_Frequency_Type,v_Week_num_for_Statement_Date,v_Week_Day_for_Statement_Date,v_Start_Date_for_Acct_Statement,v_Statement_Freq_case_of_Hldys,v_Statement_of_the_Account,v_Next_Print_date,v_Minimum_Int_Percent_Debit,v_Maximum_Int_Percent_Debit,v_Product_Group,v_Free_Text,v_penal_prod_mthd_flg,v_penal_rate_mthd_flg,v_Iban_Number,v_IAS_CLASSIFICATION_CODE,v_Negotiated_Rate_Debit_Percent,v_Interest_Rule_Code,v_Recall_Flag,v_Recall_Date,v_Diff_PS_Freq_For_Rel_Party,v_Diff_Swift_Freq_For_Rel_Party,v_Penal_interest_table_code,v_Penal_Preferential_Percent,v_Interest_table_Version,v_Address_Type,v_Related_Party_Phone_Type,v_Related_Party_Email_Type,v_Advance_interest_amount,v_Amortised_Amount,v_Adv_Int_Collection_upto_Date,v_Accrual_Rate,v_Accrued_Penal_Int_Recovery,v_Penal_Interest_Recovery,v_Collection_Interest_Recovery,v_Collection_Penal_Int_Recovery ;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into CLAM_O_TABLE values (v_Account_Number,v_Customer_Credit_Pref_Percent,v_Customer_Debit_Pref_Percent,v_Acct_ID_Credit_Pref_Percent,v_Acct_ID_Debit_Pref_Percent,v_Pegged_Flag,v_Pegging_Frequency_in_Months,v_Pegging_Frequency_in_Days,v_Interest_Route_Flag,v_Acct_Currency_Code,v_Sol_ID,v_GL_Sub_Head_Code,v_Schm_Code,v_CIF_ID,v_Acct_Open_Date,v_Sanction_Limit,v_Ledger_Number,v_Sector_Code,v_Sub_Sector_Code,v_Purpose_of_Advance,v_Nature_of_Advance,v_Free_Code_3,v_Sanction_Reference_Number,v_Sanction_Limit_Date,v_Sanction_Level_Code,v_Limit_Expiry_Date,v_Sanction_Authority_Code,v_Loan_Paper_Date,v_Operative_Acct_ID,v_Operative_Currency_Code,v_Operative_Sol_ID,v_Demand_Satisfy_Method,v_Lien_on_Operative_Acct_Flag,v_Demand_Satisfaction_Rate_Code,v_Interest_table_code,v_Interest_on_principal_Flag,v_Penal_int_ovdue_princ_dmd_Flg,v_Princ_Dmd_Ovdue_end_month_Flg,v_Int_On_Int_Demand_Flag,v_penal_int_onovdue_int_dmd_Flg,v_Int_Demand_Ovdue_EndMnth_Flg,v_Transfer_Effective_Date,v_Cumulative_Normal_int_amt,v_Cumulative_penal_int_amt,v_cumulative_additional_int_amt,v_Liab_as_on_Transfer_Eff_date,v_Disbursement_in_Prev_Schedule,v_Last_interest_posted_date,v_Repayment_Schedule_Date,v_Repayment_Period_in_months,v_Repayment_Period_in_Days,v_Past_Due_Flag,v_Past_Due_date,v_Normal_GL_subhead_Code,v_Interest_Suspense_Amount,v_Penal_Interest_Suspense_Amt,v_Charge_Off_Flag,v_Charge_Off_Date,v_Charge_Off_Principle,v_Pending_Interest,v_Principal_Recovery,v_Interest_Recovery,v_source_dealer_code,v_Disburse_dealer_code,v_Apply_late_fee_Flag,v_Late_Fee_Grace_Period_Months,v_Late_Fee_Grace_Period_Days,v_Days_Past_Due_counter,v_Sum_principal_demand_amount,v_Payoff_Flag,v_ExcLd_for_Combined_Statement,v_Statement_CIF_ID,v_Transfer_Cycle_String,v_Value_Of_Asset,v_Occupation_code_customer,v_Borrower_category_code,v_Mode_of_the_advance,v_Type_of_the_advance,v_guarantee_coverage_Code,v_Industry_Type,v_Free_Code_1,v_Free_Code_2,v_Free_Code_4,v_Free_Code_5,v_Free_Code_6,v_Free_Code_7,v_Free_Code_8,v_Free_Code_9,v_Free_Code_10,v_Acct_Location_Code,v_credit_report_file_Ref_ID,v_Last_Compound_Date,v_Daily_Compound_Interest_Flag,v_CalculateOverdue_Int_rate_Flg,v_EI_period_start_date,v_Charge_Route_flag,v_Total_Number_of_Deferments,v_Deferments_in_curr_schedule,v_Collection_int_in_adv_flag,v_Reserve_account,v_Draw_down_level_int_rate_flg,v_EI_flag,v_Installment_date_extd,v_Extended_overdue_Date,v_Def_applicable_int_rate_flg,v_Def_applicable_int_rate,v_Deferred_Interest_Amount,v_Last_prepayment_date,v_Refinance_end_date,v_Refinance_reference_number,v_Charge_off_type,v_Crystallization_reqd,v_Crystallization_Currency,v_Contract_date,v_Crystallization_Ac,v_Account_Status,v_Commitment_fee_methods,v_Shift_installment_flag,v_Parent_cif_id,v_Peg_Review_Date,v_Refinance_Ref_Number,v_Penal_Int_based_on_Outstnding,v_Delinquency_Resch_Method_Flg,v_Probation_Period_in_Months,v_Probation_Period_in_Days,v_Total_Number_of_Switch_Over,v_Non_Starter_Flag,v_Repricing_Plan,v_Fixed_Rate_Term_in_Months,v_Fixed_Rate_Term_in_Years,v_Floating_Interest_Table_Code,v_Floating_Repricing_Frequency,v_Floating_Repricing_Freq_Days,v_Auto_Reschedule_Not_Allowed,v_Reschedule_Overdue_Principal,v_Reschedule_Overdue_Interest,v_Loan_Type,v_Pay_Off_Reason_Code,v_Refinance_Sanction_Date,v_Refinance_Amount,v_Subsidy_Acct_Id,v_Subsidy_Agency,v_Subsidy_Claimed_Date,v_Subsidy_Activity_Code,v_Debit_Acknowledgement_Type,v_Refinance_Sanction_Number,v_Refinance_Claimed_Date,v_Subsidy_Amount,v_Subsidy_Received_Date,v_Compound_Rest_Indicator_Flag,v_Collect_Interest_Flag,v_Despatch_Mode,v_Acct_Manager,v_Mode_of_Oper_Code,v_Statement_Frequency_Type,v_Week_num_for_Statement_Date,v_Week_Day_for_Statement_Date,v_Start_Date_for_Acct_Statement,v_Statement_Freq_case_of_Hldys,v_Statement_of_the_Account,v_Next_Print_date,v_Minimum_Int_Percent_Debit,v_Maximum_Int_Percent_Debit,v_Product_Group,v_Free_Text,v_penal_prod_mthd_flg,v_penal_rate_mthd_flg,v_Iban_Number,v_IAS_CLASSIFICATION_CODE,v_Negotiated_Rate_Debit_Percent,v_Interest_Rule_Code,v_Recall_Flag,v_Recall_Date,v_Diff_PS_Freq_For_Rel_Party,v_Diff_Swift_Freq_For_Rel_Party,v_Penal_interest_table_code,v_Penal_Preferential_Percent,v_Interest_table_Version,v_Address_Type,v_Related_Party_Phone_Type,v_Related_Party_Email_Type,v_Advance_interest_amount,v_Amortised_Amount,v_Adv_Int_Collection_upto_Date,v_Accrual_Rate,v_Accrued_Penal_Int_Recovery,v_Penal_Interest_Recovery,v_Collection_Interest_Recovery,v_Collection_Penal_Int_Recovery ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;