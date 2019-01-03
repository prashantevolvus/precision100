TRUNCATE TABLE SIU_O_TABLE;
INSERT INTO SIU_O_TABLE 
select
--INDICATOR CHAR(3 BYTE)
'SIU',
--SOL_ID CHAR(8 BYTE)
rpad(fin_sol_id,8,' '),
--SI_FREQ_TYPE CHAR(1 BYTE)
rpad(mapfrequency(VW_ACTIVE_SI.r5afr),1,' '), --RPAD(' ',1,' '),
--SI_FREQ_WEEK_NUM CHAR(1 BYTE)
RPAD(' ',1,' '),
--SI_FREQ_WEEK_DAY CHAR(1 BYTE)
RPAD(' ',1,' '),
--SI_FREQ_START_DD CHAR(2 BYTE)
substr(VW_ACTIVE_SI.r5afr,2,2),
--LPAD(' ',2,' '),
--SI_FREQ_HLDY_STAT CHAR(1 BYTE)
'N',
--RPAD(' ',1,' '),
--SI_EXECUTION_CODE CHAR(1 BYTE)
'B',
--RPAD(' ',1,' '),
--SI_END_DATE CHAR(8 BYTE)
   case
     when VW_ACTIVE_SI.r5fld = 9999999 then '20991231'
	 when get_date_fm_btrv(VW_ACTIVE_SI.r5fld) <> 'ERROR' 
then get_date_fm_btrv(VW_ACTIVE_SI.r5fld)
     end,
--RPAD(VW_ACTIVE_SI.r5fld,8,' '),
--SI_NEXT_EXECUTION_DATE CHAR(8 BYTE)
     case
     when get_date_fm_btrv(VW_ACTIVE_SI.r5npr) <> 'ERROR' 
then
get_date_fm_btrv(VW_ACTIVE_SI.r5npr)
     end,
