truncate table lat_o_table; 

insert into lat_o_table
(
SELECT
--  TRANSACTION_TYPE    CHAR(1 BYTE)
   'T',
--rpad(' ',1,' '),
--  TRANSACTION_SUB_TYPE    CHAR(2 BYTE)
   'BI',    
--rpad(' ',2,' '),
--  ACCOUNT_NUMBER    CHAR(16 BYTE)
RPAD(map_acc.fin_acc_num,16,' ' ),
--rpad(' ',16,' '),
--  CURRENCY    CHAR(3 BYTE)
RPAD(map_acc.currency,3,' ' ),
--rpad(' ',3,' '),
--  SERVICE_OUTLET    CHAR(8 BYTE)
rpad(map_acc.fin_sol_id,8,' '),
--rpad(' ',8,' '),
--  AMOUNT    CHAR(17 BYTE)
 lpad(to_number(abs(otpf.otdla)/POWER(10,c8pf.C8CED)),17,' '),
--rpad(' ',17,' '),
--  PART_TRAN_TYPE    CHAR(1 BYTE)
    'D',
--rpad(' ',1,' '),
--  TYPE_OF_DEMANDS    CHAR(1 BYTE)
  ' ',
--rpad(' ',1,' '),
--  VALUE_DATE    CHAR(10 BYTE)
           rpad(to_char(to_date(get_param('EOD_DATE'),'YYYYMMDD'),'DD-MM-YYYY'),10,' '), 
--rpad(' ',10,' '),
--  FLOW_ID    CHAR(5 BYTE)
'DISBM',
--rpad(' ',5,' '),
--  DEMAND_DATE    CHAR(10 BYTE)
rpad(' ',10,' '),
--  LAST_PART_TRANSACTION_FLAG    CHAR(1 BYTE)
    'N',
--rpad(' ',1,' '),
--  TRAN_END_IND    CHAR(1 BYTE)
 'N',
-- rpad(' ',1,' '),
--  ADVANCE_PAYMENT_FLAG    CHAR(1 BYTE)
 'N',
--rpad(' ',1,' '),
--  PREPAYMENT_TYPE    CHAR(1 BYTE)
rpad(' ',1,' '),
--  INT_COLL_ON_PREPAYMENT_FLG    CHAR(1 BYTE)
rpad(' ',1,' '),
--  TRANSACTION_REMARKS    CHAR(30 BYTE)
rpad('LOAN DISBURSMAENT TRANSACTION',30,' '),
--  TRANSACTION_PARTICULARS    CHAR(50 BYTE)
rpad('LOAN DISBURSMAENT TRANSACTION',50,' ')
FROM MAP_ACC
  inner join otpf on otpf.otbrnm||otpf.otdlp||otpf.otdlr = map_acc.leg_acc_num
  inner join c8pf on c8ccy = otccy
  where map_acc.schm_type='LAA'
union
   SELECT
--  TRANSACTION_TYPE    CHAR(1 BYTE)
   'T',
--rpad(' ',1,' '),
--  TRANSACTION_SUB_TYPE    CHAR(2 BYTE)
   'BI',    
--rpad(' ',2,' '),
--  ACCOUNT_NUMBER    CHAR(16 BYTE)
rpad(fin_sol_id||map_acc.currency||'LAAMIGR',16,' '),
--rpad(' ',16,' '),
--  CURRENCY    CHAR(3 BYTE)
RPAD(map_acc.currency,3,' ' ),
--rpad(' ',3,' '),
--  SERVICE_OUTLET    CHAR(8 BYTE)
rpad(map_acc.fin_sol_id,8,' '),
--rpad(' ',8,' '),
--  AMOUNT    CHAR(17 BYTE)
 lpad(to_number(abs(otpf.otdla)/POWER(10,c8pf.C8CED)),17,' '),
--rpad(' ',17,' '),
--  PART_TRAN_TYPE    CHAR(1 BYTE)
    'C',
--rpad(' ',1,' '),
--  TYPE_OF_DEMANDS    CHAR(1 BYTE)
  ' ',
--rpad(' ',1,' '),
--  VALUE_DATE    CHAR(10 BYTE)
           rpad(to_char(to_date(get_param('EOD_DATE'),'YYYYMMDD'),'DD-MM-YYYY'),10,' '), 
--rpad(' ',10,' '),
--  FLOW_ID    CHAR(5 BYTE)
rpad(' ',5,' '),
--  DEMAND_DATE    CHAR(10 BYTE)
rpad(' ',10,' '),
--  LAST_PART_TRANSACTION_FLAG    CHAR(1 BYTE)
    'N',
--rpad(' ',1,' '),
--  TRAN_END_IND    CHAR(1 BYTE)
 'N',
-- rpad(' ',1,' '),
--  ADVANCE_PAYMENT_FLAG    CHAR(1 BYTE)
 'N',
--rpad(' ',1,' '),
--  PREPAYMENT_TYPE    CHAR(1 BYTE)
rpad(' ',1,' '),
--  INT_COLL_ON_PREPAYMENT_FLG    CHAR(1 BYTE)
rpad(' ',1,' '),
--  TRANSACTION_REMARKS    CHAR(30 BYTE)
rpad('LOAN DISBURSMAENT TRANSACTION',30,' '),
--  TRANSACTION_PARTICULARS    CHAR(50 BYTE)
rpad('LOAN DISBURSMAENT TRANSACTION',50,' ')
FROM MAP_ACC
  inner join otpf on otpf.otbrnm||otpf.otdlp||otpf.otdlr = map_acc.leg_acc_num
  inner join c8pf on c8ccy = otccy
  where map_acc.schm_type='LAA');
  
commit;

exit;