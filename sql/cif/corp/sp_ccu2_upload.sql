-- File Name        : cu2_upload.sql

-- File Created for    : Upload file for cu2

-- Created By        : Ashok Kumar.S

-- Client        : Indus Ind Bank

-- Created On        : 01-11-2011
-------------------------------------------------------------------

create or replace
procedure corpcu2_load
is
    Cursor Cur_addr is 
    select sxcus , svseq , svna1 , svna2 , svna3 , svna4 , svna5 , svpzip , gfcod , fin_cif_id 
    from migr_addr
    inner join map_cif on sxcus = LEG_CUST_NUMBER where individual = 'N'  order by sxCus;
      
    cust varchar2(100) := '';
    counter number;
    addtype varchar2(20);
    
BEGIN
        begin
          EXECUTE IMMEDIATE 'truncate table CU2CROP_O_TABLE';
     end;
    counter := 1;
     For g in Cur_addr Loop
        if cust = g.sxcus then
            counter := counter + 1;
        else
            counter := 1;
        end if;
        if counter < 6 then 
            addtype := 'AC Add' || counter;
        end if;
        cust := g.sxcus;
            
            
         
         INSERT
INTO CU2CROP_O_TABLE
values ( 
--   CORP_KEY         CHAR(50) NULL,
    g.fin_cif_id,
--   CIF_ID         CHAR(32) NULL,
    g.fin_cif_id,
-- CORP_REP_KEY         CHAR(38) NULL,
    '',
--   ADDRESSCATEGORY       CHAR(100) NULL,
    addtype,
--   START_DATE         CHAR(17) NULL,
    case when get_date_fm_btrv(g.GFCOD) <> 'ERROR'  then
          to_char(to_date(to_char(get_date_fm_btrv(g.GFCOD)),'YYYYMMDD'),'DD-MON-YYYY') 
     else ''
end, 
--   PhoneNo1LocalCode     CHAR(20) NULL,
    '',
--   PhoneNo1CityCode     CHAR(20) NULL,
    '',
-- PhoneNo1CountryCode      CHAR(20) NULL,
    '',
--   PhoneNo2LocalCode     CHAR(20) NULL,
    '',
--   PhoneNo2CityCode     CHAR(20) NULL,
    '',
--  PhoneNo2CountryCode     CHAR(20) NULL,
    '',
--   FaxNoLocalCode     CHAR(20) NULL,
    '',
--   FaxNoCityCode       CHAR(20) NULL,
    '',
--   FaxNoCountryCode     CHAR(20) NULL,
    '',
--   Email         CHAR(50) NULL,
    '',
--   PagerNoLocalCode       CHAR(20) NULL,
    '',
--   PagerNoCityCode     CHAR(20) NULL,
    '',
--   PagerNoCountryCode     CHAR(20) NULL,
    '',
--   TelexLocalCode     CHAR(20) NULL,
    '',
--   TelexCityCode     CHAR(20) NULL,
    '',
--   TelexCountryCode     CHAR(20) NULL,
    '',
--   HOUSE_NO         CHAR(10) NULL,
    '',
-- PREMISE_NAME         CHAR(50) NULL,
    '',
--   BUILDING_LEVEL     CHAR(10) NULL,
    '',
--   STREET_NO         CHAR(50) NULL,
    '',
-- STREET_NAME         CHAR(50) NULL,
    '',
--   SUBURB         CHAR(50) NULL,
    '',
--   LOCALITY_NAME     CHAR(50) NULL,
    '',
-- TOWN             CHAR(50) NULL,
    '',
--   DOMICILE         CHAR(50) NULL,
    '',
--   CITY_CODE         CHAR(100) NULL,
    '.',
--   STATE_CODE         CHAR(100) NULL,
    'NA',
--  ZIP             CHAR(100) NULL,
    g.svpzip,  
-- COUNTRY_CODE         CHAR(100) NULL,
    '.',
--   SMALL_STR1         CHAR(50) NULL,
    '',
--   SMALL_STR2         CHAR(50) NULL,
    '',
--   SMALL_STR3         CHAR(50) NULL,
    '',
--   SMALL_STR4         CHAR(50) NULL,
    '',
--   SMALL_STR5         CHAR(50) NULL,
    '',
--   SMALL_STR6         CHAR(50) NULL,
    '',
--   SMALL_STR7         CHAR(50) NULL,
    '',
--   SMALL_STR8         CHAR(50) NULL,
    '',
--   SMALL_STR9         CHAR(50) NULL,
    '',
--  SMALL_STR10         CHAR(50) NULL,
    '',
--   MED_STR1         CHAR(100) NULL,
    '',
--   MED_STR2         CHAR(100) NULL,
    '',
--   MED_STR3         CHAR(100) NULL,
    '',
--   MED_STR4         CHAR(100) NULL,
    '',
--   MED_STR5         CHAR(100) NULL,
    '',
--   MED_STR6         CHAR(100) NULL,
    '',
--   MED_STR7         CHAR(100) NULL,
    '',
--   MED_STR8         CHAR(100) NULL,
    '',
--   MED_STR9         CHAR(100) NULL,
    '',
--   MED_STR10         CHAR(100) NULL,
    '',
--   LARGE_STR1         CHAR(250) NULL,
    '',
--   LARGE_STR2         CHAR(250) NULL,
    '',
--   LARGE_STR3         CHAR(250) NULL,
    '',
--   LARGE_STR4         CHAR(250) NULL,
    '',
--   LARGE_STR5         CHAR(250) NULL,
    '',
--   DATE1         CHAR(17) NULL,
    '',
--   DATE2         CHAR(17) NULL,
    '',
--   DATE3         CHAR(17) NULL,
    '',
--   DATE4         CHAR(17) NULL,
    '',
--   DATE5         CHAR(17) NULL,
    '',
--   DATE6         CHAR(17) NULL,
    '',
--   DATE7         CHAR(17) NULL,
    '',
--   DATE8         CHAR(17) NULL,
    '',
--   DATE9         CHAR(17) NULL,
    '',
--   DATE10         CHAR(17) NULL,
    '',
--   NUMBER1         CHAR(38) NULL,
    '',
--   NUMBER2         CHAR(38) NULL,
    '',
--   NUMBER3         CHAR(38) NULL,
    '',
--   NUMBER4         CHAR(38) NULL,
    '',
--   NUMBER5         CHAR(38) NULL,
    '',
--   NUMBER6         CHAR(38) NULL,
    '',
--   NUMBER7         CHAR(38) NULL,
    '',
--   NUMBER8         CHAR(38) NULL,
    '',
--   NUMBER9         CHAR(38) NULL,
    '',
--   NUMBER10         CHAR(38) NULL,
    '',
--   DECIMAL1         CHAR(25) NULL,
    '',
--   DECIMAL2         CHAR(25) NULL,
    '',
--   DECIMAL3         CHAR(25) NULL,
    '',
--   DECIMAL4         CHAR(25) NULL,
    '',
--   DECIMAL5         CHAR(25) NULL,
    '',
--   DECIMAL6         CHAR(25) NULL,
    '',
--   DECIMAL7         CHAR(25) NULL,
    '',
--   DECIMAL8         CHAR(25) NULL,
    '',
--   DECIMAL9         CHAR(25) NULL,
    '',
--   DECIMAL10         CHAR(25) NULL,
    '',
--   preferredAddrss     CHAR(50) NULL,
'N',
--  HoldMailInitiatedBy     CHAR(20) NULL,
    '',
-- HoldMailFlag         CHAR(50) NULL,
    '',
--   BusinessCenter     CHAR(50) NULL,
    '',
--   HoldMailReason     CHAR(200) NULL,
    '',
--   PreferredFormat     CHAR(50) NULL,
    'FREE_TEXT_FORMAT',   
--   FreeTextAddress     CHAR(2000) NULL,
    '',
--   FreeTextLabel     CHAR(200) NULL,
    'MIGRATED',
--   ADDRESS_PROOF_RCVD     CHAR(1) NULL,
    '',
--   LASTUPDATE_DATE     CHAR(17) NULL,
    '',
--   ADDRESS_LINE1     CHAR(45) NULL,
    g.svna2, 
--   ADDRESS_LINE2     CHAR(45) NULL,
    g.svna3, 
--   ADDRESS_LINE3     CHAR(45) NULL,
    g.svna4, 
--   BANK_ID         CHAR(8) NULL   
       get_param('BANK_ID')                                       -- MAPPING TABLE REQUIRED
);

