-- File Name		: cu6phone_upload.sql

-- File Created for	: Upload file for cu6phone

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure cu6_load
as

BEGIN
   	 begin
	      EXECUTE IMMEDIATE 'truncate table CU6PHONE_O_TABLE';
	 end;



INSERT INTO CU6PHONE_O_TABLE( select 


--     v_ORGKEY	CHAR(32);
MAP_CIF.FIN_CIF_ID,


--     v_PHONEEMAILTYPE	CHAR(200);
'CELLPH',


--     v_PHONEOREMAIL	CHAR(50);
'PHONE',


--     v_PHONE_NO	CHAR(25);
'9999999999',


--     v_PHONENOLOCALCODE	CHAR(20);
'099',


--     v_PHONENOCITYCODE	CHAR(20);
'099',


--     v_PHONENOCOUNTRYCODE	CHAR(20);
'0091',


--     v_WORKEXTENSION	CHAR(30);
'',


--     v_EMAIL	CHAR(50);
'',


--     v_EMAILPALM	CHAR(50);
'',


--     v_URL	CHAR(150);
'',


--     v_PREFERRED_FLAG	CHAR(50);
'N',


--     v_START_DATE	CHAR(17);
       
	case when pack_mig_eq3.get_date_fm_btrv(GFPF.GFCOD) <> 'ERROR'  then
		to_char(to_date(to_char(pack_mig_eq3.get_date_fm_btrv(GFPF.GFCOD)),'DD-MM-YYYY'),'DD-MON-YYYY')   -- Req Format : DD-Mon-YYYY, But now its DD-MM-YYYY
	else ''
end,


--     v_END_DATE	CHAR(17);
'31-DEC-2099',


--     v_USERFIELD1	CHAR(200);
'',


--     v_USERFIELD2	CHAR(200);
'',


--     v_USERFIELD3	CHAR(200);

'',


--     v_DATE1	CHAR(17);

'',


--     v_DATE2	CHAR(17);
'',


--     v_DATE3	CHAR(17);
'',


--     v_BANK_ID	CHAR(8);
'01'

from  map_cif inner join gfpf on map_cif.leg_cust_number = gfpf.gfcus
    left join map_cif_type on leg_cust_type_code = gfpf.gfctp
    where map_cif_type.leg_cust_type ='Individual'
    and map_cif.fin_sol_id='0006');


commit;
END;