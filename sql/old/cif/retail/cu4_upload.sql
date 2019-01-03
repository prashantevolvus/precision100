-- File Name		: cu4_upload.sql

-- File Created for	: Upload file for cu4

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure cu4_load
as

BEGIN
   	 begin
	      EXECUTE IMMEDIATE 'truncate table CU4_O_TABLE';
	 end;



INSERT
INTO CU4_O_TABLE
  (  SELECT 
    
--    V_ORGKEY			CHAR(50);
MAP_CIF.FIN_CIF_ID,


--    V_CHILDENTITY		CHAR(50);
'CUSTOMER',


--    V_CHILDENTITYID		CHAR(32);
MAP_CIF.FIN_CIF_ID,



--    V_RELATIONSHIP		CHAR(50);
'Father',


--    V_TITLE			CHAR(5);
'MR.',


--    V_FIRSTNAME		CHAR(80);
'',


--    V_MIDDLENAME		CHAR(80);
'',


--    V_LASTNAME		CHAR(80);
gfpf.gfcun,


--    V_DOB			CHAR(17);
'',


--    V_GENDER			CHAR(10);
'',


--    V_ISDEPENDANT		CHAR(1);
'',



--    V_GAURDIANTYPE		CHAR(50);
'OTH', 


--    V_ISPRIMARY		CHAR(1);
'Y',


--    V_HOUSE_NO		CHAR(10);
'',


--    V_PREMISE_NAME		CHAR(50);
'',


--    V_BUILDING_LEVEL		CHAR(10);
'',


--    V_STREET_NO		CHAR(50);
'',


--    V_STREET_NAME		CHAR(50);
'',


--    V_SUBURB			CHAR(50);
'',


--    V_LOCALITY_NAME		CHAR(50);
'',


--    V_TOWN			CHAR(50);
'',


--    V_DOMICILE		CHAR(50);
'',


--    V_CITY_CODE		CHAR(5);
'DOMEN',


--    V_STATE_CODE		CHAR(5);
'USA',


--    V_ZIP			CHAR(100);
'470072',


--    V_COUNTRY_CODE		CHAR(5);
'INDIA',


--    V_STATUS_CODE		CHAR(5);
'',


--    V_NEWCONTACTSKEY		CHAR(38);
'',


--    V_CIF_ID			CHAR(32);
'',


--    V_START_DATE		CHAR(17);
'',


--    V_PERCENTAGE_BENEFITTED	CHAR(6);
'',


--    V_PHONENO1LOCALCODE	CHAR(20);
'',


--    V_PHONENO1CITYCODE	CHAR(20);
'',


--    V_PHONENO1COUNTRYCODE	CHAR(20);
'',


--    V_WORKEXTENSION		CHAR(20);
'',


--    V_PHONENO2LOCALCODE	CHAR(20);
'',


--    V_PHONENO2CITYCODE	CHAR(20);
'',


--    V_PHONENO2COUNTRYCODE	CHAR(20);
'',


--    V_TELEXLOCALCODE		CHAR(20);
'',


--    V_TELEXCITYCODE		CHAR(20);
'',


--    V_TELEXCOUNTRYCODE	CHAR(20);
'',


--    V_FAXNOLOCALCODE		CHAR(20);
'',


--    V_FAXNOCITYCODE		CHAR(20);
'',


--    V_FAXNOCOUNTRYCODE	CHAR(20);
'',


--    V_PAGERNOLOCALCODE	CHAR(20);
'',


--    V_PAGERNOCITYCODE		CHAR(20);
'',


--    V_PAGERNOCOUNTRYCODDE	CHAR(20);
'',


--    V_EMAIL			CHAR(50);
'',


--    V_CHILDENTITYTYPE		CHAR(50);
'Retail',


--    V_BEN_OWN_KEY		CHAR(50);
'',


--    V_BANK_ID			CHAR(8);
'01',


--    V_RELATIONSHIP_ALT1	CHAR(50);
'',


--    V_RELATIONSHIP_CATEGORY	CHAR(99);
''


from map_cif inner join gfpf on map_cif.leg_cust_number = gfpf.gfcus
    left join map_cif_type on leg_cust_type_code = gfpf.gfctp
    where map_cif_type.leg_cust_type ='Individual'
    and map_cif.fin_sol_id='0006');


commit;
END;