end loop;
commit;
--Structured Dummy address
INSERT
INTO CU2CROP_O_TABLE
select 
--   CORP_KEY         CHAR(50) NULL,
    fin_cif_id,
--   CIF_ID         CHAR(32) NULL,
    fin_cif_id,
-- CORP_REP_KEY         CHAR(38) NULL,
    '',
--   ADDRESSCATEGORY       CHAR(100) NULL,
    'Registered',
--   START_DATE         CHAR(17) NULL,
    case when get_date_fm_btrv(GFCOD) <> 'ERROR'  then
          to_char(to_date(to_char(get_date_fm_btrv(GFCOD)),'YYYYMMDD'),'DD-MON-YYYY') 
     else ''
end, 
--   PhoneNo1LocalCode     CHAR(20) NULL,
    '',
--   PhoneNo1CityCode     CHAR(20) NULL,
    '',
-- PhoneNo1CountryCode      CHAR(20) NULL,
    '',
--   PhoneNo2LocalCode     CHAR(20) NULL,
    '',
--   PhoneNo2CityCode     CHAR(20) NULL,
    '',
--  PhoneNo2CountryCode     CHAR(20) NULL,
    '',
--   FaxNoLocalCode     CHAR(20) NULL,
    '',
--   FaxNoCityCode       CHAR(20) NULL,
    '',
