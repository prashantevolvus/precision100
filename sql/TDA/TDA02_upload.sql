-- File Name		: balance.sql

-- File Created for	: Upload file for balance

-- Created By		: Ashok Kumar.S

-- Client		: ENBD

-- Created On		: 01-11-2011
-------------------------------------------------------------------
truncate table TDMASTERPLACEMENTS_O_TABLE;
insert into TDMASTERPLACEMENTS_O_TABLE 
select 
--       V_INDICATOR CHAR(3)
rpad('TAM',3,' '),
--       V_EMPLOYEE_ID CHAR(9)
rpad(' ',9,' '),
--       V_CUSTOMER_CREDIT_PREF_PERCENT CHAR(10)
lpad(' ',10,' '),
--       V_CUSTOMER_DEBIT_PREF_PERCENT CHAR(10)
lpad(' ',10,' '),
--       V_ACCOUNT_CREDIT_PREF_PERCENT CHAR(10)
lpad(to_char(case when d5pf.d5dte = 9999999 then d5pf.d5drar
else 0
end),10,' '),
--       V_ACCOUNT_DEBIT_PREF_PERCENT CHAR(10)
lpad('0',10,' '),
--       V_CHANNEL_CREDIT_PREF_PERCENT CHAR(10)
lpad('0',10,' '),
--       V_CHANNEL_DEBIT_PREF_PERCENT CHAR(10)
lpad('0',10,' '),
--       V_PEGGED_FLAG CHAR(1)
rpad('N',1,' '),
--       V_PEG_FREQUENCY_IN_MONTHS CHAR(4)
lpad(' ',4,' '),
--       V_PEG_FREQUENCY_IN_DAYS CHAR(3)
lpad(' ',3,' '),
--       V_SULABH_FLG CHAR(1)
rpad('N',1,' '),
--       V_INTEREST_ACCRUAL_FLAG CHAR(1)
rpad('Y',1,' '),
--       V_PASSBOOK_SHEET_RECEIPT_IND CHAR(1)
rpad('N',1,' '),
--       V_WITH_HOLDNG_TAX_AMT_SCOPE_FLG CHAR(1)
' ', 
--       V_WITH_HOLDING_TAX_FLAG CHAR(1)
'N', -- For NRO deposits set this W
--       V_SAFE_CUSTODY_FLAG CHAR(1)
rpad('N',1,' '),
--       V_CASH_EXCP_AMOUNT_LIMIT CHAR(17)
lpad(' ',17,' '),
--       V_CLEARING_EXCP_AMOUNT_LIMIT CHAR(17)
lpad(' ',17,' '),
--       V_TRANSFER_EXCP_AMOUNT_LIMIT CHAR(17)
lpad(' ',17,' '),
--       V_CASH_CR_EXCP_AMT_LIM CHAR(17)
lpad(' ',17,' '),
--       V_CLEARING_CR_EXCP_AMT_LIM CHAR(17)
lpad(' ',17,' '),
--       V_TRANSFER_CR_EXCP_AMT_LIM CHAR(17)
lpad(' ',17,' '),
--       V_DEPOSIT_ACCOUNT_NUMBER CHAR(16)
rpad(map_acc.fin_acc_num,16,' '),
--       V_CURRENCY_CODE CHAR(3)
rpad(map_acc.currency,3,' '),
--       V_SOL_ID CHAR(8)
rpad(map_acc.fin_sol_id,8,' '),
--       V_GL_SUB_HEAD_CODE CHAR(5)
rpad(gss.gl_sub_head_code,5,' '),
--       V_SCHEME_CODE CHAR(5)
rpad(map_acc.schm_code,5,' '),
--       V_CIF_ID CHAR(32)
rpad(CASE WHEN map_cif.fin_cif_id IS NOT NULL THEN map_cif.fin_cif_id
ELSE ' ' END,32,' '), 
--       V_DEPOSIT_AMOUNT CHAR(17)   --DO_IT_AGAIN
lpad( CASE 
            WHEN 
TO_CHAR(TO_number(VW_DEP_MASTER_EXT.DEAL_OPEN_BAL)/power(10,c8pf.c8ced)) 
IS NOT NULL THEN
TO_CHAR(to_number(VW_DEP_MASTER_EXT.DEAL_OPEN_BAL)/power(10,c8pf.c8ced)) 
ELSE ' ' END
,17,' '),
--       V_DEPOSIT_PERIOD_MONTHS CHAR(3)
lpad(' ',3,' '),
--       V_DEPOSIT_PERIOD_DAYS CHAR(3)
lpad(' ',3,' '),
--       V_INTEREST_TABLE_CODE CHAR(5)
rpad('ZERO',5,' '),
--       V_MODE_OF_OPERATION CHAR(5)
rpad('009',5,' '),  -- it was SINGL , but on 23-02-2012 ashok asked to change to 009
--       V_ACCOUNT_LOCATION_CODE CHAR(5)
rpad(' ',5,' '),
--       V_AUTO_RENEWAL_FLAG CHAR(1)
rpad(case when v5pf.v5nrd=9999999 then 'Y'
else 'N'
end,1,' '),
--       V_PRD_IN_MNTHS_FOR_AUTO_RENEWAL CHAR(3)
lpad( case when jrpf.jrddy = 'M' and v5pf.v5nrd = 9999999 then 
jrpf.jrnum 
else 0
end,3,' '),  
--       V_PRD_IN_DAYS_FOR_AUTO_RENEWAL CHAR(3)
lpad(case when jrpf.jrddy = 'D' and v5pf.v5nrd=9999999 then jrpf.jrnum
else 0
end,3,' '), 
--       V_ACCOUNT_OPEN_DATE CHAR(8)
rpad(case 
     when get_date_fm_btrv(OTPF.OTSDTE)<> 'ERROR' then get_date_fm_btrv(OTPF.OTSDTE)
     else ' '
     end,8,' '),
