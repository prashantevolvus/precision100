-- File Name		: cu4_upload.sql
-- File Created for	: Upload file for cu4
-- Created By		: Ashok Kumar.S
-- Client		: Indus Ind Bank
-- Created On		: 01-11-2011
-------------------------------------------------------------------
truncate table CU4_O_TABLE;
	 
INSERT
INTO CU4_O_TABLE
  (  SELECT 
--    V_ORGKEY            CHAR(50)
'GUARDIAN',
--    V_CHILDENTITY        CHAR(50)
'CUSTOMER',
--    V_CHILDENTITYID        CHAR(32)
MAP_CIF.FIN_CIF_ID,
--    V_RELATIONSHIP        CHAR(50)
'NGU',
--    V_TITLE            CHAR(5)
'',
--    V_FIRSTNAME        CHAR(80)
'',
--    V_MIDDLENAME        CHAR(80)
'',
--    V_LASTNAME        CHAR(80)
'',
--    V_DOB            CHAR(17)
'',
--    V_GENDER            CHAR(10)
'',
--    V_ISDEPENDANT        CHAR(1)
'',
--    V_GAURDIANTYPE        CHAR(50)
'D', 
--    V_ISPRIMARY        CHAR(1)
'',
--    V_HOUSE_NO        CHAR(10)
'',
--    V_PREMISE_NAME        CHAR(50)
'',
--    V_BUILDING_LEVEL        CHAR(10)
'',
--    V_STREET_NO        CHAR(50)
'',
--    V_STREET_NAME        CHAR(50)
'',
--    V_SUBURB            CHAR(50)
'',
--    V_LOCALITY_NAME        CHAR(50)
'',
--    V_TOWN            CHAR(50)
'',
--    V_DOMICILE        CHAR(50)
'',
--    V_CITY_CODE        CHAR(5)
'',
--    V_STATE_CODE        CHAR(5)
'',
--    V_ZIP            CHAR(100)
'',
--    V_COUNTRY_CODE        CHAR(5)
'',
--    V_STATUS_CODE        CHAR(5)
'',
--    V_NEWCONTACTSKEY        CHAR(38)
'',
--    V_CIF_ID            CHAR(32)
'',
--    V_START_DATE        CHAR(17)
'',
--    V_PERCENTAGE_BENEFITTED    CHAR(6)
'',
--    V_PHONENO1LOCALCODE    CHAR(20)
'',
--    V_PHONENO1CITYCODE    CHAR(20)
'',
--    V_PHONENO1COUNTRYCODE    CHAR(20)
'',
--    V_WORKEXTENSION        CHAR(20)
'',
--    V_PHONENO2LOCALCODE    CHAR(20)
'',
--    V_PHONENO2CITYCODE    CHAR(20)
'',
--    V_PHONENO2COUNTRYCODE    CHAR(20)
'',
--    V_TELEXLOCALCODE        CHAR(20)
'',
--    V_TELEXCITYCODE        CHAR(20)
'',
--    V_TELEXCOUNTRYCODE    CHAR(20)
'',
--    V_FAXNOLOCALCODE        CHAR(20)
'',
--    V_FAXNOCITYCODE        CHAR(20)
'',
--    V_FAXNOCOUNTRYCODE    CHAR(20)
'',
--    V_PAGERNOLOCALCODE    CHAR(20)
'',
--    V_PAGERNOCITYCODE        CHAR(20)
'',
--    V_PAGERNOCOUNTRYCODDE    CHAR(20)
'',
--    V_EMAIL            CHAR(50)
'',
--    V_CHILDENTITYTYPE        CHAR(50)
'Retail',
--    V_BEN_OWN_KEY        CHAR(50)
'',
--    V_BANK_ID            CHAR(8)
get_param('BANK_ID'),
--    V_RELATIONSHIP_ALT1    CHAR(50)
'',
--    V_RELATIONSHIP_CATEGORY    CHAR(99)
''
from migr_customer_retail
inner join map_cif on gfcpnc = leg_cust_number
inner join bgpf on bgcus = gfcpnc
where check_minor(BGIDOB) = 'Y');
commit;
exit;
