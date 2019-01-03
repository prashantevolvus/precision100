-- File Name		: balance.sql

-- File Created for	: Upload file for balance

-- Created By		: Ashok Kumar.S

-- Client		: ENBD

-- Created On		: 01-11-2011
-------------------------------------------------------------------
truncate table AC1SBCA_O_TABLE;

insert into AC1SBCA_O_TABLE 
select 
--   v_Indicator              CHAR(3)
'AC1',
--   v_Account_Number             CHAR(16)
            lpad(fin_acc_num,16,' '),
--   v_With_holding_tax_flg        CHAR(1)
            rpad('N',1,' '),
--Withholding tax Amount scope flag
            lpad(' ',1,' '),
--   v_With_holding_tax_percent        CHAR(8)
            lpad(' ',8,' '),
--   v_With_holding_tax_floor_limit    CHAR(17)
            lpad(' ',17,' '),
--   v_CIF_ID                 CHAR(32)
            rpad(fin_cif_id,32,' '),
--   v_Customer_Cr_Pref_Percent        CHAR(10)
            lpad(' ',10,' '),
--   v_Customer_Dr_Pref_Percent        CHAR(10)
            lpad(' ',10,' '),
--   v_Account_Cr_Pref_Percent         CHAR(10)
            lpad(to_number(nvl(crdiff.D5DRAR,0) + nvl(crbase.D4BRAR,0) + nvl(s5ratc,0) + nvl(S5RTMC,0)),10,' '),
--   v_Account_Dr_Pref_Percent        CHAR(10)
            lpad(to_number(nvl(drdiff.D5DRAR,0) + nvl(drbase.D4BRAR,0) + nvl(s5ratd,0) + nvl(S5RTMD,0)),10,' '),
--   v_Channel_Cr_Pref             CHAR(10)
            lpad('0',10,' '),
--   v_Channel_Dr_Pref             CHAR(10)
            lpad('0',10,' '),
--   v_Pegged_Flag             CHAR(1)
            'N',
--   v_Peg_Frequency_in_Mnth        CHAR(4)
            lpad(' ',4,' '),
--   v_Peg_Frequency_in_Days        CHAR(3)
            lpad(' ',3,' '),
--   v_Int_freq_type_Credit        CHAR(1) -- ~!@ Need to work on not null cond
    case when S5IFQC is null then ' '
    else ' '
    end,
--   v_Int_freq_week_num_Credit        CHAR(1)
            lpad(' ',1,' '),
--   v_Int_freq_week_day_Credit        CHAR(1)
            lpad(' ',1,' '),
--   v_Int_freq_start_dd_Credit        CHAR(2)
            lpad(' ',2,' '),
--  v_Int_freq_hldy_stat_Credit        CHAR(1)
    ' ',
--  v_Next_Cr_interest_run_date        CHAR(8)
       lpad(' ',8,' '),
--   v_Int_freq_type_Debit        CHAR(1)
     case when S5IFQD is null then ' '
        else ' '
     end,
--   v_Int_freq_week_num_Debit        CHAR(1)
            lpad(' ',1,' '),
--   v_Int_freq_week_day_Debit        CHAR(1)
            lpad(' ',1,' '),
--   v_Int_freq_start_dd_Debit        CHAR(2)
            lpad(' ',2,' '),
--   v_Int_freq_hldy_stat_Debit        CHAR(1)
            ' ',
-- v_Next_Debit_interest_run_dt        CHAR(8)
            lpad(' ',8,' '),
--   v_Ledger_Number            CHAR(3)
            lpad(' ',3,' '),
--   v_Employee_Id            CHAR(10)
            lpad(' ',10,' '),
--  v_Account_Open_Date            CHAR(8)
    case when scoad <> 0 and get_date_fm_btrv(scoad) <> 'ERROR' then
           lpad(get_date_fm_btrv(scoad),8,' ')
        else lpad(' ',8,' ')
    end,
--   v_Mode_of_Operation_Code        CHAR(5)
            lpad(' ',5,' '),
--   v_Gl_Sub_Head_Code            CHAR(5)
            lpad(GL_SUB_HEADCODE,5,' '),
--   v_Scheme_Code             CHAR(5)
            lpad(SCHM_CODE,5,' '),
--   v_Cheque_Allowed_Flag        CHAR(1)
            case when SCAI93 = 'Y' then 'N'
            else 'Y'
            end,
--  v_Pass_Book_Pass_Sheet_Code        CHAR(1)
            'N',