--RPAD(' ',8,' '),
--TARGET_ACCOUNT CHAR(16 BYTE)
LPAD(' ',16,' '), --LPAD(' ',16,' '),
--BALANCE_INDICATOR CHAR(1 BYTE)
RPAD(' ',1,' '),
--EXCESS_SHORT_INDICATOR CHAR(1 BYTE)
RPAD(' ',1,' '),
--TARGET_BALANCE CHAR(17 BYTE)
LPAD(' ',17,' '),
--AUTO_POST_FLAG CHAR(1 BYTE)
'Y',
--RPAD(' ',1,' '),
--CARRY_FORWARD_ALLOWED_FLAG CHAR(1 BYTE) 'Y', --RPAD(' ',1,' '),
--VALIDATE_CRNCY_HOLIDAY_FLAG CHAR(1 BYTE) 'N', --RPAD(' ',1,' '),
--DELETE_TRN_IF_NOT_POSTED CHAR(1 BYTE)
'Y',
'N',
'Y',
--RPAD(' ',1,' '),
--CARRY_FORWARD_LIMIT CHAR(5 BYTE)
LPAD('3',5,' '),
--SI_CLASS CHAR(1 BYTE)
'C',
--RPAD(' ',1,' '),
--CIF_ID CHAR(32 BYTE)
RPAD(fin_cif_id,32,' '),
--RPAD(' ',32,' '),
--REMARKS CHAR(50 BYTE)
RPAD(' ',50,' '),
--CLOSURE_REMARKS CHAR(50 BYTE)
RPAD(' ',50,' '),
--EXECUTION_CHARGE_CODE CHAR(25 BYTE)
RPAD(' ',25,' '),
--FAILURE_CHARGE_CODE CHAR(25 BYTE)
RPAD(' ',25,' '),
--CHARGE_RATE_CODE CHAR(5 BYTE)
RPAD(' ',5,' '),
--CHARGE_DEBIT_ACCOUNT_NUMBER CHAR(16 BYTE) RPAD(' ',16,' '),
--AMOUNT_INDICATOR CHAR(1 BYTE)
LPAD(fund_account,16,' '),--missed
'F',
--RPAD(' ',1,' '),
--CREATE_MEMO_PAD_ENTRY CHAR(1 BYTE)
'N',
--RPAD(' ',1,' '),
--CURRENCY_CODE CHAR(3 BYTE)
RPAD(C8CCY,3,' '),
--RPAD(' ',3,' '),
--FIXED_AMOUNT CHAR(17 BYTE)
lpad(abs(to_number(VW_ACTIVE_SI.r5rpa)/POWER(10,c8pf.C8CED)),17,' '), --LPAD(' ',17,' '),
--PART_TRAN_TYPE CHAR(1 BYTE)
'D',
--RPAD(' ',1,' '),
--BALANCE_INDICATOR1 CHAR(1 BYTE)
' ',
--RPAD(' ',1,' '),
--EXCESS_SHORT_INDICATOR1 CHAR(1 BYTE)
RPAD(' ',1,' '),
--ACCOUNT_NUMBER CHAR(16 BYTE)
RPAD(' ',16,' '), --RPAD(' ',16,' '),--removed fund_acc
--ACCOUNT_BALANCE CHAR(17 BYTE)
LPAD(' ',17,' '),
--PERCENTAGE CHAR(8 BYTE)
LPAD(' ',8,' '),
--AMOUNT_MULTIPLE CHAR(17 BYTE)
LPAD(' ',17,' '),
--ADM_ACCOUNT_NO CHAR(16 BYTE)
RPAD(fund_account,16,' '), --RPAD(' ',16,' '),
--ROUND_OFF_TYPE CHAR(1 BYTE)
RPAD(' ',1,' '),
--ROUND_OFF_VALUE CHAR(17 BYTE)
LPAD(' ',17,' '),
--COLLECT_CHARGES CHAR(1 BYTE)
'N',
--RPAD(' ',1,' '),
--REPORT_CODE CHAR(5 BYTE)
RPAD(' ',5,' '),
--REFERENCE_NUMBER CHAR(20 BYTE)
RPAD(' ',20,' '),
--TRAN_PARTICULAR CHAR(50 BYTE)
RPAD(' ',50,' '),
--TRAN_REMARKS CHAR(30 BYTE)
RPAD(' ',30,' '),
--INTENT_CODE CHAR(5 BYTE)
RPAD(' ',5,' '),
--DD_PAYABLE_BANK_CODE CHAR(6 BYTE)
RPAD(' ',6,' '),
--DD_PAYABLE_BRANCH_CODE CHAR(6 BYTE)
RPAD(' ',6,' '),
--PAYEE_NAME CHAR(80 BYTE)
RPAD(' ',80,' '),
--PURCHASE_ACCOUNT_NUMBER CHAR(16 BYTE)
RPAD(' ',16,' '),
--PURCHASE_NAME CHAR(80 BYTE)
RPAD(' ',80,' '),
--CR_ADV_PYMNT_FLG CHAR(1 BYTE)
RPAD(' ',1,' '),
--AMOUNT_INDICATOR1 CHAR(1 BYTE)
'F',
--RPAD(' ',1,' '),
--CREATE_MEMO_PAD_ENTRY1 CHAR(1 BYTE)
'N',
--RPAD(' ',1,' '),
--ADM_ACCOUNT_NO1 CHAR(16 BYTE)
RPAD(recv_account,16,' '), --RPAD(' ',16,' '),
--ROUND_OFF_TYPE1 CHAR(1 BYTE)
RPAD(' ',1,' '),
--SPACE CHAR(1 BYTE)
' ',
--RPAD(' ',1,' '),
--ROUND_OFF_VALUE1 CHAR(17 BYTE)
LPAD(' ',17,' '),
--COLLECT_CHARGES1 CHAR(1 BYTE)
'N',
--RPAD(' ',1,' '),
--REPORT_CODE1 CHAR(5 BYTE)
RPAD(' ',5,' '),
--REFERENCE_NUMBER1 CHAR(20 BYTE)
RPAD(' ',20,' '),
--TRAN_PARTICULAR1 CHAR(50 BYTE)
RPAD(' ',50,' '),
--TRAN_REMARKS1 CHAR(30 BYTE)
RPAD(' ',30,' '),
--INTENT_CODE1 CHAR(5 BYTE)
RPAD(' ',5,' '),
--SI_PRIORITY CHAR(3 BYTE)
RPAD(' ',3,' '),
--SI_FREQ_CAL_BASE CHAR(2 BYTE)
'00',
--RPAD(' ',2,' '),
--CR_CEILING_AMT CHAR(17 BYTE)
LPAD(' ',17,' '),
--CR_CULATIVE_AMT CHAR(17 BYTE)
LPAD(' ',17,' '),
--DR_CEILING_AMT CHAR(17 BYTE)
LPAD(' ',17,' '),
--DR_CUMULATIVE_AMT CHAR(17 BYTE)
LPAD(' ',17,' ')
from VW_ACTIVE_SI
inner join c8pf on c8ccyN = VW_ACTIVE_SI.r5ccy
inner join map_cif on TRIM(leg_cust_number) = TRIM(r5an);
COMMIT;
exit;
