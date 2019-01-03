-- File Name		: balance.sql

-- File Created for	: Upload file for balance

-- Created By		: Ashok Kumar.S

-- Client		: ENBD

-- Created On		: 01-11-2011
-------------------------------------------------------------------
truncate table TDINTEREST_O_TABLE  ;
insert into TDINTEREST_O_TABLE
select
--TD008-001 V_Indicator String 3 Mandatory 
rpad('INT',3,' '),
--TD008-002 V_Account Number String 16 Mandatory 
rpad(map_acc.fin_acc_num,16,' '),
--TD008-003 V_Currency Code String 3 Mandatory Equation 
rpad(v5pf.v5ccy,3,' '),
--TD008-004 V_SOL ID  String 8 Mandatory Equation 
rpad(map_acc.fin_sol_id,8,' '),
--TD008-005 V_Normal credit accrued amount  Number (14,2) Optional Equation
lpad(V5PF.V5AM1/POWER(10,C8CED),17,' '),
--TD008-006 V_Last credit interest application date YYYYMMDD 8 Optional 
case when get_date_fm_btrv(v5lcd) <> 'ERROR' then get_date_fm_btrv(v5lcd)
else rpad(' ',8,' ') end,
--TD008-007 V_Credit interest accrued upto  date YYYYMMDD 8 Optional
get_date_fm_btrv(get_param('CYYMMDD')),
--TD008-008 V_Credit interest booked upto  date YYYYMMDD 8 Optional
get_date_fm_btrv(get_param('CYYMMDD')),
--TD008-009 V_Normal debit accrued amount  Number  (14,2)  Optional    
lpad(' ',17,' '),
--TD008-010 V_Last debit interest application date YYYYMMDD 8 Optional  
rpad(' ',8,' '),
--TD008-011 V_Debit interest accrued upto date YYYYMMDD 8 Optional    
rpad(' ',8,' '),
--TD008-012 V_Debit_interest_booked_upto_date YYYYMMDD 8 Optional    
rpad(' ',8,' '),
--TD008-013 V_Dummy  char(99)     
rpad(' ',8,' ')
from map_acc  
inner join v5pf on v5pf.v5brnm||v5pf.v5dlp||v5pf.v5dlr = map_acc.leg_acc_num 
inner join c8pf on c8ccy = v5ccy
where map_acc.schm_type='TDA';
commit;
exit;