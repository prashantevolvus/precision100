create or replace
procedure siu(
v_mig_date IN TIMESTAMP
)
   as
   
   v_Indicator  		 VARCHAR2(3);
   v_SOL_ID  			 VARCHAR2(8);
   v_SI_Freq_Type		 VARCHAR2(1);
   v_SI_Week_Identification_Code VARCHAR2(1);
   v_SI_Freq_Week_Day		 VARCHAR2(1);
   v_SI_Frq_St_Dt_of_Mnth 	 VARCHAR2(2);
   v_SI_Action_Codes_for_Holiday VARCHAR2(1);
   v_SI_Execution_Time		 VARCHAR2(1);
   v_SI_end_date 		 VARCHAR2(8);
   v_SI_Next_Execution_Date	 VARCHAR2(8);
   v_Target_Account		 VARCHAR2(16);
   v_Balance_Indicator		 VARCHAR2(1);
   v_Excess_Short_Indicator	 VARCHAR2(1);
   v_Target_Balance		 VARCHAR2(17);
   v_Auto_Post_Flag		 VARCHAR2(1);
   v_Carry_Forward_Allowed_Flag	 VARCHAR2(1);
   v_Validate_Crncy_Holiday_Flag VARCHAR2(1);
   v_Delete_Trn_if_not_Posted	 VARCHAR2(1);
   v_Carry_Forward_Limit	 VARCHAR2(5);
   v_SI_Class  			 VARCHAR2(1);
   v_CIF_ID  			 VARCHAR2(32);
   v_Remarks  			 VARCHAR2(50);
   v_Closure_remarks		 VARCHAR2(50);
   v_Execution_charge_code	 VARCHAR2(25);
   v_Failure_charge_code	 VARCHAR2(25);
   v_Charge_rate_code		 VARCHAR2(5);
   v_Charge_debit_account_no     VARCHAR2(16);
   v_Amount_Indicator		 VARCHAR2(1);
   v_Create_Memo_Pad_Entry	 VARCHAR2(1);
   v_Currency_Code		 VARCHAR2(3);
   v_Fixed_Amount		 VARCHAR2(17);
   v_Part_Tran_Type		 VARCHAR2(1);
   v_Balance_Indicator1		 VARCHAR2(1);
   v_Excess_Short_Indicator1	 VARCHAR2(1);
   v_Account_Number		 VARCHAR2(16);
   v_Account_Balance		 VARCHAR2(17);
   v_Percentage  		 VARCHAR2(8);
   v_Amount_multiple		 VARCHAR2(17);
   v_ADM_Account_No		 VARCHAR2(16);
   v_Round_off_Type		 VARCHAR2(1);
   v_Round_off_Value		 VARCHAR2(17);
   v_Collect_Charges		 VARCHAR2(1);
   v_Report_Code 		 VARCHAR2(5);
   v_Reference_Number		 VARCHAR2(20);
   v_Tran_particular		 VARCHAR2(50);
   v_Tran_remarks		 VARCHAR2(30);
   v_Intent_Code 		 VARCHAR2(5);
   v_DD_payable_bank_code	 VARCHAR2(6);
   v_DD_payable_branch_code	 VARCHAR2(6);
   v_Payee_name  		 VARCHAR2(80);
   v_Purchase_Account_Number	 VARCHAR2(16);
   v_Purchase_Name		 VARCHAR2(80);
   v_cr_adv_pymnt_flg		 VARCHAR2(1);
   v_Amount_Indicator1		 VARCHAR2(1);
   v_Create_Memo_Pad_Entry1	 VARCHAR2(1);
   v_ADM_Account_No1		 VARCHAR2(16);
   v_Round_off_Type1		 VARCHAR2(1);
   v_dr_rnd_off_ind1		 VARCHAR2(1);
   v_Round_off_Value1		 VARCHAR2(17);
   v_Collect_Charges1		 VARCHAR2(1);
   v_Report_Code1		 VARCHAR2(5);
   v_Reference_Number1		 VARCHAR2(20);
   v_Tran_particular1		 VARCHAR2(50);
   v_Tran_remarks1		 VARCHAR2(30);
   v_Intent_Code1		 VARCHAR2(5);
   v_IBAN_Number		 VARCHAR2(34);
   
