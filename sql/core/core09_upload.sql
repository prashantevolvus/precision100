-- File Name		: TOD

-- File Created for	: Upload file for balance

-- Created By		: Prashant

-- Client		: ENBD

-- Created On		: 01-11-2011
-------------------------------------------------------------------
truncate table LIEN_O_TABLE ;
insert into LIEN_O_TABLE 
     select 'ALT',
            rpad(map_acc.fin_acc_num,16,' '),
            lpad(to_number((juhamt)/POWER(10,C8CED)),17,' '),
            lpad(scpf.scccy,3,' '),
            lpad(convert_codes('LIEN',rpad(jupf.juhrc,5,' ')),5,' '),
            --get_date_fm_btrv(jusdte)),
            case when get_date_fm_btrv(jusdte) <> 'ERROR' then lpad(get_date_fm_btrv(jusdte),8,' ') else lpad(' ',8,' ') end,
        case
        when juhed = '9999999' then '20990101'
        else get_date_fm_btrv(juhed) end,
            'ULIEN',
            lpad(' ',16,' '),
            lpad(' ',20,' '),
            lpad(' ',12,' '),
            lpad(' ',5,' '),
            lpad(' ',16,' '),
            lpad(' ',16,' '),
            rpad(map_acc.fin_sol_id,8,' '),
            rpad(jupf.juaco,50,' ')
      from map_acc
  inner join jupf on jupf.jubbn||jupf.jubno||jupf.jusfx = map_acc.LEG_ACC_NUM
  inner join scpf on scpf.scab||scpf.scan||scpf.scas = map_acc.LEG_ACC_NUM
    inner join c8pf on c8ccy = scccy
    where  jupf.juhed > get_param('CYYMMDD');
	COMMIT;
exit;