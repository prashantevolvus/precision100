-- File Name		: Accounty Interest

-- File Created for	: Upload file for balance

-- Created By		: Prashant

-- Client		: ENBD

-- Created On		: 01-11-2011
-------------------------------------------------------------------
truncate table AC_INTEREST_O_TABLE  ;
insert into AC_INTEREST_O_TABLE  
--   v_Indicator    		   CHAR(3) NULL,
     select 'INT',
--   v_Account_Number	           CHAR(16) NULL,
            rpad(map_acc.fin_acc_num,16,' '),
--   v_Crncy_Code  		   CHAR(3) NULL,
            lpad(scpf.scccy,3,' '),
--   v_SOL_ID		           CHAR(8) NULL,
            rpad(map_acc.fin_sol_id,8,' '),
--   v_Normal_credit_accrued_amt   CHAR(17) NULL,
            lpad(s5pf.s5am1c/POWER(10,C8CED),17,' '),
--   v_Last_cr_int_application_dt  CHAR(8) NULL,
      case when s5lcdc <> 0 then get_date_fm_btrv(s5lcdc) 
      else lpad(' ',8,' ')
    end,
--   v_Credit_int_accrued_upto_dt  CHAR(8) NULL,
	  get_param('EOD_DATE'),
--   v_Credit_int_booked_upto_dt   CHAR(8) NULL,
	    get_param('EOD_DATE'),
--   v_Normal_debit_accrued_amt    CHAR(17) NULL,
            lpad(s5pf.s5am1d/POWER(10,C8CED),17,' '),
--   v_Last_dr_int_application_dt  CHAR(8) NULL,
            case when s5lcdd <> 0 then get_date_fm_btrv(s5lcdd) 
      else lpad(' ',8,' ')
    end,
--   v_Debit_int_acrued_upto_date  CHAR(8) NULL,
	    get_param('EOD_DATE'),
--   v_Debit_int_booked_upto_date  CHAR(8) NULL,
	    get_param('EOD_DATE'),
--   v_Dummy  		           CHAR(100) NULL
            lpad(' ',100,' ')
	from map_acc
   inner join scpf on scpf.scab||scpf.scan||scpf.scas = map_acc.LEG_ACC_NUM
   inner join s5pf on s5pf.s5ab||s5pf.s5an||s5pf.s5as = map_acc.LEG_ACC_NUM
   inner join c8pf on c8ccy = s5ccy
   where schm_type in ('SBA','CAA','ODA','CCA');

   COMMIT;
exit;