--   v_Freeze_Code             CHAR(1)
      case
         when scai17 = 'Y' then 'T'
         when scai11 = 'Y' then 'C'
         when scai12 = 'Y' then 'D'
           else ' ' end,
-- v_Freeze_Reason_Code             CHAR(5)
      case
         when scai17 = 'Y' or scai11 = 'Y'  or scai12 = 'Y' then rpad('999',5,' ')
         else rpad(' ',5,' ') end,
--  v_Free_Text                 CHAR(240)
            lpad(' ',240,' '),
--   v_Account_Dormant_Flag        CHAR(1)
      case
         when scai20 = 'Y' then 'D'
         when scai95 = 'Y' then 'I'
           else 'A' end,
--   v_Free_Code_1            CHAR(5)
            lpad(' ',5,' '),
--   v_Free_Code_2            CHAR(5)
            lpad(' ',5,' '),
--   v_Free_Code_3            CHAR(5)
            lpad('99999',5,' '),
--   v_Free_Code_4            CHAR(5)
            lpad(' ',5,' '),
--   v_Free_Code_5            CHAR(5)
            lpad(' ',5,' '),
--   v_Free_Code_6            CHAR(5)
            lpad(' ',5,' '),
--   v_Free_Code_7            CHAR(5)
            lpad(' ',5,' '),
--   v_Free_Code_8            CHAR(5)
            lpad(' ',5,' '),
--   v_Free_Code_9            CHAR(5)
            lpad(' ',5,' '),
--   v_Free_Code_10            CHAR(5)
            lpad(' ',5,' '),
--   v_Interest_Table_Code        CHAR(5)
            lpad(get_int_code(s5trcd,s5brrd),5,' '),
--   v_Account_Location_Code        CHAR(5)
            rpad(' ',5,' '),
--   v_Currency_Code             CHAR(3)
            lpad(scccy,3,' '),
--   v_Service_Outlet             CHAR(8)
            rpad(fin_sol_id,8,' '),
--   v_Account_Mgr_User_Id        CHAR(15)
            lpad('UBSADMIN',15,' '),
--   v_Account_Name             CHAR(80)
            rpad(scpf.scshn,80,' '),
--  v_Swift_Allowed_Flg             CHAR(1)
            'Y',
--   v_Last_Transaction_Date        CHAR(8)
    case when scdle = 0 and get_date_fm_btrv(scdle) <> 'ERROR' then
           lpad(get_date_fm_btrv(scdle),8,' ')
        else lpad(' ',8,' ')
    end,
--  v_Last_Transaction_any_date        CHAR(8)
            case when scled = 0 and get_date_fm_btrv(scled) <> 'ERROR' then
                lpad(get_date_fm_btrv(SCLED),8,' ')
            else lpad(' ',8,' ')
            end,
--   v_Exclude_for_combined_stateme    CHAR(1)
            lpad(' ',1,' '),
--   v_Statement_CIF_ID             CHAR(32)
            lpad(' ',32,' '),
--  v_Charge_Level_Code             CHAR(5)
            lpad(' ',5,' '),
-- v_PBF_download_Flag             CHAR(1)
            'Y',
--   v_wtax_level_flg             CHAR(1)
           lpad(' ',1,' '),
--   v_Sanction_Limit             CHAR(17)
            lpad(-1*scodl/power(10,c8ced),17,' '),
--   v_Drawing_Power             CHAR(17)
            lpad(-1*scodl/power(10,c8ced),17,' '),
--   v_DACC_ABSOLUTE_LIMIT        CHAR(17)
            lpad(' ',17,' '),
-- v_DACC_PERCENT_LIMIT             CHAR(8)
            lpad(' ',8,' '),
--   v_Maximum_Allowed_Limit        CHAR(17)
			lpad(9999999999999999/power(10,c8ced),17,' '),
--   v_Health_Code             CHAR(5)
            lpad(' ',5,' '),
--Sanction Level Code
            lpad(' ',5,' '),
--Sanction Reference Number
            lpad(' ',25,' '),
--   v_Limit_Sanction_Date        CHAR(8)
            lpad(' ',8,' '),
--   v_Limit_Expiring_Date        CHAR(8)
            case when scled = 0 and get_date_fm_btrv(SCLED) <> 'ERROR' then
            lpad(get_date_fm_btrv(SCLED),8,' ')
            else lpad(' ',8,' ')
            end,
--   v_Account_Review_Date        CHAR(8)
            lpad(' ',8,' '),
--   v_Loan_Paper_Date             CHAR(8)
            lpad(' ',8,' '),
