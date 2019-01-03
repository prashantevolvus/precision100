-- File Name		: balance.sql

-- File Created for	: Upload file for balance

-- Created By		: Ashok Kumar.S

-- Client		: ENBD

-- Created On		: 01-11-2011
-------------------------------------------------------------------
truncate table AC_BALANCE_O_TABLE;
insert into AC_BALANCE_O_TABLE
select 'BAL',
--   v_Indicator           CHAR(3)
--   v_Account_Number         CHAR(16)
            rpad(fin_acc_num,16,' '),
--   v_Amount              number(14,2)
            lpad((scbal -(scsum1+scsum2))/POWER(10,C8CED),17,' '),
--   v_Transaction_Date         CHAR(8)
        get_param('EOD_DATE'),
--   v_Currency_Code         CHAR(3)
            rpad(scpf.scccy,3,' '),
--   v_Service_Outlet         CHAR(8)
            rpad(map_acc.fin_sol_id,8,' '),
--   v_IBAN_Number         CHAR(34)
            lpad(' ',34,' '),
--   v_dummy               CHAR(10)
            lpad(' ',10,' ')
      from map_acc
    inner join scpf on scpf.scab||scpf.scan||scpf.scas= map_acc.LEG_ACC_NUM
    inner join c8pf on c8ccy = scccy
    where (scbal -(scsum1+scsum2)) <>'0' 
    order by scccy;
      COMMIT;
exit;