--       V_OPEN_EFFECTIVE_DATE CHAR(8)     
rpad(case 
      when get_date_fm_btrv(deal_open_date)<> 'ERROR' then get_date_fm_btrv(deal_open_date)
      else ' '
      end,8,' '),
--       V_NOMINEE_PRINT_FLAG CHAR(1)
rpad('Y',1,' '),
--       V_PRINTING_FLAG CHAR(1)
rpad('Y',1,' '),
--       V_LEDGER_NUMBER CHAR(3)
rpad(' ',3,' '),
--       V_LAST_CREDIT_INT_POSTED_DATE CHAR(8)  
rpad(case 
      when get_date_fm_btrv(V5PF.v5lcd)<> 'ERROR' then get_date_fm_btrv(V5PF.v5lcd)
      else 
      get_date_fm_btrv(get_param('CYYMMDD'))
      end,8,' '),
--       V_LAST_CREDIT_INT_RUN_DATE CHAR(8)
rpad(
case when get_date_fm_btrv(V5PF.v5lcd)<> 'ERROR' then get_date_fm_btrv(V5PF.v5lcd)
  else 
get_date_fm_btrv(get_param('CYYMMDD'))
end
,8,' '),
--       V_LAST_INTEREST_PROVISION_DATE CHAR(8)
rpad(' ',8,' '),
--       V_PRINTED_DATE CHAR(8)
rpad(case 
      when get_date_fm_btrv(deal_open_date)<> 'ERROR' then get_date_fm_btrv(deal_open_date)
      else ' '
      end,8,' '),
--       V_CUMULATIVE_INTEREST_PAID CHAR(17)   
lpad(case 
      when v5abd||v5and||v5asd <> v5abi||v5ani||v5asi then 
to_number(vw_dep_master_ext.int_posted)/power(10,c8pf.c8ced)
      else 0
      end,17,' '),