--   FaxNoCountryCode     CHAR(20) NULL,
    '',
--   Email         CHAR(50) NULL,
    '',
--   PagerNoLocalCode       CHAR(20) NULL,
    '',
--   PagerNoCityCode     CHAR(20) NULL,
    '',
--   PagerNoCountryCode     CHAR(20) NULL,
    '',
--   TelexLocalCode     CHAR(20) NULL,
    '',
--   TelexCityCode     CHAR(20) NULL,
    '',
--   TelexCountryCode     CHAR(20) NULL,
    '',
--   HOUSE_NO         CHAR(10) NULL,
    '.',
-- PREMISE_NAME         CHAR(50) NULL,
    '.',
--   BUILDING_LEVEL     CHAR(10) NULL,
    '.',
--   STREET_NO         CHAR(50) NULL,
    '.',
-- STREET_NAME         CHAR(50) NULL,
    '.',
--   SUBURB         CHAR(50) NULL,
    '.',
--   LOCALITY_NAME     CHAR(50) NULL,
    '.',
-- TOWN             CHAR(50) NULL,
    '.',
--   DOMICILE         CHAR(50) NULL,
    '.',
--   CITY_CODE         CHAR(100) NULL,
    '.',
--   STATE_CODE         CHAR(100) NULL,
    'NA',
--  ZIP             CHAR(100) NULL,
    '9999',  
-- COUNTRY_CODE         CHAR(100) NULL,
    convert_codes('CNTRY',nvl(gfcnap,gfcnal)),
--   SMALL_STR1         CHAR(50) NULL,
    '',
--   SMALL_STR2         CHAR(50) NULL,
    '',
--   SMALL_STR3         CHAR(50) NULL,
    '',
--   SMALL_STR4         CHAR(50) NULL,
    '',
--   SMALL_STR5         CHAR(50) NULL,
    '',
--   SMALL_STR6         CHAR(50) NULL,
    '',
--   SMALL_STR7         CHAR(50) NULL,
    '',
--   SMALL_STR8         CHAR(50) NULL,
    '',
--   SMALL_STR9         CHAR(50) NULL,
    '',
--  SMALL_STR10         CHAR(50) NULL,
    '',
--   MED_STR1         CHAR(100) NULL,
    '',