--  DECLARE
   CURSOR c1 is
     select 'SIU',
   v_Indicator  		 VARCHAR2(3);
   v_SOL_ID  			 VARCHAR2(8);
            lpad(' ',3,' '),
   v_SI_Freq_Type		 VARCHAR2(1);
            lpad(' ',3,' '),
   v_SI_Week_Identification_Code VARCHAR2(1);
            lpad(' ',3,' '),
   v_SI_Freq_Week_Day		 VARCHAR2(1);
            lpad(' ',3,' '),
   v_SI_Frq_St_Dt_of_Mnth 	 VARCHAR2(2);
            lpad(' ',3,' '),
   v_SI_Action_Codes_for_Holiday VARCHAR2(1);
            lpad(' ',3,' '),
   v_SI_Execution_Time		 VARCHAR2(1);
            lpad(' ',3,' '),
   v_SI_end_date 		 VARCHAR2(8);
            lpad(' ',3,' '),
   v_SI_Next_Execution_Date	 VARCHAR2(8);
            lpad(' ',3,' '),
   v_Target_Account		 VARCHAR2(16);
            lpad(' ',3,' '),
   v_Balance_Indicator		 VARCHAR2(1);
            lpad(' ',3,' '),
   v_Excess_Short_Indicator	 VARCHAR2(1);
            lpad(' ',3,' '),
   v_Target_Balance		 VARCHAR2(17);
            lpad(' ',3,' '),
   v_Auto_Post_Flag		 VARCHAR2(1);
            lpad(' ',3,' '),
   v_Carry_Forward_Allowed_Flag	 VARCHAR2(1);
            lpad(' ',3,' '),
   v_Validate_Crncy_Holiday_Flag VARCHAR2(1);
            lpad(' ',3,' '),
   v_Delete_Trn_if_not_Posted	 VARCHAR2(1);
            lpad(' ',3,' '),
   v_Carry_Forward_Limit	 VARCHAR2(5);
            lpad(' ',3,' '),
   v_SI_Class  			 VARCHAR2(1);
            lpad(' ',3,' '),
   v_CIF_ID  			 VARCHAR2(32);
            lpad(' ',3,' '),
   v_Remarks  			 VARCHAR2(50);
            lpad(' ',3,' '),
   v_Closure_remarks		 VARCHAR2(50);
            lpad(' ',3,' '),
   v_Execution_charge_code	 VARCHAR2(25);
            lpad(' ',3,' '),
   v_Failure_charge_code	 VARCHAR2(25);
            lpad(' ',3,' '),
   v_Charge_rate_code		 VARCHAR2(5);
            lpad(' ',3,' '),
   v_Charge_debit_account_no     VARCHAR2(16);
            lpad(' ',3,' '),
   v_Amount_Indicator		 VARCHAR2(1);
            lpad(' ',3,' '),
   v_Create_Memo_Pad_Entry	 VARCHAR2(1);
            lpad(' ',3,' '),
   v_Currency_Code		 VARCHAR2(3);
            lpad(' ',3,' '),
   v_Fixed_Amount		 VARCHAR2(17);
            lpad(' ',3,' '),
   v_Part_Tran_Type		 VARCHAR2(1);
            lpad(' ',3,' '),
   v_Balance_Indicator1		 VARCHAR2(1);
            lpad(' ',3,' '),
   v_Excess_Short_Indicator1	 VARCHAR2(1);
            lpad(' ',3,' '),
   v_Account_Number		 VARCHAR2(16);
            lpad(' ',3,' '),
   v_Account_Balance		 VARCHAR2(17);
            lpad(' ',3,' '),
   v_Percentage  		 VARCHAR2(8);
            lpad(' ',3,' '),
   v_Amount_multiple		 VARCHAR2(17);
            lpad(' ',3,' '),
   v_ADM_Account_No		 VARCHAR2(16);
            lpad(' ',3,' '),
   v_Round_off_Type		 VARCHAR2(1);
            lpad(' ',3,' '),
   v_Round_off_Value		 VARCHAR2(17);
            lpad(' ',3,' '),
   v_Collect_Charges		 VARCHAR2(1);
            lpad(' ',3,' '),
   v_Report_Code 		 VARCHAR2(5);
            lpad(' ',3,' '),
   v_Reference_Number		 VARCHAR2(20);
            lpad(' ',3,' '),
   v_Tran_particular		 VARCHAR2(50);
            lpad(' ',3,' '),
   v_Tran_remarks		 VARCHAR2(30);
            lpad(' ',3,' '),
   v_Intent_Code 		 VARCHAR2(5);
            lpad(' ',3,' '),
   v_DD_payable_bank_code	 VARCHAR2(6);
            lpad(' ',3,' '),
   v_DD_payable_branch_code	 VARCHAR2(6);
            lpad(' ',3,' '),
   v_Payee_name  		 VARCHAR2(80);
            lpad(' ',3,' '),
   v_Purchase_Account_Number	 VARCHAR2(16);
            lpad(' ',3,' '),
   v_Purchase_Name		 VARCHAR2(80);
            lpad(' ',3,' '),
   v_cr_adv_pymnt_flg		 VARCHAR2(1);
            lpad(' ',3,' '),
   v_Amount_Indicator1		 VARCHAR2(1);
            lpad(' ',3,' '),
   v_Create_Memo_Pad_Entry1	 VARCHAR2(1);
            lpad(' ',3,' '),
   v_ADM_Account_No1		 VARCHAR2(16);
            lpad(' ',3,' '),
   v_Round_off_Type1		 VARCHAR2(1);
            lpad(' ',3,' '),
   v_dr_rnd_off_ind1		 VARCHAR2(1);
            lpad(' ',3,' '),
   v_Round_off_Value1		 VARCHAR2(17);
            lpad(' ',3,' '),
   v_Collect_Charges1		 VARCHAR2(1);
            lpad(' ',3,' '),
   v_Report_Code1		 VARCHAR2(5);
            lpad(' ',3,' '),
   v_Reference_Number1		 VARCHAR2(20);
            lpad(' ',3,' '),
   v_Tran_particular1		 VARCHAR2(50);
            lpad(' ',3,' '),
   v_Tran_remarks1		 VARCHAR2(30);
            lpad(' ',3,' '),
   v_Intent_Code1		 VARCHAR2(5);
            lpad(' ',3,' '),
   v_IBAN_Number		 VARCHAR2(34);
            lpad(' ',3,' '),

            lpad(' ',3,' '),
  	from jupf;

   
