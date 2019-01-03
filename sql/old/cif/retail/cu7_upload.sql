-- File Name		: cu7_upload.sql

-- File Created for	: Upload file for cu7

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure cu7_load
as 

BEGIN
    begin
      EXECUTE IMMEDIATE 'truncate table CU7_O_TABLE';
    end;


INSERT INTO CU7_O_TABLE(
SELECT 
--     V_ORGKEY	CHAR(50);
MAP_CIF.FIN_CIF_ID,


--     V_GROUPHOUSEHOLDCODE	CHAR(50);
'GRP1404',


--     V_SHAREHOLDING_IN_PERCENTAGE	CHAR(18);
'',


--     V_TEXT1	CHAR(200);
'',


--     V_TEXT2	CHAR(200);
'',


--     V_TEXT3	CHAR(200);
'',


--     V_DATE1	CHAR(17);
'',


--     V_DATE2	CHAR(17);
'',


--     V_DATE3	CHAR(17);
'',


--     V_DROPDOWN1	CHAR(50);
'',


--     V_DROPDOWN2	CHAR(50);
'',


--     V_DROPDOWN3	CHAR(50);
'',


--     V_LOOKUP1	CHAR(50);
'',


--     V_LOOKUP2	CHAR(50);
'',


--     V_LOOKUP3	CHAR(50);
'',


--     V_GROUPHOUSEHOLDNAME	CHAR(200);
'CDCC',


--     V_BANK_ID	CHAR(8);
'01',


--     V_GROUP_ID	CHAR(1);
'',


--     V_PRIMARY_GROUP_INDICATOR	CHAR(1);
''

FROM MAP_CIF
inner join gfpf on map_cif.leg_cust_number = gfpf.gfcus
    left join map_cif_type on leg_cust_type_code = gfpf.gfctp
    where map_cif_type.leg_cust_type ='Individual'
    and map_cif.fin_sol_id='0006');

commit;
END;