truncate table lrs_o_table;
insert into lrs_o_table
(
SELECT 
-- ACCOUNT_NUMBER    CHAR(16 BYTE)
RPAD(map_acc.fin_acc_num,16,' ' ),
-- FLOW_ID    CHAR(5 BYTE)
    case when OMMVT = 'P' and (OMMVTS = 'M')then 'PRDEM'
         when OMMVT = 'I' and (OMMVTS = 'V' or ommvts is null) then 'INDEM'
         else 'ERROR'
    end,
-- FLOW_START_DATE    CHAR(10 BYTE)
      rpad(case
      when get_date_fm_btrv(omdte) <> 'ERROR' and omdte <> 9999999 then 
      to_char(to_date(get_date_fm_btrv(omdte),'YYYYMMDD'),'DD-MM-YYYY')
      else ' ' end,10,' '),
--rpad(get_pr_flw_dat(map_acc.leg_acc_num),10,' '),
--RPAD(' ',10,' ' ),
-- FREQUENCY_TYPE    CHAR(1 BYTE)
      case when OMMVT = 'P' and (OMMVTS = 'M')then 'B'
       else ' '
    end,
  --mapfrequency(VW_IZPF_MAX_REC.IZRFRQ),1,' '),
--RPAD(' ',1,' ' ),
-- FREQ_WEEK_NUM_FOR_PRINCIPAL    CHAR(1 BYTE)
RPAD(' ',1,' ' ),
-- FREQ_WEEK_DAY_FOR_PRINCIPAL    CHAR(1 BYTE)
RPAD(' ',1,' ' ),
-- FREQ_START_DD_FOR_PRINCIPAL    CHAR(2 BYTE)
 rpad(' ',2,' '),
 -- FREQ_HLDY_STATUS_PRINCIPAL    CHAR(1 BYTE)
   --   rpad(case
   --   when VW_IZPF_MAX_REC.IZRFRQ is not null then 'P'
   --   else ' '
   --   end,1,' '),
case when OMMVT = 'P' and (OMMVTS = 'M')then 'P'
       else ' '
    end,
--RPAD(' ',1,' ' ),
-- NUMBER_OF_FLOWS    CHAR(3 BYTE)
case when OMMVT = 'P' and (OMMVTS = 'M')then LPAD('1',3,' ' ) else LPAD(' ',3,' ' ) end,
--LPAD(' ',3,' ' ),
-- INSTALLMENT_AMOUNT    CHAR(17 BYTE)
case when OMMVT = 'P' and (OMMVTS = 'M') then lpad(to_number(abs(omnwr)/POWER(10,c8pf.C8CED)),17,' ') else lpad('0',17,' ') end ,
--lpad(get_pr_intl_amt(map_acc.leg_acc_num),17,' '),
--LPAD(' ',17,' ' ),
-- INSTALLMENT_PERCENTAGE    CHAR(8 BYTE)
LPAD(' ',8,' ' ),
-- NUMBER_OF_DEMANDS_RAISED    CHAR(3 BYTE)
  '0',
--LPAD(' ',3,' ' ),
-- NEXT_INSTALLMENT_DATE    CHAR(10 BYTE)
--rpad(to_char(to_date(pack_mig_EQ3.get_date_fm_btrv(VW_OMPF_MIN_REC.omdte),'DD/MM/YYYY'),'DD-MM-YYYY'),10,' '),
--rpad(get_pr_flw_dat(map_acc.leg_acc_num),10,' '),
RPAD(' ',10,' ' ),
-- NEXT_INT_INSTALLMENT_DATE    CHAR(10 BYTE)
RPAD(' ',10,' ' ),
-- FREQUENCY_TYPE_FOR_INTEREST    CHAR(1 BYTE)
--rpad(mapfrequency(v5pf.v5ifq),1,' '),
case 
when OMMVT = 'P' and (OMMVTS = 'M') then ' '
when OMMVT = 'I' and (OMMVTS = 'V' or ommvts is null) then 
			case when v5ifq is not null then RPAD(TRIM(MapFrequency(v5IFQ)),1,' ') else 'V' end
      else ' '
    end,
-- FREQUENCY_WEEK_NUMBER_FOR_INT    CHAR(1 BYTE)
RPAD(' ',1,' ' ),
-- FREQUENCY_WEEK_DAY_FOR_INT    CHAR(1 BYTE)
RPAD(' ',1,' ' ),
-- FREQUENCY_START_DD_FOR_INT    CHAR(2 BYTE)
case 
when OMMVT = 'P' and (OMMVTS = 'M') then RPAD(' ',2,' ')
when V5IFQ is not null then RPAD( substr(v5pf.v5ifq,2,2),2,' ' )
else RPAD(substr(get_date_fm_btrv(omdte),7,2),2,' ') end,
--RPAD(' ',2,' ' ),
-- FREQ_HOLIDAY_STATUS_FOR_INT    CHAR(1 BYTE)
--   'P',
case 
when OMMVT = 'P' and (OMMVTS = 'M') then RPAD(' ',1,' ' )  
else RPAD('P',1,' ' ) end,
-- INSTALLMENT_INDICATOR    CHAR(1 BYTE)
RPAD(' ',1,' ' )
 FROM MAP_ACC
 inner join ompf on ombrnm||omdlp||omdlr = map_acc.leg_acc_num
 inner join v5pf on v5brnm||v5dlp||v5dlr = map_acc.leg_acc_num
  inner join c8pf on c8ccy = currency
--inner join pdmdompf on pdmdompf.ombrnm||pdmdompf.omdlp||pdmdompf.omdlr = map_acc.leg_acc_num
 WHERE map_acc.schm_type='LAA'  and omdte > get_param('CYYMMDD') and omnwr <> 0
 );
 
 commit;
 exit;