--   MED_STR2         CHAR(100) NULL,
    '',
--   MED_STR3         CHAR(100) NULL,
    '',
--   MED_STR4         CHAR(100) NULL,
    '',
--   MED_STR5         CHAR(100) NULL,
    '',
--   MED_STR6         CHAR(100) NULL,
    '',
--   MED_STR7         CHAR(100) NULL,
    '',
--   MED_STR8         CHAR(100) NULL,
    '',
--   MED_STR9         CHAR(100) NULL,
    '',
--   MED_STR10         CHAR(100) NULL,
    '',
--   LARGE_STR1         CHAR(250) NULL,
    '',
--   LARGE_STR2         CHAR(250) NULL,
    '',
--   LARGE_STR3         CHAR(250) NULL,
    '',
--   LARGE_STR4         CHAR(250) NULL,
    '',
--   LARGE_STR5         CHAR(250) NULL,
    '',
--   DATE1         CHAR(17) NULL,
    '',
--   DATE2         CHAR(17) NULL,
    '',
--   DATE3         CHAR(17) NULL,
    '',
--   DATE4         CHAR(17) NULL,
    '',
--   DATE5         CHAR(17) NULL,
    '',
--   DATE6         CHAR(17) NULL,
    '',
--   DATE7         CHAR(17) NULL,
    '',
--   DATE8         CHAR(17) NULL,
    '',
--   DATE9         CHAR(17) NULL,
    '',
--   DATE10         CHAR(17) NULL,
    '',
--   NUMBER1         CHAR(38) NULL,
    '',
--   NUMBER2         CHAR(38) NULL,
    '',
--   NUMBER3         CHAR(38) NULL,
    '',
--   NUMBER4         CHAR(38) NULL,
    '',
--   NUMBER5         CHAR(38) NULL,
    '',
--   NUMBER6         CHAR(38) NULL,
    '',
--   NUMBER7         CHAR(38) NULL,
    '',
--   NUMBER8         CHAR(38) NULL,
    '',
--   NUMBER9         CHAR(38) NULL,
    '',
--   NUMBER10         CHAR(38) NULL,
    '',
--   DECIMAL1         CHAR(25) NULL,
    '',
--   DECIMAL2         CHAR(25) NULL,
    '',
--   DECIMAL3         CHAR(25) NULL,
    '',
--   DECIMAL4         CHAR(25) NULL,
    '',
--   DECIMAL5         CHAR(25) NULL,
    '',
--   DECIMAL6         CHAR(25) NULL,
    '',
--   DECIMAL7         CHAR(25) NULL,
    '',
--   DECIMAL8         CHAR(25) NULL,
    '',
--   DECIMAL9         CHAR(25) NULL,
    '',
--   DECIMAL10         CHAR(25) NULL,
    '',
--   preferredAddrss     CHAR(50) NULL,
'Y',
--  HoldMailInitiatedBy     CHAR(20) NULL,
    '',
-- HoldMailFlag         CHAR(50) NULL,
    '',
--   BusinessCenter     CHAR(50) NULL,
    '',
--   HoldMailReason     CHAR(200) NULL,
    '',
--   PreferredFormat     CHAR(50) NULL,
    'STRUCTURED_FORMAT',   
--   FreeTextAddress     CHAR(2000) NULL,
    '',
--   FreeTextLabel     CHAR(200) NULL,
    '',
--   ADDRESS_PROOF_RCVD     CHAR(1) NULL,
    '',
--   LASTUPDATE_DATE     CHAR(17) NULL,
    '',
--   ADDRESS_LINE1     CHAR(45) NULL,
    '', 
--   ADDRESS_LINE2     CHAR(45) NULL,
    '', 
--   ADDRESS_LINE3     CHAR(45) NULL,
    '', 
--   BANK_ID         CHAR(8) NULL   
       get_param('BANK_ID')                                       -- MAPPING TABLE REQUIRED
 from map_cif 
inner join migr_customer on leg_cust_number = gfcpnc
where individual = 'N';
commit;

END;

/
exit;