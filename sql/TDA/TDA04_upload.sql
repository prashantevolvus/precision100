-- File Name		: balance.sql

-- File Created for	: Upload file for balance

-- Created By		: Ashok Kumar.S

-- Client		: ENBD

-- Created On		: 01-11-2011
-------------------------------------------------------------------
truncate table tdt_o_table;

insert into tdt_o_table
select 'TDT','T','BI',rpad(fin_acc_num,16,' '), v5ccy,lpad(PI/POWER(10,C8CED),17,' '),'C',
       case when get_date_fm_btrv(v5lcd) <> 'ERROR' then get_date_fm_btrv(v5lcd)
       else
       get_date_fm_btrv(deal_open_date)
      end,
' ',lpad(' ',10,' '),'PI','N',lpad(fin_sol_id,34,' ') from map_acc a 
inner join vw_dep_master_ext_with_flow b on a.leg_acc_num = b.leg_acc_num 
inner join v5pf on a.leg_acc_num = v5brnm||v5dlp||v5dlr 
inner join c8pf on  c8ccy = v5ccy 
where schm_type = 'TDA'
--II Interest Inflow
union
select 'TDT','T','BI',rpad(fin_acc_num,16,' '), v5ccy,lpad((II)/POWER(10,C8CED),17,' '),'C',
       case when get_date_fm_btrv(v5lcd) <> 'ERROR' then get_date_fm_btrv(v5lcd)
       else
       get_date_fm_btrv(deal_open_date)
      end,
' ',lpad(' ',10,' '),'II','N',lpad(fin_sol_id,34,' ') from map_acc a 
inner join vw_dep_master_ext_with_flow b on a.leg_acc_num = b.leg_acc_num 
inner join v5pf on a.leg_acc_num = v5brnm||v5dlp||v5dlr 
inner join c8pf on  c8ccy = v5ccy 
where schm_type = 'TDA' and II <> 0--and capitalised_flg = 'Y'
union
--PO Principal Outflow
select 'TDT','T','BI',rpad(fin_acc_num,16,' '), v5ccy,lpad((PO)/POWER(10,C8CED),17,' '),'D',
       case when get_date_fm_btrv(v5lcd) <> 'ERROR' then get_date_fm_btrv(v5lcd)
       else
       get_date_fm_btrv(deal_open_date)
      end,
' ',lpad(' ',10,' '),'PO','N',lpad(fin_sol_id,34,' ') from map_acc a 
inner join vw_dep_master_ext_with_flow b on a.leg_acc_num = b.leg_acc_num 
inner join v5pf on a.leg_acc_num = v5brnm||v5dlp||v5dlr 
inner join c8pf on  c8ccy = v5ccy 
where schm_type = 'TDA' and PO <> 0--and capitalised_flg = 'Y'
union
--TDAMIGR account
--1770||'INR'||TDAMIGR||
select 'TDT','T','BI',rpad((fin_sol_id||v5ccy||'TDAMIGR'),16,' '), v5ccy,lpad(calc_bal,17,' '),'D', 
get_date_fm_btrv(get_param('CYYMMDD')),
' ',lpad(' ',10,' '),'  ','Y',lpad(fin_sol_id,34,' ') 
from 
(select v5brnm,v5ccy,c8ccyn,fin_sol_id,sum(v5bal/POWER(10,C8CED))calc_bal from map_acc
inner join v5pf on leg_acc_num = v5brnm||v5dlp||v5dlr 
inner join c8pf on  c8ccy = v5ccy 
where schm_type = 'TDA'
group by v5brnm,v5ccy,c8ccyn,fin_sol_id
order by v5brnm,v5ccy,c8ccyn,fin_sol_id
)x;
commit;
exit;