--       V_CUMULATIVE_INTEREST_CREDITED CHAR(17)  
lpad(CASE WHEN 
TO_CHAR(to_numbeR(VW_DEP_MASTER_EXT.INT_POSTED)/power(10,c8pf.c8ced)) 
IS NOT NULL THEN 
TO_CHAR(to_numbeR(VW_DEP_MASTER_EXT.INT_POSTED)/power(10,c8pf.c8ced))
            ELSE ' ' END    
            ,17,' '),
--       V_CUMULATIVE_INSTALLMENTS_PAID CHAR(17)
lpad( case 
            when 
to_char(to_numbeR(VW_DEP_MASTER_EXT.DEAL_OPEN_BAL)/power(10,c8pf.c8ced)) 
is not null then
to_char(to_numbeR(VW_DEP_MASTER_EXT.DEAL_OPEN_BAL)/power(10,c8pf.c8ced))
             ELSE ' ' END     
      ,17,' '),  
--       V_MATURITY_AMOUNT CHAR(17)  
lpad(CASE 
      WHEN  TO_CHAR(to_number(V5PF.V5BAL + 
V5PF.V5AM2)/power(10,c8pf.c8ced)) IS NOT NULL THEN
TO_CHAR(to_numbeR(VW_DEP_MASTER_EXT.INT_POSTED)/power(10,c8pf.c8ced))
      ELSE ' ' END
,17,' '),
--       V_OPERATIVE_ACCOUNT_NUMBER CHAR(16)
case when capitalised_flg = 'N' then rpad(get_oper_acc_v5(v5abi||v5ani||v5asi),16,' ')
else rpad(' ',16,' ')end,
--rpad(' ',16,' '),
--       V_OPERATIVE_ACCOUNT_CRNCY_CODE CHAR(3) 
      rpad(case when trim(get_oper_acc_v5(v5abi||v5ani||v5asi)) is not null 
then  get_oper_cur_v5(v5abi||v5ani||v5asi)
              else ' '
           end,3,' '),
--       V_OPERATIVE_ACCOUNT_SOL CHAR(8)
   rpad(case when trim(get_oper_acc_v5(v5abi||v5ani||v5asi)) is not null 
then  get_oper_sol_v5(v5abi||v5ani||v5asi)
              else ' '
           end,8,' '),
--       V_NOTICE_PRD_MNTS_FORNOTICE_DEP CHAR(3)
lpad('0',3,' '),
--       V_NOTICE_PRD_DAYS_FORNOTICE_DEP CHAR(3)
lpad('0',3,' '),
--       V_NOTICE_DATE CHAR(8)
lpad(' ',8,' '),
--       V_STAMP_DUTY_BORNE_BY_CUST CHAR(1)
lpad(' ',1,' '),
--       V_STAMP_DUTY_AMOUNT CHAR(17)
lpad(' ',17,' '),
--       V_STAMP_DUTY_AMOUNT_CRNCY_CODE CHAR(3)
lpad(' ',3,' '),
--       V_ORIGINAL_DEPOSIT_AMT CHAR(17)   
lpad( 
CASE 
WHEN TO_CHAR(VW_DEP_MASTER_EXT.DEAL_OPEN_BAL/power(10,c8pf.c8ced)) IS 
NOT NULL  THEN 
      TO_CHAR(VW_DEP_MASTER_EXT.DEAL_OPEN_BAL/power(10,c8pf.c8ced))
ELSE ' ' END
,17,' '),
--       V_ABSOLUTE_RATE_OF_INTEREST CHAR(8)
lpad(
CASE WHEN TO_CHAR(V5PF.v5rat) IS NOT NULL THEN 
      to_char(V5PF.v5rat,'990.00000')
  ELSE ' ' END 
,8,' '),
--       V_EXCLUDE_FOR_COMBINED_STMNT CHAR(1)
rpad(' ',1,' '),
--       V_STATEMENT_CIF_ID CHAR(32)
rpad(' ',32,' '),
--       V_MATURITY_DATE CHAR(8)
rpad(
case when V5PF.V5MDT = '9999999' then  get_date_fm_btrv(V5PF.V5NCD)
when get_date_fm_btrv(V5PF.V5MDT) <>'ERROR' then get_date_fm_btrv(V5PF.V5MDT)
  else ' '
      end,8,' '),   -- 193404 dates are improper @  v5pf.v5dmt
