-- File Name		: interest.sql

-- File Created for	: Upload file for interest

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------
create or replace
procedure interest
   as
   v_Indicator  		 CHAR(3);
   v_Account_Number	         CHAR(16);
   v_Crncy_Code  		 CHAR(3);
   v_SOL_ID		         CHAR(8);
   v_Normal_credit_accrued_amt   CHAR(17);
   v_Last_cr_int_application_dt  CHAR(8);
   v_Credit_int_accrued_upto_dt  CHAR(8);
   v_Credit_int_booked_upto_dt   CHAR(8);
   v_Normal_debit_accrued_amt    CHAR(17);
   v_Last_dr_int_application_dt  CHAR(8);
   v_Debit_int_acrued_upto_date  CHAR(8);
   v_Debit_int_booked_upto_date  CHAR(8);
   v_Dummy  		         CHAR(100);
   
   
--  DECLARE
   CURSOR c1 is
--   v_Indicator    		   CHAR(3) NULL,
     select 'INT',
--   v_Account_Number	           CHAR(16) NULL,
            rpad(map_acc.fin_acc_num,16,' '),
--   v_Crncy_Code  		   CHAR(3) NULL,
            lpad(scpf.scccy,3,' '),
--   v_SOL_ID		           CHAR(8) NULL,
            rpad(map_acc.fin_sol_id,8,' '),
--   v_Normal_credit_accrued_amt   CHAR(17) NULL,
            lpad(s5pf.s5am1c,17,' '),
--   v_Last_cr_int_application_dt  CHAR(8) NULL,
      to_char(to_date(pack_mig_EQ3.get_date_fm_btrv(s5lcdc),'DD/MM/YYYY'),'YYYYMMDD'),
--   v_Credit_int_accrued_upto_dt  CHAR(8) NULL,
	    to_char(to_date(pack_mig_EQ3.get_date_fm_btrv(key_value),'DD/MM/YYYY'),'YYYYMMDD'),
--   v_Credit_int_booked_upto_dt   CHAR(8) NULL,
	    to_char(to_date(pack_mig_EQ3.get_date_fm_btrv(key_value),'DD/MM/YYYY'),'YYYYMMDD'),
--   v_Normal_debit_accrued_amt    CHAR(17) NULL,
            lpad(s5pf.s5am1d,17,' '),
--   v_Last_dr_int_application_dt  CHAR(8) NULL,
      to_char(to_date(pack_mig_EQ3.get_date_fm_btrv(s5lcdd),'DD/MM/YYYY'),'YYYYMMDD'),
--   v_Debit_int_acrued_upto_date  CHAR(8) NULL,
	    to_char(to_date(pack_mig_EQ3.get_date_fm_btrv(key_value),'DD/MM/YYYY'),'YYYYMMDD'),
--   v_Debit_int_booked_upto_date  CHAR(8) NULL,
	    to_char(to_date(pack_mig_EQ3.get_date_fm_btrv(key_value),'DD/MM/YYYY'),'YYYYMMDD'),
--   v_Dummy  		           CHAR(100) NULL
            lpad(' ',100,' ')
	from sys_config,map_acc
   inner join scpf on scpf.scab||scpf.scan||scpf.scas = map_acc.LEG_ACC_NUM
   inner join s5pf on s5pf.s5ab||s5pf.s5an||s5pf.s5as = map_acc.LEG_ACC_NUM
   where sys_config.key_string='EQ3_BUSINESS_DATE'	
   and schm_type in ('SBA','CAA','ODA','CCA')
   and rownum <=10;

   
BEGIN

Begin

EXECUTE IMMEDIATE 'truncate table AC_INTEREST_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Indicator,v_Account_Number,v_Crncy_Code,v_SOL_ID,v_Normal_credit_accrued_amt,v_Last_cr_int_application_dt,v_Credit_int_accrued_upto_dt,v_Credit_int_booked_upto_dt,v_Normal_debit_accrued_amt,v_Last_dr_int_application_dt,v_Debit_int_acrued_upto_date,v_Debit_int_booked_upto_date,v_Dummy;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into AC_INTEREST_O_TABLE values (v_Indicator,v_Account_Number,v_Crncy_Code,v_SOL_ID,v_Normal_credit_accrued_amt,v_Last_cr_int_application_dt,v_Credit_int_accrued_upto_dt,v_Credit_int_booked_upto_dt,v_Normal_debit_accrued_amt,v_Last_dr_int_application_dt,v_Debit_int_acrued_upto_date,v_Debit_int_booked_upto_date,v_Dummy ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;