BEGIN

Begin

EXECUTE IMMEDIATE 'truncate table siu_o_table';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Indicator,v_SOL_ID,v_SI_Freq_Type,v_SI_Week_Identification_Code,v_SI_Freq_Week_Day,v_SI_Frq_St_Dt_of_Mnth,v_SI_Action_Codes_for_Holiday,v_SI_Execution_Time,v_SI_end_date,v_SI_Next_Execution_Date,v_Target_Account,v_Balance_Indicator,v_Excess_Short_Indicator,v_Target_Balance,v_Auto_Post_Flag,v_Carry_Forward_Allowed_Flag,v_Validate_Crncy_Holiday_Flag,v_Delete_Trn_if_not_Posted,v_Carry_Forward_Limit,v_SI_Class,v_CIF_ID,v_Remarks,v_Closure_remarks,v_Execution_charge_code,v_Failure_charge_code,v_Charge_rate_code,v_Charge_debit_account_no,v_Amount_Indicator,v_Create_Memo_Pad_Entry,v_Currency_Code,v_Fixed_Amount,v_Part_Tran_Type,v_Balance_Indicator1,v_Excess_Short_Indicator1,v_Account_Number,v_Account_Balance,v_Percentage,v_Amount_multiple,v_ADM_Account_No,v_Round_off_Type,v_Round_off_Value,v_Collect_Charges,v_Report_Code,v_Reference_Number,v_Tran_particular,v_Tran_remarks,v_Intent_Code,v_DD_payable_bank_code,v_DD_payable_branch_code,v_Payee_name,v_Purchase_Account_Number,v_Purchase_Name,v_cr_adv_pymnt_flg,v_Amount_Indicator1,v_Create_Memo_Pad_Entry1,v_ADM_Account_No1,v_Round_off_Type1,v_dr_rnd_off_ind1,v_Round_off_Value1,v_Collect_Charges1,v_Report_Code1,v_Reference_Number1,v_Tran_particular1,v_Tran_remarks1,v_Intent_Code1,v_IBAN_Number;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into siu_o_table values (v_Indicator,v_SOL_ID,v_SI_Freq_Type,v_SI_Week_Identification_Code,v_SI_Freq_Week_Day,v_SI_Frq_St_Dt_of_Mnth,v_SI_Action_Codes_for_Holiday,v_SI_Execution_Time,v_SI_end_date,v_SI_Next_Execution_Date,v_Target_Account,v_Balance_Indicator,v_Excess_Short_Indicator,v_Target_Balance,v_Auto_Post_Flag,v_Carry_Forward_Allowed_Flag,v_Validate_Crncy_Holiday_Flag,v_Delete_Trn_if_not_Posted,v_Carry_Forward_Limit,v_SI_Class,v_CIF_ID,v_Remarks,v_Closure_remarks,v_Execution_charge_code,v_Failure_charge_code,v_Charge_rate_code,v_Charge_debit_account_no,v_Amount_Indicator,v_Create_Memo_Pad_Entry,v_Currency_Code,v_Fixed_Amount,v_Part_Tran_Type,v_Balance_Indicator1,v_Excess_Short_Indicator1,v_Account_Number,v_Account_Balance,v_Percentage,v_Amount_multiple,v_ADM_Account_No,v_Round_off_Type,v_Round_off_Value,v_Collect_Charges,v_Report_Code,v_Reference_Number,v_Tran_particular,v_Tran_remarks,v_Intent_Code,v_DD_payable_bank_code,v_DD_payable_branch_code,v_Payee_name,v_Purchase_Account_Number,v_Purchase_Name,v_cr_adv_pymnt_flg,v_Amount_Indicator1,v_Create_Memo_Pad_Entry1,v_ADM_Account_No1,v_Round_off_Type1,v_dr_rnd_off_ind1,v_Round_off_Value1,v_Collect_Charges1,v_Report_Code1,v_Reference_Number1,v_Tran_particular1,v_Tran_remarks1,v_Intent_Code1,v_IBAN_Number ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;