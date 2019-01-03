-- File Name		: TTUM1

-- File Created for	: Upload file for sum of all ledger balance currency wise, sol wise and scheme type wise

-- Created By		: Prashant

-- Client		: ENBD

-- Created On		: 01-11-2011
-------------------------------------------------------------------
truncate table TTUM1_O_TABLE ;
insert into TTUM1_O_TABLE 
select 
--Account Number
    rpad(FIN_SOL_ID||C8CCY||nvl(schm_type,'OAB')||'MIGR',16,' '),
--Currency Code 
    rpad(c8ccy,3,' '),
--SOLID
    rpad(FIN_SOL_ID,8,' '),
--Part Tran Type
    case when acbal > 0 then 'C'
         else 'D'
    end,
--Transaction Amount
    lpad(abs(acbal/power(10,c8ced)),17,' '),
--Transaction Particular
    rpad('TTUM1 Migration upload',30,' '),
    rpad(' ',5,' '),
    rpad(' ',20,' '),
    rpad(' ',5,' '),
    rpad(' ',10,' '),
    rpad(' ',6,' '),
    rpad(' ',16,' '),
    rpad(' ',1,' '),
    lpad(abs(acbal/power(10,c8ced)),17,' '),
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
(
select FIN_SOL_ID,c8ccy,C8CCYN,c8ced,
case when scan = '890060' and scas = '682' then 'DDA'
 when scan = '890065' and scas = '784' then 'DDA'
else nvl(schm_type,'OAB')end schm_type,
sum(scbal+scsuma) acbal
from scpf
left join (select distinct ac_type , schm_type from MAP_SCHM_CODE ) on scact = ac_type
inner join map_sol on scab = BR_CODE
inner join c8pf on c8ccy = scccy
group by FIN_SOL_ID,c8ccy,C8CCYN,
case when scan = '890060' and scas = '682' then 'DDA'
when scan = '890065' and scas = '784' then 'DDA'
else nvl(schm_type,'OAB')end,c8ced
having sum(scbal+scsuma) <> 0
)X;
      COMMIT;
exit;