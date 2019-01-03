-- File Name		: TTUM2

-- File Created for	: Upload file for Office accounts

-- Created By		: Prashant

-- Client		: ENBD

-- Created On		: 01-11-2011
-------------------------------------------------------------------
truncate table TTUM2_O_TABLE ;
insert into TTUM2_O_TABLE 
select 
--Account Number
	FIN_ACC_NUM,
--Currency Code 
    rpad(c8ccy,3,' '),
--SOLID
    rpad(FIN_SOL_ID,8,' '),
--Part Tran Type
    case when (scbal+scsuma) > 0 then 'C'
         else 'D'
    end,
--Transaction Amount
    lpad(abs((scbal+scsuma)/power(10,c8ced)),17,' '),
--Transaction Particular
    rpad('TTUM2 Migration- '||scab||scan||scas,30,' '),
    rpad(' ',5,' '),
    rpad(' ',20,' '),
    rpad(' ',5,' '),
    rpad(' ',10,' '),
    rpad(' ',6,' '),
    rpad(' ',16,' '),
    rpad(' ',1,' '),
    lpad(abs((scbal+scsuma)/power(10,c8ced)),17,' '),
    rpad(c8ccy,3,' '),
    rpad(' ',5,' '),
    rpad(' ',15,' '),
    rpad(' ',10,' '),
    rpad(' ',10,' '),
    rpad(' ',5,' '),
    rpad(' ',6,' '),
    rpad(' ',6,' '),
    rpad(' ',2,' '),
    rpad(' ',1,' '),
    rpad(' ',12,' '),
    rpad(' ',10,' '),
    rpad(' ',20,' '),
    rpad(' ',5,' '),
    rpad(' ',30,' '),
    rpad(' ',40,' '),
    rpad(' ',40,' '),
    rpad(' ',40,' '),
    rpad(' ',40,' '),
    rpad(' ',40,' '),
    rpad(' ',17,' '),
    rpad(' ',17,' '),
    rpad(' ',17,' '),
    rpad(' ',17,' '),
    rpad(' ',17,' '),
    rpad(' ',30,' '),
    rpad(' ',16,' '),
    rpad(' ',12,' '),
    rpad(' ',10,' '),
    rpad(' ',10,' '),
    rpad(' ',9,' '),
    rpad(' ',4,' '),
    rpad(' ',34,' '),
    rpad(' ',256,' '),
    rpad(' ',16,' '),
    rpad(' ',5,' '),
    rpad(' ',5,' ')
from 
(select * from scpf
left join (select distinct ac_type , schm_type from MAP_SCHM_CODE ) on scact = ac_type
inner join (select distinct acbrn,acnum,acsfx,fin_acc_num from map_off_acc)MAP_OFF_ACC on scab||scan||scas = acbrn||acnum||acsfx
inner join map_sol on scab =br_code
inner join c8pf on c8ccy = scccy
where schm_type is null or schm_type = 'OAB'
and scbal+scsuma <> 0 and fin_acc_num not like '999596%' and fin_acc_num not like '%177050251320002%')X ---Excluding DD Schemes 596, 591 in TTUM2
--union for OABMIGR account
union
select 
--Account Number
	rpad(FIN_SOL_ID||C8CCY||nvl(schm_type,'OAB')||'MIGR',16,' '),
--Currency Code 
    rpad(c8ccy,3,' '),
--SOLID
    rpad(FIN_SOL_ID,8,' '),
--Part Tran Type
    case when (scbal+scsuma) > 0 then 'D'
         else 'C'
    end,
--Transaction Amount
    lpad(abs((scbal+scsuma)/power(10,c8ced)),17,' '),
--Transaction Particular
    rpad('TTUM2 Migration- '||scab||scan||scas,30,' '),
    rpad(' ',5,' '),
    rpad(' ',20,' '),
    rpad(' ',5,' '),
    rpad(' ',10,' '),
    rpad(' ',6,' '),
    rpad(' ',16,' '),
    rpad(' ',1,' '),
    lpad(abs((scbal+scsuma)/power(10,c8ced)),17,' '),
    rpad(c8ccy,3,' '),
    rpad(' ',5,' '),
    rpad(' ',15,' '),
    rpad(' ',10,' '),
    rpad(' ',10,' '),
    rpad(' ',5,' '),
    rpad(' ',6,' '),
    rpad(' ',6,' '),
    rpad(' ',2,' '),
    rpad(' ',1,' '),
    rpad(' ',12,' '),
    rpad(' ',10,' '),
    rpad(' ',20,' '),
    rpad(' ',5,' '),
    rpad(' ',30,' '),
    rpad(' ',40,' '),
    rpad(' ',40,' '),
    rpad(' ',40,' '),
    rpad(' ',40,' '),
    rpad(' ',40,' '),
    rpad(' ',17,' '),
    rpad(' ',17,' '),
    rpad(' ',17,' '),
    rpad(' ',17,' '),
    rpad(' ',17,' '),
    rpad(' ',30,' '),
    rpad(' ',16,' '),
    rpad(' ',12,' '),
    rpad(' ',10,' '),
    rpad(' ',10,' '),
    rpad(' ',9,' '),
    rpad(' ',4,' '),
    rpad(' ',34,' '),
    rpad(' ',256,' '),
    rpad(' ',16,' '),
    rpad(' ',5,' '),
    rpad(' ',5,' ')
from 
(select * from scpf
left join (select distinct ac_type , schm_type from MAP_SCHM_CODE ) on scact = ac_type
inner join (select distinct acbrn,acnum,acsfx,fin_acc_num from map_off_acc) MAP_OFF_ACC on scab||scan||scas = acbrn||acnum||acsfx
inner join map_sol on scab =br_code
inner join c8pf on c8ccy = scccy
where schm_type is null or schm_type = 'OAB'
and scbal+scsuma <> 0 and fin_acc_num not like '999596%' and fin_acc_num not like '%177050251320002%')X;
COMMIT;
exit;