--   v_Sanction_Authority_Code        CHAR(5)
            lpad(' ',5,' '),
-- v_Last_Compound_date             CHAR(8)
            lpad(' ',8,' '),
--   v_Daily_compounding_of_int_fla    CHAR(1)
            lpad(' ',1,' '),
-- v_Comp_rest_day_flag             CHAR(1)
            lpad(' ',1,' '),
--   v_Use_discount_rate_flg        CHAR(1)
            lpad(' ',1,' '),
--   v_Dummy                 CHAR(100)
            lpad(' ',100,' '),
--   v_Account_status_date        CHAR(8)
             case
	     when scai20 = 'Y' or scai95 = 'Y'  then 
				case when scdlm = 0 and get_date_fm_btrv(scdlm) <> 'ERROR' then
            lpad(get_date_fm_btrv(scdlm),8,' ')
            else lpad(' ',8,' ')
            end
		 else lpad(' ',8,' ') end,
--        to_char(to_date(pack_mig_EQ3.get_date_fm_btrv(scdlm),'DD/MM/YYYY'),'YYYYMMDD'),
--   v_Iban_number             CHAR(34)
            lpad(' ',34,' '),
--   v_Ias_code                 CHAR(5)
            lpad(' ',5,' '),
-- v_channel_id                 CHAR(5)
            lpad(' ',5,' '),
-- v_channel_level_code             CHAR(5)
            lpad(' ',5,' '),
--   v_int_suspense_amt             CHAR(17)
            lpad('0',17,' '),
--   v_penal_int_suspense_amt        CHAR(17)
            lpad('0',17,' '),
--   v_chrge_off_flg             CHAR(1)
            lpad(' ',1,' '),
--   v_pd_flg                 CHAR(1)
            'N',
--   v_pd_xfer_date             CHAR(8)
            lpad(' ',8,' '),
--   v_chrge_off_date             CHAR(8)
            lpad(' ',8,' '),
--   v_chrge_off_principal        CHAR(17)
            lpad(' ',17,' '),
--   v_pending_interest             CHAR(17)
            lpad(' ',17,' '),
-- v_principal_recovery             CHAR(17)
            lpad(' ',17,' '),
-- v_interest_recovery             CHAR(17)
            lpad(' ',17,' '),
--   v_charge_off_type             CHAR(1)
            lpad(' ',1,' '),
--   v_Master_acct_num             CHAR(16)
            lpad(' ',16,' '),
-- v_ps_diff_freq_rel_party_flg        CHAR(1)
            lpad(' ',1,' '),
--   v_swift_diff_freq_rel_party_fl    CHAR(1)
            lpad(' ',1,' '),
--   v_Address_Type             CHAR(12)
            lpad(' ',12,' '),
-- v_Phone_Type                 CHAR(12)
            lpad(' ',12,' '),
-- v_Email_Type                 CHAR(12)   
            lpad(' ',12,' '),
--   v_Alternate_Account_Name        CHAR(80)
            lpad(' ',80,' '),
--   v_Interest_Rate_Period_Months    CHAR(4)
            lpad(' ',4,' '),
-- v_Interest_Rate_Period_Days         CHAR(3)
            lpad(' ',3,' '),
--   v_Interpolation_Method         CHAR(1)
            lpad(' ',1,' '),
--   v_Is_Account_hedged_Flag         CHAR(1)
            lpad(' ',1,' '),
-- v_Used_for_netting_off_flag         CHAR(1)
            lpad(' ',1,' '),
-- v_Security_Indicator             CHAR(10)
            lpad(' ',10,' '),
--   v_Debt_Security             CHAR(1)
            lpad(' ',1,' '),
--   v_Security_Code             CHAR(8)
            lpad(' ',8,' ')
from map_acc
    inner join scpf on scpf.scab||scpf.scan||scpf.scas= map_acc.LEG_ACC_NUM
    left join s5pf on s5pf.s5ab||s5pf.s5an||s5pf.s5as = map_acc.LEG_ACC_NUM
    inner join c8pf on c8ccy = scccy 
    left join (select * from d4pf where d4dte = 9999999) drbase on drbase.d4brr = s5brrd
    left join (select * from d4pf where d4dte = 9999999) crbase on crbase.d4brr = s5brrc 
    left join (select * from d5pf where d5dte = 9999999) drdiff on drdiff.d5drr = s5drrd
    left join (select * from d5pf where d5dte = 9999999) crdiff on crdiff.d5drr = s5drrc
    where schm_type in ('SBA','CAA') ;
commit;

exit;