--       V_TREASURY_RATE_MOR CHAR(8)
lpad(' ',8,' '),
--       V_RENEWAL_OPTION CHAR(1)
lpad('M',1,' '),
--       V_RENEWAL_AMOUNT CHAR(17)
lpad(' ',17,' '),
--       V_ADDITIONAL_AMT CHAR(17)
lpad(' ',17,' '),
--       V_ADDNL_AMT_CRNCY CHAR(3)
lpad(' ',3,' '),
--       V_RENEWAL_CRNCY CHAR(3)
     case 
     when v5pf.v5nrd = 9999999 then lpad(V5PF.v5ccy,3,' ')
     else lpad(' ',3,' ')
     end,
--       V_ADDITIONAL_SOURCE_ACCOUNT CHAR(16)
rpad(' ',16,' '),
--       V_ADITIONAL_SRC_ACCT_CRNCY_CODE CHAR(3)
lpad(' ',3,' '),
--       V_ADDITIONAL_AC_SOL_ID CHAR(8)
rpad(' ',8,' '),
--       V_ADDITIONAL_RATE_CODE CHAR(5)
rpad(' ',5,' '),
--       V_RENEWAL_RATE_CODE CHAR(5)
rpad(' ',5,' '),
--       V_ADDITIONAL_RATE CHAR(8)
lpad(' ',8,' '),
--       V_RENEWAL_RATE CHAR(8)
lpad(' ',8,' '),
--       V_LINK_OPERATIVE_ACCOUNT CHAR(16)
rpad(' ',16,' '),
--       V_BREAK_IN_STEPS_OF CHAR(17)
lpad(' ',17,' '),
--       V_WTAX_LEVEL_FLG CHAR(1)   
' ',
--       V_WTAX_PCNT CHAR(8)  
lpad(' ',8,' '),
--       V_WTAX_FLOOR_LIMIT CHAR(17)
lpad(' ',17,' '),
--       V_IBAN_NUMBER CHAR(34)
rpad(' ',34,' '),
--       V_IAS_CODE CHAR(5)
rpad(' ',5,' '),
--       V_CHANNEL_ID CHAR(5)
rpad(' ',5,' '),
--       V_CHANNEL_LEVEL_CODE CHAR(5)
rpad(' ',5,' '),
--       V_MASTER_ACCT_NUM CHAR(16)
rpad(' ',16,' '),
--       V_ACCT_STATUS CHAR(1)
rpad('A',1,' '),
--       V_ACCT_STATUS_DATE CHAR(8)
rpad(' ',8,' '),
--       V_DUMMY CHAR(100)
rpad(' ',100,' '),
--       V_PS_DIFF_FREQ_REL_PARTY_FLG CHAR(1)
rpad(' ',1,' '),
--       V_SWIFT_DIFF_FREQ_REL_PARTY_FLG CHAR(1)
rpad(' ',1,' '),
--       V_FIXED_INSTAL_AMT_AMT_TOPUP CHAR(17)     
lpad(' ',17,' '),
--       V_NORMAL_INSTALLMENT_PERCENTAGE CHAR(10)
lpad(' ',10,' '),
--       V_INSTALLMENT_BASIS CHAR(1)
rpad('F',1,' '),
--       V_MAX_MISSED_CONTRIBUT_ALLOWED CHAR(3)  
lpad(' ',3,' '),
--       V_AUTO_CLOSURE_OF_IRREGULAR_ACT CHAR(1) 
rpad(' ',1,' '),
--       V_TOTAL_NUM_OF_MISSED_CONTRIBUT CHAR(3)
lpad(' ',3,' '),
--       V_ACCOUNT_IRREGULAR_STATUS CHAR(1)
rpad('N',1,' '),
--       V_ACCOUNT_IRREGULAR_STATUS_DATE CHAR(8)
rpad(' ',8,' '),
--       V_CUMULATIVE_NORMAL_INSTAL_PAID CHAR(17)    
lpad('0',17,' '),
--       V_CUMULATIVE_INITIAL_DEP_PAID CHAR(17)      
lpad('0',17,' '),
--       V_CUMULATIVE_TOP_UP_PAID CHAR(17)
lpad(' ',17,' '),
--       V_AUTOCLOSURE_ZERO_BAL_ACCT_MNTS CHAR(3)
lpad('0',3,' '),
--       V_AUTOCLOSURE_ZERO_BAL_ACCT_DAYS CHAR(3)
lpad('0',3,' '), 
--       V_LAST_BONUS_RUN_DATE CHAR(8)
lpad(' ',8,' '),
--       V_LAST_CALCULATED_BONUS_AMOUNT CHAR(17)
lpad(' ',17,' '),
--       V_BONUS_UP_TO_DATE CHAR(17)
lpad(' ',17,' '),
--       V_NEXT_BONUS_RUN_DATE CHAR(8)
lpad(' ',8,' '),
--       V_NORMAL_INT_PAID_TILLLAST_BONUS CHAR(17)
lpad(' ',17,' '),
--       V_BONUS_CYCLE CHAR(3)
lpad(' ',3,' '),
--       V_LAST_CALC_BONUS_PERCENTAGE CHAR(10)
lpad(' ',10,' '),
--       V_PENALTY_AMOUNT CHAR(17)
lpad(' ',17,' '),
--       V_PENALTY_CHARGE_EVENT_ID CHAR(25)
lpad(' ',25,' '),
--       V_ADDRESS_TYPE CHAR(12)
lpad(' ',12,' '),
--       V_PHONE_TYPE CHAR(12)
lpad(' ',12,' '),
--       V_EMAIL_TYPE CHAR(12)
lpad(' ',12,' '),
--       V_LOCAL_DEPOSIT_PERIOD_MONTHS CHAR(3)
lpad(' ',3,' '),
--       V_LOCAL_DEPOSIT_PERIOD_DAYS CHAR(3)
lpad(' ',3,' '),
--       V_IS_ACCOUNT_HEDGED_FLAG CHAR(1)
rpad(' ',1,' '),
--       V_USED_FOR_NETTING_OFF_FLAG CHAR(1)
rpad(' ',1,' ')
from   map_acc  
inner join VW_DEP_MASTER_EXT on VW_DEP_MASTER_EXT.leg_acc_num = map_acc.leg_acc_num
inner join v5pf on   v5pf.v5brnm||v5pf.v5dlp||v5pf.v5dlr = map_acc.leg_acc_num 
inner join (select * from tbaadm.gss where del_flg = 'N' and default_flg = 'Y')gss on gss.schm_code= map_acc.schm_code
left join (select * from d5pf where d5dte = 9999999)d5pf on d5pf.d5drr = v5pf.v5drr   
inner join jrpf on jrpf.jrprc =v5pf.v5prc   
inner join otpf on otpf.otbrnm || otpf.otdlp || otpf.otdlr = map_acc.leg_acc_num 
inner join scpf on scpf.scab || scpf.scan || scpf.scas = v5pf.v5abD||v5pf.v5anD||v5pf.v5asD
inner join ospf on ospf.osbrnm||ospf.osdlp||ospf.osdlr = map_acc.leg_acc_num
inner  join map_cif on map_cif.leg_cust_number  = ospf.oscus
inner join c8pf on c8pf.c8ccy = scpf.scccy
inner join gfpf on gfpf.gfcpnc = map_cif.leg_cust_number;
COMMIT;
exit;