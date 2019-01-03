-- File Name		: TOD

-- File Created for	: Upload file for balance

-- Created By		: Prashant

-- Client		: ENBD

-- Created On		: 01-11-2011
-------------------------------------------------------------------
truncate table TOD_O_TABLE; 
insert into TOD_O_TABLE 
select 'TOD',
--   v_Indicator           CHAR(3)
--   v_Account_Number         CHAR(16)
            rpad(map_acc.fin_acc_num,16,' '),
--   v_tod_Amount          CHAR(17)
       lpad(to_number(abs((scbal-scodl)/POWER(10,C8CED))),17,' '),
--   v_TOD_Grant_Date         CHAR(8)
        get_param('EOD_DATE'),
--   v_TOD_Expiry_Date         CHAR(8)
    case
        when scled = '9999999' then '20991231'
        when scled = '0' then  to_char(to_date(get_date_fm_btrv(get_param('CYYMMDD')),'YYYYMMDD')+1,'YYYYMMDD') --to_char(to_date(get_date_fm_btrv('CYYMMDD'),'YYYYMMDD') + 1,'YYYYMMDD')
       else  get_date_fm_btrv(scled) end,
--   v_TOD_Penal_Start_Date     CHAR(8)
            lpad(' ',8,' '),
--   v_TOD_Advance_Type         CHAR(1)
            'R',
--   v_TOD_Advance_Category     CHAR(1)
            'C',
--   v_TOD_Level_Interest_Flag     CHAR(1)
            'N',
-- v_TOD_Normal_Interest_Percent CHAR(10)
            lpad(' ',10,' '),
-- v_TOD_Penal_Interest_Percent     CHAR(10)
            lpad(' ',10,' '),
-- v_TOD_Availed_Amount         CHAR(17)
            lpad('0',17,' '),
--   v_TOD_Regularized_Amount     CHAR(17)
            lpad(' ',17,' '),
--   v_SOL_ID               CHAR(8)
            rpad(map_acc.fin_sol_id,8,' '),
--   v_CRNCY_CODE           CHAR(3)
            lpad(scpf.scccy,3,' '),
--   v_Entity_Type          CHAR(5)
            'TODMN',
-- v_Free_Text             CHAR(60)
            lpad(' ',60,' ')
      from scpf 
    inner join map_acc on scpf.scab||scpf.scan||scpf.scas = map_acc.LEG_ACC_NUM
    inner join c8pf on c8ccy = scccy
    where schm_type in ('SBA','CAA','ODA')
    and schm_type in ('CAA', 'ODA') and scodl < 0 and scled > get_param('CYYMMDD') 
union
select 'TOD',
--   v_Indicator           CHAR(3)
--   v_Account_Number         CHAR(16)
            rpad(map_acc.fin_acc_num,16,' '),
--   v_tod_Amount          CHAR(17)
       lpad(to_number(abs((scbal-scodl)/POWER(10,C8CED))),17,' '),
--   v_TOD_Grant_Date         CHAR(8)
        get_param('EOD_DATE'),
--   v_TOD_Expiry_Date         CHAR(8)
    case
        when scled = '9999999' then '20991231'
        when scled = '0' then  to_char(to_date(get_date_fm_btrv(get_param('CYYMMDD')),'YYYYMMDD')+1,'YYYYMMDD') --to_char(to_date(get_date_fm_btrv('CYYMMDD'),'YYYYMMDD') + 1,'YYYYMMDD')
       else  get_date_fm_btrv(scled) end,
--   v_TOD_Penal_Start_Date     CHAR(8)
            lpad(' ',8,' '),
--   v_TOD_Advance_Type         CHAR(1)
            'R',
--   v_TOD_Advance_Category     CHAR(1)
            'C',
--   v_TOD_Level_Interest_Flag     CHAR(1)
            'N',
-- v_TOD_Normal_Interest_Percent CHAR(10)
            lpad(' ',10,' '),
-- v_TOD_Penal_Interest_Percent     CHAR(10)
            lpad(' ',10,' '),
-- v_TOD_Availed_Amount         CHAR(17)
            lpad('0',17,' '),
--   v_TOD_Regularized_Amount     CHAR(17)
            lpad(' ',17,' '),
--   v_SOL_ID               CHAR(8)
            rpad(map_acc.fin_sol_id,8,' '),
--   v_CRNCY_CODE           CHAR(3)
            lpad(scpf.scccy,3,' '),
--   v_Entity_Type          CHAR(5)
            'TODMN',
-- v_Free_Text             CHAR(60)
            lpad(' ',60,' ')
      from scpf 
    inner join map_acc on scpf.scab||scpf.scan||scpf.scas = map_acc.LEG_ACC_NUM
    inner join c8pf on c8ccy = scccy
    where schm_type in ('SBA','CAA','ODA')
    and scbal < 0 and scodl >=0; 
  COMMIT;
exit;