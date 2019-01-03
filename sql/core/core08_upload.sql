-- File Name		: balance.sql

-- File Created for	: Upload file for balance

-- Created By		: Ashok Kumar.S

-- Client		: ENBD

-- Created On		: 01-11-2011
-------------------------------------------------------------------
truncate table SPT_O_TABLE;
insert into SPT_O_TABLE
select 'SPT',
             rpad(map_acc.fin_acc_num,16,' '),
             rpad(r4pf.R4FSN,16,' '),
             get_date_fm_btrv(r4eff),
             lpad(' ',8,' '),
             lpad(' ',17,' '),
            case
            when r4pay is not null then rpad(r4pay,40,' ')
            else rpad(' ',40,' ') end,
            rpad(to_number((r4pf.R4LSR-r4pf.R4FSN) +1),3,' '),
             lpad(' ',6,' '),
             rpad('999',5,' '),
             lpad(' ',17,' '),
             rpad(scpf.scccy,3,' ')
    from map_acc
   inner join scpf on scpf.scab||scan||scas = map_acc.leg_acc_num
   inner join r4pf on r4pf.r4ab||r4an||r4as = map_acc.leg_acc_num
   inner join c8pf on c8ccy = scccy; 
  
      
      COMMIT;
exit;