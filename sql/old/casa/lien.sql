-- File Name		: Lien.sql

-- File Created for	: Upload file for Lien

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure lien
   as
   v_INDICATOR             varchar2(3);
   v_LIEN_ACCOUNT_NUMBER   varchar2(16);
   v_LIEN_AMOUNT           varchar2(17);
   v_CRNCY_CODE            varchar2(3);
   v_LIEN_REASON_CODE      varchar2(5);
   v_LIEN_START_DATE       varchar2(8);
   v_LIEN_EXPIRY_DATE      varchar2(8);
   v_LIEN_TYPE             varchar2(5);
   v_ACCOUNT_ID            varchar2(16);
   v_SI_CERTIFICATE_NUMBER varchar2(20);
   v_LIMIT_PREFIX          varchar2(12);
   v_LIMIT_SUFFIX          varchar2(5);
   v_DC_NUMBER             varchar2(16);
   v_BG_NUMBER             varchar2(16);
   v_SOL_ID                varchar2(8);
   v_LIEN_REMARKS          varchar2(50);
   
   
--  DECLARE
   CURSOR c1 is
     select 'ALT',
            rpad(map_acc.fin_acc_num,16,' '),
            lpad(to_number((juhamt)/POWER(10,C8CED)),17,' '),
            lpad(scpf.scccy,3,' '),
            rpad(jupf.juhrc,5,' '),
	    to_char(to_date(pack_mig_EQ3.get_date_fm_btrv(jusdte),'DD/MM/YYYY'),'YYYYMMDD'),
	    case
		when juhed = '9999999' then '20990101'
	    else to_char(to_date(pack_mig_EQ3.get_date_fm_btrv(juhed),'DD/MM/YYYY'),'YYYYMMDD') end,
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
	where map_acc.LEG_ACC_NUM=scpf.scab||scpf.scan||scpf.scas
	and map_acc.leg_acc_num = jupf.jubbn||jupf.jubno||jupf.jusfx
	and jupf.juhed > (
			  SELECT
			  to_number(key_value)
			  FROM
			  sys_config
			  WHERE
			  key_string = 'EQ3_BUSINESS_DATE'
			  )
        and rownum <=10;

   
BEGIN

Begin

EXECUTE IMMEDIATE 'truncate table lien_o_table';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_INDICATOR, v_LIEN_ACCOUNT_NUMBER,v_LIEN_AMOUNT,v_CRNCY_CODE,v_LIEN_REASON_CODE,v_LIEN_START_DATE,v_LIEN_EXPIRY_DATE,v_LIEN_TYPE,v_ACCOUNT_ID,v_SI_CERTIFICATE_NUMBER,v_LIMIT_PREFIX,v_LIMIT_SUFFIX,v_DC_NUMBER,v_BG_NUMBER, v_SOL_ID,v_LIEN_REMARKS;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into lien_o_table values (v_INDICATOR, v_LIEN_ACCOUNT_NUMBER,v_LIEN_AMOUNT,v_CRNCY_CODE,v_LIEN_REASON_CODE,v_LIEN_START_DATE,v_LIEN_EXPIRY_DATE,v_LIEN_TYPE,v_ACCOUNT_ID,v_SI_CERTIFICATE_NUMBER,v_LIMIT_PREFIX,v_LIMIT_SUFFIX,v_DC_NUMBER,v_BG_NUMBER, v_SOL_ID,v_LIEN_REMARKS ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;