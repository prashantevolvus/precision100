
truncate table lam_o_table;

insert into LAM_O_TABLE
(
    select rpad(a.fin_acc_num,16,' '),
-- v_Customer_Credit_Pref_Percent  CHAR(10)
            lpad(' ',10,' '),
-- v_Customer_Debit_Pref_Percent   CHAR(10)
            lpad(' ',10,' '),
-- v_Acct_ID_Credit_Pref_Percent   CHAR(10)
            lpad(' ',10,' '),
-- v_Acct_ID_Debit_Pref_Percent       CHAR(10)
            
			case when v5pf.v5rat is not null and v5pf.v5rat <> 0 then lpad(v5pf.v5rat,10,' ')
			when v5pf.v5rtm is not null and v5pf.v5rtm <> 0 then lpad(v5pf.v5rtm,10,' ') else lpad('0',10,' ') end,
-- v_Repricing_Plan           CHAR(1)
      rpad( case
         when tbaadm.LSP.upfront_int_loan_flg = 'Y' then 'F'
         else tbaadm.GSP.repricing_plan
         end,1,' '),
-- v_Pegging_Frequency_in_Months   CHAR(4)
            lpad(' ',4,' '),
-- v_Pegging_Frequency_in_Days       CHAR(3)
            lpad(' ',3,' '),
--   v_Interest_Route_Flag       CHAR(1)
            'L',
-- v_Acct_Currency_Code           CHAR(3)
            rpad(otpf.otccy,3,' '),
--   v_Sol_ID               CHAR(8)
            rpad(a.fin_sol_id,8,' '),
--   v_GL_Sub_Head_Code           CHAR(5)
            rpad(tbaadm.gss.gl_sub_head_code,5,' '),
--   v_Schm_Code             CHAR(5)
            rpad(a.schm_code,5,' '),
--   v_CIF_ID                 CHAR(32)
            rpad(a.fin_cif_id,32,' '),
--   v_Acct_Open_Date           CHAR(10)
      rpad(case
      when get_date_fm_btrv(otpf.otsdte) <> 'ERROR' then 
      to_char(to_date(get_date_fm_btrv(otpf.otsdte),'YYYYMMDD'),'DD-MM-YYYY')
      else ' ' end,10,' '),      
--   v_Sanction_Limit           CHAR(17)
       lpad(otdla/power(10,c8ced),17,' '),   
          --  lpad(to_number(abs(otpf.otdla2)/POWER(10,c8pf.C8CED)),17,' '),
--   v_Ledger_Number           CHAR(3)
            rpad(' ',3,' '),
--   v_Sector_Code           CHAR(5)KTWORKS
      case when convert_codes('SECTOR_CODE',SCSAC) is not null  then
      rpad(convert_codes('SECTOR_CODE',SCSAC),5,' ')
      else rpad(' ',5,' ') end,
--   v_Sub_Sector_Code           CHAR(5)KTWORKS
      case when convert_codes('SUBSECTOR_CODE',SCSAC) is not null then    
          rpad(convert_codes('SUBSECTOR_CODE',SCSAC),5,' ')
        else rpad(' ',5,' ')end  ,
-- v_Purpose_of_Advance           CHAR(5)
            rpad('99999',5,' '),
--  v_Nature_of_Advance           CHAR(5)
        rpad(' ',5,' '),
--   v_Free_Code_3           CHAR(5)
           rpad(' ',5,' ') ,
--  v_Sanction_Reference_Number       CHAR(25)
            rpad(' ',25,' '),
--   v_Sanction_Limit_Date       CHAR(10)
      rpad(case
      when get_date_fm_btrv(otpf.otsdte) <> 'ERROR' then 
      to_char(to_date(get_date_fm_btrv(otpf.otsdte),'YYYYMMDD'),'DD-MM-YYYY')
      else ' ' end,10,' ') ,
--   v_Sanction_Level_Code       CHAR(5)
            rpad('99999',5,' '),
--  v_Limit_Expiry_Date           CHAR(10)
      rpad(case
      when get_date_fm_btrv(otpf.otmdt) <> 'ERROR' then 
      to_char(to_date(get_date_fm_btrv(otpf.otmdt),'YYYYMMDD'),'DD-MM-YYYY')
      else ' ' end,10,' ') ,
--   v_Sanction_Authority_Code       CHAR(5)
            rpad('99999',5,' '),
--   v_Loan_Paper_Date           CHAR(10)
      rpad(case
      when get_date_fm_btrv(otpf.otsdte) <> 'ERROR' then 
      to_char(to_date(get_date_fm_btrv(otpf.otsdte),'YYYYMMDD'),'DD-MM-YYYY')
      else ' ' end,10,' ') ,  
--  v_Operative_Acct_ID           CHAR(16)
    --       rpad(case
    --       when tbaadm.LSP.dmd_satisfy_mthd in ('E','T','S') then get_oper_acc(map_acc.leg_acc_num)
    --       else ' '
    --       end,16,' '),
    --       rpad(' ',16,' '),
    rpad(oper.fin_acc_num,16,' '),
--   v_Operative_Currency_Code       CHAR(3)
    --      rpad(case
    --       when tbaadm.LSP.dmd_satisfy_mthd in ('E','T','S') then get_ompf_cur(map_acc.leg_acc_num)
    --       else ' '
    --       end,3,' '),
    --       rpad(' ',3,' '),
    rpad((oper.CURRENCY),3,' '),
--   v_Operative_Sol_ID           CHAR(8)
    --       rpad(case
    --       when tbaadm.LSP.dmd_satisfy_mthd in ('E','T','S') then get_oper_sol(map_acc.leg_acc_num)
    --       else ' '
    --       end,8,' '),
    --       rpad(' ',8,' '),
    rpad(oper.FIN_SOL_ID,8,' '),
--   v_Demand_Satisfy_Method       CHAR(1)
     -- case
     --     when tbaadm.LSP.dmd_satisfy_mthd in ('E','T','S') then 'N'
     --     else rpad(tbaadm.LSP.dmd_satisfy_mthd,1,' ') end,
--rpad(tbaadm.LSP.dmd_satisfy_mthd,1,' '),
    rpad('E',1,' '),
-- v_Lien_on_Operative_Acct_Flag   CHAR(1)
       rpad(tbaadm.LSP.lien_on_oper_Acct_flg,1,' '), 
-- v_Repayment_currency_rate_code  CHAR(5)
            rpad(' ',5,' '),
-- v_Interest_table_code       CHAR(5)
            rpad('ZEROL',5,' '),
-- v_Interest_on_principal_Flag       CHAR(1)
       rpad(tbaadm.LSP.int_on_p_flg,1,' '),
-- v_Penal_int_ovdue_princ_dmd_Fl CHAR(1)
       rpad(tbaadm.LSP.pi_on_pdmd_ovdu_flg,1,' '),
-- v_Princ_Dmd_Ovdue_end_month_Fl CHAR(1)
       rpad(tbaadm.LSP.pdmd_ovdu_eom_flg,1,' '),
--   v_Int_On_Int_Demand_Flag       CHAR(1)
         rpad(tbaadm.LSP.int_on_idmd_flg,1,' '),
-- v_penal_int_overdue_int_dmd_Fl CHAR(1)
         rpad(tbaadm.LSP.pi_on_idmd_ovdu_flg,1,' '),
-- v_Int_Demand_Ovdue_End_Mnth_Fl CHAR(1)
         rpad(tbaadm.LSP.idmd_ovdu_eom_flg,1,' '),
-- v_Transfer_Effective_Date       CHAR(10) ~!@
	rpad(to_char(to_date(get_param('EOD_DATE'),'YYYYMMDD'),'DD-MM-YYYY'),10,' '),   
-- v_Cumulative_Normal_int_am       CHAR(17)
            lpad(' ',17,' '),
--   v_Cumulative_penal_int_amt       CHAR(17)
            lpad(' ',17,' '),
-- v_cumulative_additional_int_am CHAR(17)
            lpad(' ',17,' '),
-- v_Liab_Transfer_Effective_date  CHAR(17)
             rpad(to_number(abs(otpf.otdla)/POWER(10,c8pf.C8CED)),17,' '),
-- v_Disbursement_Previous_Sche    CHAR(17)
         lpad(otdla/power(10,c8ced),17,' '),
       --     lpad(get_disb_prev(map_acc.leg_acc_num),17,' '),
       --   lpad(' ',17,' '),
-- v_Debit_Int_Calc_upto_date      CHAR(10)
    rpad(case 
             when v5pf.v5lcd <> 0 then
                  case 
                  when get_date_fm_btrv(v5pf.v5lcd) <> 'ERROR' then
                  to_char(to_date(get_date_fm_btrv(v5pf.v5lcd),'YYYYMMDD'),'DD-MM-YYYY')
                  end
             else 
                  case
                  when get_date_fm_btrv(otpf.otsdte) <> 'ERROR' then
                  to_char(to_date(get_date_fm_btrv(otpf.otsdte),'YYYYMMDD'),'DD-MM-YYYY')
                  end
             end,10,' '),
   --            rpad(' ',10,' '),
--   v_Repayment_Schedule_Date       CHAR(10) 
      rpad(case
      when get_date_fm_btrv(otpf.otsdte) <> 'ERROR' then 
      to_char(to_date(get_date_fm_btrv(otpf.otsdte),'YYYYMMDD'),'DD-MM-YYYY')
      else ' ' end,10,' ') ,
-- v_Repayment_Period_in_months       CHAR(3) KTWORKS change key_value to get_config
    case when floor(months_between(to_date(get_date_fm_btrv(v5mdt),'YYYYMMDD'),to_date(get_param('EOD_DATE'),'YYYYMMDD'))) > 0
    then rpad(floor(months_between(to_date(get_date_fm_btrv(v5mdt),'YYYYMMDD'),to_date(get_param('EOD_DATE'),'YYYYMMDD'))),3,' ')
    else rpad('1',3,' ') end,
        --rpad(get_reyp_perd(map_acc.leg_acc_num),3,' '),
    --  rpad(' ',3,' '),
--   v_Repayment_Period_in_Days       CHAR(3) KTWORKS change key_value to get_config
        lpad((round(30*(months_between(to_date(get_date_fm_btrv(v5mdt),'YYYYMMDD'),to_date(get_param('EOD_DATE'),'YYYYMMDD'))))
    - floor(months_between(to_date(get_date_fm_btrv(v5mdt),'YYYYMMDD'),to_date(get_param('EOD_DATE'),'YYYYMMDD')))),3,' '),
--    lpad(round(30*(MONTHS_BETWEEN(to_date(get_date_fm_btrv(v5mdt)),to_date(get_date_fm_btrv(get_param('EOD_DATE')))) - floor(MONTHS_BETWEEN(to_date(get_date_fm_btrv(v5mdt)),to_date(get_date_fm_btrv(get_param('EOD_DATE')))))),0),3,' '),
     --            lpad('0',3,' '),
--   v_Past_Due_Flag           CHAR(1)
            rpad(' ',1,' '),
--   v_Past_Due_Transfer_Date       CHAR(10)
            rpad(' ',10,' '),
-- v_Prv_To_Pd_GL_Sub_Head_Code       CHAR(5)
        --    rpad(tbaadm.gss.gl_sub_head_code,5,' '),
            rpad(' ',5,' '),
--   v_Interest_Suspense_Amount       CHAR(17)
            lpad(' ',17,' '),
-- v_Penal_Interest_Suspense_Amt   CHAR(17)
            lpad(' ',17,' '),
--   v_Charge_Off_Flag           CHAR(1)
            'N',
--   v_Charge_Off_Date           CHAR(10)
            rpad(' ',10,' '),
--   v_Charge_Off_Principle       CHAR(17)
            rpad(' ',17,' '),
--   v_Pending_Interest           CHAR(17)
            lpad(' ',17,' '),
-- v_Principal_Recovery           CHAR(17)
            lpad(' ',17,' '),
-- v_Interest_Recovery           CHAR(17)
            lpad(' ',17,' '),
-- v_source_dealer_code           CHAR(20)
            rpad(' ',20,' '),
--   v_Disburse_dealer_code       CHAR(20)
            rpad(' ',20,' '),
--   v_Apply_late_fee_Flag       CHAR(1)
            rpad(tbaadm.lsp.apply_late_fee_flg,1,' '),
-- v_Late_Fee_Grace_Period_Months  CHAR(3)
            lpad(' ',3,' '),
-- v_Late_Fee_Grace_Period_Days       CHAR(3)
            lpad(' ',3,' '),
-- v_Instal_amt_collect_upfront       CHAR(1)
            lpad(tbaadm.lsp.upfront_instlmnt_coll,1,' '),
-- v_Num_of_instal_collec_upfront  CHAR(2)
          lpad(' ',2,' '),
-- v_upfront_instalment_amount       CHAR(17)
          lpad(' ',17,' '),
--   v_Demand_Past_Due_counter       CHAR(5)
            rpad(' ',5,' '),
-- v_Sum_of_the_princ_demand_amt   CHAR(17)
         lpad(to_number(abs(otpf.otdla)/POWER(10,c8pf.C8CED)),17,' '),
         --  lpad(' ',17,' '),
--   v_Payoff_Flag           CHAR(1)
            'N',
-- v_ExcLd_for_Combined_Statement  CHAR(1)
            'Y',
--   v_Statement_CIF_ID           CHAR(32)
            rpad(' ',32,' '),
--   v_Transfer_Cycle_String       CHAR(45)
            rpad( '000000000000000000000000000000000000000000000',45,' '),
--   v_Bank_IRR_Rate           CHAR(8)
            lpad(' ',8,' '),
--   v_Value_Of_Asset           CHAR(17)
            lpad(' ',17,' '),
--   v_Occupation_code_customer       CHAR(5)
            rpad(' ',5,' '),
         -- rpad(map_cif.fin_cif_id,5,' '),
--   v_Borrower_category_code       CHAR(5)
            rpad(' ',5,' '),
--   v_Mode_of_the_advance       CHAR(5)
            rpad(' ',5,' '),
--   v_Type_of_the_advance       CHAR(5)
            rpad(' ',5,' '),
--   v_guarantee_coverage_Code       CHAR(5)
            rpad(' ',5,' '),
--   v_Industry_Type           CHAR(5)
            rpad(' ',5,' ') end,
--   v_Free_Code_1           CHAR(5)
            rpad(' ',5,' '),
--   v_Free_Code_2           CHAR(5)
           rpad(' ',5,' '),
--   v_Free_Code_4           CHAR(5)
            rpad(' ',5,' '),
--   v_Free_Code_5           CHAR(5)
            rpad(' ',5,' '),
--   v_Free_Code_6           CHAR(5)
            rpad(' ',5,' '),
--   v_Free_Code_7           CHAR(5)
            rpad(' ',5,' '),
--   v_Free_Code_8           CHAR(5)
             rpad(' ',5,' ') ,
--   v_Free_Code_9           CHAR(5)
            rpad(' ',5,' '),
--   v_Free_Code_10           CHAR(5)
            rpad(' ',5,' ') end,
-- v_Acct_Location_Code           CHAR(5)
--            rpad(a.fin_sol_id,5,' ')
rpad(' ',5, ' '),
-- v_credit_report_file_Ref_ID       CHAR(15)
            rpad(' ',15,' '),
-- v_DICGC_Fee_Percent           CHAR(8)
            lpad(' ',8,' '),
-- v_Last_Compound_Date           CHAR(10)KTWORKS change key_value to get_config
            case
                when tbaadm.LSP.int_on_idmd_flg ='Y' then 
                rpad(to_char(to_date(get_param('EOD_DATE'),'YYYYMMDD'),'DD-MM-YYYY'),10,' ') 
				else rpad(' ',10,' ')end,
-- v_Daily_Compound_Interest_Flag  CHAR(1)
            rpad(tbaadm.LSP.int_on_idmd_flg,1,' '),
-- v_CalculateOverdue_Int_rate_Fl  CHAR(1)
            rpad(' ',1,' '),
-- v_EI_paying_period_start_date   CHAR(10)
               rpad(case 
                  when v5pf.v5lcd <> 0 then
                       case 
                       when get_date_fm_btrv(v5pf.v5lcd) <> 'ERROR' then
                       to_char(to_date(get_date_fm_btrv(v5pf.v5lcd),'YYYYMMDD'),'DD-MM-YYYY')
                       end
                  else 
                       case
                       when get_date_fm_btrv(otpf.otsdte) <> 'ERROR' then
                       to_char(to_date(get_date_fm_btrv(otpf.otsdte),'YYYYMMDD'),'DD-MM-YYYY')
                       end
                  end
              ,10,' '),
        -- rpad(' ',10,' '),
-- v_EI_paying_period_end_date       CHAR(10)
         rpad(case
      when get_date_fm_btrv(otpf.otmdt) <> 'ERROR' then 
      to_char(to_date(get_date_fm_btrv(otpf.otmdt),'YYYYMMDD'),'DD-MM-YYYY')
      else ' ' end,10,' '),
       --      rpad(' ',10,' '),
--   v_IRR_Rate               CHAR(8)
            lpad(' ',8,' '),
--   v_Advance_interest_amount       CHAR(17)
            lpad(' ',17,' '),
--   v_Amortised_Amount           CHAR(17)
            lpad(' ',17,' '),
--   v_Debit_Booked_Upto_Date       CHAR(10)
 --        rpad(case
 --      when pack_mig_EQ3.get_date_fm_btrv(key_value) <> 'ERROR' then
 --      to_char(to_date(pack_mig_EQ3.get_date_fm_btrv(key_value),'DD/MM/YYYY'),'DD-MM-YYYY')
 --      else ' ' end,10,' '),   
            rpad(' ',10,' '),
-- v_Adv_Int_Collection_upto_Date  CHAR(10)
            rpad(' ',10,' '),
--   v_Accrual_Rate           CHAR(9)
            lpad(' ',9,' '),
-- v_Int_Rate_Sanction_Limit_Flg   CHAR(1)
           case
           when tbaadm.LSP.int_prod_method = 'S' then  'Y'
           else tbaadm.LSP.int_rate_based_on_sanct_lim
           end,
--   v_Interest_Rest_Frequency       CHAR(1) KTWORKS I will give you the map frequency function
            rpad(case
                 when v5pf.v5ifq is not null then mapfrequency(v5pf.v5ifq)
                 else 'M' 
                 END,1,' '),
        --    rpad(' ',1,' '),
--   v_Interest_Rest_Basis       CHAR(1)
            rpad('C',1,' '),
-- v_Charge_Route_Flag           CHAR(1)
            rpad(tbaadm.LSP.chrg_route_flg,1,' '),
--   v_Final_Disbursement_Flag       CHAR(1)
            'N',
-- v_Auto_Resch_after_Holiday_Prd  CHAR(1)
            rpad(' ',1,' '),
-- v_total_number_of_deferments       CHAR(2)
            lpad(' ',2,' '),
-- v_num_deferments_current_repay  CHAR(2)
            lpad(' ',2,' '),
--   v_End_Date               CHAR(10)
            rpad(' ',10,' '),
-- v_Penal_interest_on_Outstandin  CHAR(1)
         case
            when tbaadm.LSP.pi_on_pdmd_ovdu_flg = 'N' then ' '
            else tbaadm.LSP.pi_based_on_outstanding
            end,
--   v_Charge_off_type           CHAR(1)
            rpad(' ',1,' '),
-- v_Deferred_appli_int_rate_fl    CHAR(1)
            rpad(' ',1,' '),
--   v_Def_applicable_int_rate       CHAR(10)
            rpad(' ',10,' '),
--   v_Deferred_Interest_Amount       CHAR(17)
            lpad(' ',17,' '),
-- v_Auto_Reschedule_Not_Allowed   CHAR(1)
            case when tbaadm.LSP.auto_reshdl_not_allowed is not null then
            rpad( tbaadm.LSP.auto_reshdl_not_allowed,1,' ') else rpad(' ',1,' ')end,
-- v_Rescheduled_Overdue_Principa  CHAR(17)
            lpad(' ',17,' '),
-- v_Reschedule_Overdue_Interest   CHAR(17)
            lpad(' ',17,' '),
-- v_Loan_Type               CHAR(1)
          'N',
        --   case
        --   when ospf.oscanr = 'O' then 'O'
        --   else 'N' end,  
           --  lpad(' ',1,' '),
--   v_Pay_Off_Reason_Code       CHAR(5)
            rpad(' ',5,' '),
--   v_Related_Deposit_Acct_ID       CHAR(16)
            rpad(' ',16,' '),
-- v_Last_AckNowledgt_Dr_Prd_date  CHAR(10)
            rpad(' ',10,' '),
--   v_Refinance_Sanction_Date       CHAR(10)
            rpad(' ',10,' '),
--   v_Refinance_Amount           CHAR(17)
            lpad(' ',17,' '),
--   v_Subsidy_Acct_ID           CHAR(16)
            rpad(' ',16,' '),
--   v_Subsidy_Agency           CHAR(16)
            rpad(' ',16,' '),
--   v_Subsidy_Claimed_Date       CHAR(10)
            rpad(' ',10,' '),
--   v_Subsidy_Activity_Code       CHAR(10)
            rpad(' ',10,' '),
-- v_Debit_AckNowledgement_Type       CHAR(1)
            rpad(' ',1,' '),
-- v_Refinance_Sanction_Number       CHAR(25)
            rpad(' ',25,' '),
-- v_Refinance_Reference_Number       CHAR(25)
            rpad(' ',25,' '),
--   v_Refinance_Claimed_Date       CHAR(10)
            rpad(' ',10,' '),
--   v_Subsidy_Amount           CHAR(17)
            lpad(' ',17,' '),
--   v_Subsidy_Received_Date       CHAR(10)
            rpad(' ',10,' '),
--   v_Preprocess_Fee           CHAR(17)
            lpad(' ',17,' '),
--   v_Activity_Code           CHAR(6)
            rpad(' ',6,' '),
-- v_Probation_Period_in_Months       CHAR(3)
            lpad(' ',3,' '),
--   v_Probation_Period_in_Days       CHAR(3)
            lpad(' ',3,' '),
-- v_Compound_Rest_Indicator_Flag  CHAR(1)
            rpad(' ',1,' '),
--   v_Discounted_Int_Rate_Flag       CHAR(1)
            rpad(' ',1,' '),
--   v_Collect_Interest_Flag       CHAR(1)
            rpad(' ',1,' '),
--   v_Despatch_mode           CHAR(1)
            'A',
--   v_Acct_Manager           CHAR(15)
            rpad(' ',15,' '),
-- v_Mode_of_Oper_Code           CHAR(5)
            rpad('009',5,' '),
--   v_Statement_Frequency_Type       CHAR(1)
            'M',
-- v_Week_num_for_Statement_Date   CHAR(1)
            rpad(' ',1,' '),
-- v_Week_Day_for_Statement_Date   CHAR(1)
            rpad(' ',1,' '),
-- v_Week_Dt_for_Statement_Date       CHAR(2)
            '31',
-- v_Statement_Freq_case_of_Hldys  CHAR(1)
            'P',
--   v_Statement_of_the_Account       CHAR(1)
            'S',
--   v_Next_Print_date           CHAR(10)
            rpad(' ',10,' '),
-- v_Fixed_Rate_Term_in_Months       CHAR(3)
            lpad(' ',3,' '),
--   v_Fixed_Rate_Term_in_Days       CHAR(3)
            lpad(' ',3,' '),
-- v_Minimum_Int_Percent_Debit       CHAR(10)
            lpad(' ',10,' '),
-- v_Maximum_Int_Percent_Debit       CHAR(10)
            lpad(' ',10,' '),
--   v_Instalment_Income_Ratio       CHAR(9)
            lpad(' ',9,' '),
--   v_Product_Group           CHAR(5)
            rpad(' ',5,' '),
-- v_Free_Text               CHAR(240)
            rpad(' ',240,' '),
-- v_Linked_Account_ID           CHAR(16)
            rpad(' ',16,' '),
-- v_Delinquency_Resch_Method_Flg  CHAR(1)
            rpad(' ',1,' '),
-- v_Total_Number_of_Switch_Over   CHAR(3)
            lpad(' ',3,' '),
--   v_Non_Starter_Flag           CHAR(1)
            rpad(' ',1,' '),
-- v_Floating_Interest_Table_Code  CHAR(5)
            rpad(' ',5,' '),
-- v_Floating_Repricing_Frequency  CHAR(3)
            lpad(' ',3,' '),
-- v_Floating_Repricing_Freq_Days  CHAR(3)
            lpad(' ',3,' '),
-- v_Single_EMI_Turn_Over_Diff_Fl  CHAR(1)
            rpad(' ',1,' '),
--   v_IBAN_Number           CHAR(34)
            rpad(' ',34,' '),
--   v_IAS_CLASSIFICATION_CODE       CHAR(5)
            rpad(' ',5,' '),
--   v_Account_Number1           CHAR(16)
            rpad(' ',16,' '),
--   v_Type_of_top_up           CHAR(1)
            rpad(' ',1,' '),
-- v_Negotiated_Rate_Debit_Percen CHAR(10)
            lpad(' ',10,' '),
-- v_Normal_Int_Product_Method       CHAR(1)
            rpad(' ',1,' '),
-- v_Penal_Interest_Rate_Method       CHAR(1)
            rpad(' ',1,' '),
--   v_Penal_Interest_Method       CHAR(1)
            rpad(' ',1,' '),
-- v_hldy_prd_frm_first_disb_flg   CHAR(1)
            rpad(' ',1,' '),
--   v_EI_Scheme_Flag           CHAR(1)
            rpad(tbaadm.LSP.ei_schm_flg,1,' '),
-- v_EI_Method               CHAR(1)
            rpad(' ',1,' '),
--   v_Ei_Formula_Flag           CHAR(1)
            rpad(' ',1,' '),
-- v_Normal_Holiday_Period_in_Mnt CHAR(3)
            lpad(' ',3,' '),
-- v_Holiday_Period_Interest_Flag  CHAR(1)
            rpad(' ',1,' '),
-- v_Holiday_Period_Interest_Amt   CHAR(17)
            lpad(' ',17,' '),
-- v_Resche_by_Adjust_TeNor_Amt       CHAR(1)
            rpad(' ',1,' '),
-- v_Auto_Reschedule_every_Disb       CHAR(1)
            rpad(' ',1,' '),
-- v_Auto_Reschule_Int_Rate_Chang  CHAR(1)
            rpad(' ',1,' '),
-- v_Auto_Reschedule_Prepayment       CHAR(1)
            rpad(' ',1,' '),
--   v_Rescheduling_Amount_flag       CHAR(1)
            rpad(' ',1,' '),
-- v_Capitalize_Int_on_Rephasemen  CHAR(1)
            rpad(' ',1,' '),
-- v_Carry_over_Demands           CHAR(1)
            rpad(' ',1,' '),
-- v_Type_Instalment_Combination   CHAR(1)
            rpad(' ',1,' '),
-- v_Cap_Int_to_EMI_Flg           CHAR(1)
            rpad(' ',1,' '),
-- v_Deferred_Int_Due_to_EMI_Cap   CHAR(17)
            lpad(' ',17,' '),
--   v_Month_for_Deferment       CHAR(2)
            lpad(' ',2,' '),
--   v_Num_Months_Deferred       CHAR(2)
            lpad(' ',2,' '),
-- v_Channel_Credit_Pref_Percent   CHAR(10)
            lpad(' ',10,' '),
-- v_Channel_Debit_Pref_Percent       CHAR(10)
            lpad(' ',10,' '),
-- v_Channel_Id               CHAR(5)
            rpad(' ',5,' '),
-- v_Channel_Level_Code           CHAR(5)
            rpad(' ',5,' '),
-- v_Instalment_Effective_Flag       CHAR(1)
            rpad(' ',1,' '),
--   v_Notice_Period           CHAR(3)
            rpad(' ',3,' '),
--   v_Shift_Instalment_Flag       CHAR(1)
            rpad(' ',1,' '),
--   v_Include_Maturity_Date       CHAR(1)
            rpad(' ',1,' '),
-- v_Interest_Rule_Code           CHAR(5)
            rpad(' ',5,' '),
-- v_Cumulative_Capitalize_Fees       CHAR(17)
            lpad(' ',17,' '),
-- v_upfront_instalment_int_amoun  CHAR(17)
           lpad( ' ',17,' '),
      --      lpad(' ',17,' '),
--   v_Recall_Flag           CHAR(1)
            rpad(' ',1,' '),
--   v_Recall_Date           CHAR(10)
            rpad(' ',10,' '),
-- v_Diff_PS_Freq_For_Rel_Part       CHAR(1)
            rpad(' ',1,' '),
-- v_Diff_Swift_Freq_For_Rel_Part  CHAR(1)
            rpad(' ',1,' '),
-- v_Penal_Interest_table_code       CHAR(5)
            rpad(' ',5,' '),
-- v_Penal_Preferential_Percent       CHAR(10)
            lpad(' ',10,' '),
--   v_RA_ref_number           CHAR(16)
            rpad(' ',16,' '),
--   v_Interest_table_Version       CHAR(5)
            rpad(' ',5,' '),
--   v_Address_Type           CHAR(12)
            rpad(' ',12,' '),
-- v_Phone_Type               CHAR(12)
            rpad(' ',12,' '),
-- v_Email_Type               CHAR(12)
            rpad(' ',12,' '),
-- v_Accrued_Penal_Int_Recover       CHAR(17)
            lpad(' ',17,' '),
-- v_Penal_Interest_Recovery       CHAR(17)
            lpad(' ',17,' '),
-- v_Collection_Interest_Recovery  CHAR(17)
            lpad(' ',17,' '),
-- v_Collection_Penal_Int_Recover  CHAR(17)
            lpad(' ',17,' '),
--   v_Mark_Up_Applicable_Flag       CHAR(1)   
            rpad(' ',1,' '),
-- v_Pref_Calendar_base_processin CHAR(2)
            rpad(' ',2,' '),
-- v_Purchase_Reference           CHAR(12)
            rpad(' ',12,' '),
--  v_Frez_code               CHAR(1)
            rpad(' ',1,' '),
--   v_Frez_reason_code           CHAR(5)
            rpad(' ',5,' ')
  from map_acc a
 inner join v5pf on v5pf.v5brnm||v5pf.v5dlp||v5pf.v5dlr = a.leg_acc_num
 inner join map_acc oper on V5ABI||V5ANI||V5ASI = oper.leg_acc_num
 inner join tbaadm.lsp on tbaadm.lsp.schm_code = a.schm_code 
 inner join tbaadm.gsp on tbaadm.gsp.schm_code = a.schm_code
 inner join otpf on otpf.otbrnm||otpf.otdlp||otpf.otdlr = a.leg_acc_num
 inner join ospf on ospf.osbrnm||ospf.osdlp||ospf.osdlr = a.leg_acc_num
 inner join tbaadm.gss on tbaadm.gss.schm_code = a.schm_code
 inner join c8pf on c8ccy = otccy
 inner join scpf on scpf.scab|| scpf.scan ||scpf.scas = v5pf.V5ABD||v5pf.V5AND||v5pf.V5ASD
 where trim(a.schm_type)='LAA' and OSCANR is null
 and a.currency=tbaadm.lsp.crncy_code
 and tbaadm.gss.DEFAULT_FLG='Y'
 and tbaadm.gss.del_flg<>'Y'
); 

commit;
exit;