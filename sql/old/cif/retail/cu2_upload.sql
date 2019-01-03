-- File Name		: cu2_upload.sql

-- File Created for	: Upload file for cu2

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure cu2_load
as

BEGIN
   	 begin
	      EXECUTE IMMEDIATE 'truncate table CU2_O_TABLE';
	 end;


INSERT
INTO CU2_O_TABLE
  ( SELECT 
--   v_ORGKEY  			 CHAR(32);
MAP_CIF.FIN_CIF_ID,

--   v_ADDRESSCATEGORY		 CHAR(100);
'Work',                             -- MAPPING TABLE REQUIRED

--   v_START_DATE 		 CHAR(17);
case when pack_mig_eq3.get_date_fm_btrv(GFPF.GFCOD) <> 'ERROR'  then
          to_char(to_date(to_char(pack_mig_eq3.get_date_fm_btrv(GFPF.GFCOD)),'DD-MM-YYYY'),'DD-MON-YYYY') 
     else ''
end,                             -- MAPPING TABLE REQUIRED

--   v_PhoneNo1LocalCode  	 CHAR(20);
'',                             -- DEFAULT SET TO BLANK

--   v_PhoneNo1CityCode		 CHAR(20);
'',                             -- DEFAULT SET TO BLANK

--   v_PhoneNo1CountryCode	 CHAR(20);
'',                             -- DEFAULT SET TO BLANK

--   v_PhoneNo2LocalCode	 CHAR(20);
'',                             -- DEFAULT SET TO BLANK

--   v_PhoneNo2CityCode  	 CHAR(20);
'',                             -- DEFAULT SET TO BLANK

--   v_PhoneNo2CountryCode 	 CHAR(20);
'',                             -- DEFAULT SET TO BLANK

--   v_WorkExtension		 CHAR(10);
'',                             -- DEFAULT SET TO BLANK

--   v_FaxNoLocalCode		 CHAR(20);
'',                             -- DEFAULT SET TO BLANK

--   v_FaxNoCityCode		 CHAR(20);
'',                             -- DEFAULT SET TO BLANK

--   v_FaxNoCountryCode  	 CHAR(20);
'',                             -- DEFAULT SET TO BLANK

--   v_Email  			 CHAR(50);
'',                             -- DEFAULT SET TO BLANK

--   v_PagerNoLocalCode  	 CHAR(20);
'',                             -- DEFAULT SET TO BLANK

--   v_PagerNoCityCode	 	 CHAR(20);
'',                             -- DEFAULT SET TO BLANK

--   v_PagerNoCountryCode	 CHAR(20);
'',                             -- DEFAULT SET TO BLANK

--   v_TelexLocalCode	         CHAR(20);
'',                             -- DEFAULT SET TO BLANK

--   v_TelexCityCode	 	 CHAR(20);
'',                             -- DEFAULT SET TO BLANK

--   v_TelexCountryCode		 CHAR(20);
'',                             -- DEFAULT SET TO BLANK

--   v_HOUSE_NO		 	 CHAR(10);
'',                             -- DEFAULT SET TO BLANK

--   v_PREMISE_NAME		 CHAR(50);
'',                             -- DEFAULT SET TO BLANK

--   v_BUILDING_LEVEL		 CHAR(10);
'',                             -- DEFAULT SET TO BLANK

--   v_STREET_NO		 CHAR(50);
'',                             -- DEFAULT SET TO BLANK

--   v_STREET_NAME		 CHAR(50);
'',                             -- DEFAULT SET TO BLANK

--   v_SUBURB			 CHAR(50);
'',                             -- DEFAULT SET TO BLANK

--   v_LOCALITY_NAME	 	 CHAR(50);
'',                             -- DEFAULT SET TO BLANK

--   v_TOWN			 CHAR(50);
'',                             -- DEFAULT SET TO BLANK

--   v_DOMICILE			 CHAR(50);
'',                             -- DEFAULT SET TO BLANK

--   v_CITY_CODE		 CHAR(100);
'DOMEN',                             -- MAPPING TABLE REQUIRED

--   v_STATE_CODE		 CHAR(100);
'USA',                             -- MAPPING TABLE REQUIRED

--   v_ZIP		  	 CHAR(100);
'470072',                             -- MAPPING TABLE REQUIRED

--   v_COUNTRY_CODE	 	 CHAR(100);
'INDIA',                             -- MAPPING TABLE REQUIRED

--   v_ADDRESS_LINE1	 	 CHAR(45);
'',                             -- DEFAULT SET TO BLANK

--   v_ADDRESS_LINE2		 CHAR(45);
'',
                                 -- DEFAULT SET TO BLANK

--   v_ADDRESS_LINE3		 CHAR(45);
'',                             -- DEFAULT SET TO BLANK

--   v_END_DATE			 CHAR(17);
'31-DEC-2099',                     -- DEFAULT SET TO 12/31/2099

--   v_SMALL_STR1		 CHAR(50);
'',                                         -- DEFAULT SET TO BLANK

--   v_SMALL_STR2		 CHAR(50);
'',                                         -- DEFAULT SET TO BLANK

--   v_SMALL_STR3		 CHAR(50);
'',                                         -- DEFAULT SET TO BLANK

--   v_SMALL_STR4		 CHAR(50);
'',                                         -- DEFAULT SET TO BLANK

--   v_SMALL_STR5		 CHAR(50);
'',                                         -- DEFAULT SET TO BLANK

--   v_SMALL_STR6		 CHAR(50);
'',                                         -- DEFAULT SET TO BLANK

--   v_SMALL_STR7		 CHAR(50);
'',                                         -- DEFAULT SET TO BLANK

--   v_SMALL_STR8		 CHAR(50);
'',                                         -- DEFAULT SET TO BLANK

--   v_SMALL_STR9		 CHAR(50);
'',                                         -- DEFAULT SET TO BLANK

--   v_SMALL_STR10		 CHAR(50);
'',                                         -- DEFAULT SET TO BLANK

--   v_MED_STR1			 CHAR(100);
'',                                         -- DEFAULT SET TO BLANK

--   v_MED_STR2			 CHAR(100);
'',                                         -- DEFAULT SET TO BLANK

--   v_MED_STR3			 CHAR(100);
'',                                         -- DEFAULT SET TO BLANK

--   v_MED_STR4			 CHAR(100);
'',                                         -- DEFAULT SET TO BLANK

--   v_MED_STR5			 CHAR(100);
'',                                         -- DEFAULT SET TO BLANK

--   v_MED_STR6			 CHAR(100);
'',                                         -- DEFAULT SET TO BLANK

--   v_MED_STR7			 CHAR(100);
'',                                         -- DEFAULT SET TO BLANK

--   v_MED_STR8			 CHAR(100);
'',                                         -- DEFAULT SET TO BLANK

--   v_MED_STR9			 CHAR(100);
'',                                         -- DEFAULT SET TO BLANK

--   v_MED_STR10		 CHAR(100);
'',                                         -- DEFAULT SET TO BLANK

--   v_LARGE_STR1		 CHAR(250);
'',                                         -- DEFAULT SET TO BLANK

--   v_LARGE_STR2		 CHAR(250);
'',                                         -- DEFAULT SET TO BLANK

--   v_LARGE_STR3		 CHAR(250);
'',                                         -- DEFAULT SET TO BLANK

--   v_LARGE_STR4		 CHAR(250);
'',                                         -- DEFAULT SET TO BLANK

--   v_LARGE_STR5		 CHAR(250);
'',                                         -- DEFAULT SET TO BLANK

--   v_DATE1			 CHAR(17);
'',                                         -- DEFAULT SET TO BLANK

--   v_DATE2			 CHAR(17);
'',                                         -- DEFAULT SET TO BLANK

--   v_DATE3			 CHAR(17);
'',                                         -- DEFAULT SET TO BLANK

--   v_DATE4			 CHAR(17);
'',                                         -- DEFAULT SET TO BLANK

--   v_DATE5			 CHAR(17);
'',                                         -- DEFAULT SET TO BLANK

--   v_DATE6			 CHAR(17);
'',                                         -- DEFAULT SET TO BLANK

--   v_DATE7			 CHAR(17);
'',                                         -- DEFAULT SET TO BLANK

--   v_DATE8			 CHAR(17);
'',                                         -- DEFAULT SET TO BLANK

--   v_DATE9			 CHAR(17);
'',                                         -- DEFAULT SET TO BLANK

--   v_DATE10			 CHAR(17);
'',                                         -- DEFAULT SET TO BLANK

--   v_NUMBER1			 CHAR(38);
'',                                         -- DEFAULT SET TO BLANK

--   v_NUMBER2			 CHAR(38);
'',                                         -- DEFAULT SET TO BLANK

--   v_NUMBER3			 CHAR(38);
'',                                         -- DEFAULT SET TO BLANK

--   v_NUMBER4			 CHAR(38);
'',                                         -- DEFAULT SET TO BLANK

--   v_NUMBER5			 CHAR(38);
'',                                         -- DEFAULT SET TO BLANK

--   v_NUMBER6			 CHAR(38);
'',                                         -- DEFAULT SET TO BLANK

--   v_NUMBER7			 CHAR(38);
'',                                         -- DEFAULT SET TO BLANK

--   v_NUMBER8			 CHAR(38);
'',                                         -- DEFAULT SET TO BLANK

--   v_NUMBER9			 CHAR(38);
'',                                         -- DEFAULT SET TO BLANK

--   v_NUMBER10			 CHAR(38);
'',                                         -- DEFAULT SET TO BLANK

--   v_DECIMAL1			 CHAR(25);
'',                                         -- DEFAULT SET TO BLANK

--   v_DECIMAL2			 CHAR(25);
'',                                         -- DEFAULT SET TO BLANK

--   v_DECIMAL3			 CHAR(25);
'',                                         -- DEFAULT SET TO BLANK

--   v_DECIMAL4			 CHAR(25);
'',                                         -- DEFAULT SET TO BLANK

--   v_DECIMAL5			 CHAR(25);
'',                                         -- DEFAULT SET TO BLANK

--   v_DECIMAL6			 CHAR(25);
'',                                         -- DEFAULT SET TO BLANK

--   v_DECIMAL7			 CHAR(25);
'',                                         -- DEFAULT SET TO BLANK

--   v_DECIMAL8			 CHAR(25);
'',                                         -- DEFAULT SET TO BLANK

--   v_DECIMAL9			 CHAR(25);
'',                                         -- DEFAULT SET TO BLANK

--   v_DECIMAL10		 CHAR(25);
'',                                         -- DEFAULT SET TO BLANK


--   v_CIFID			 CHAR(32);
MAP_CIF.FIN_CIF_ID,

--   v_preferredAddrss		 CHAR(50);

'Y',                                         -- MAPPING TABLE REQUIRED

--   v_HoldMailInitiatedBy	 CHAR(50);
'',                                         -- MAPPING TABLE REQUIRED


--   v_HoldMailFlag		 CHAR(50);
'',                                         -- MAPPING TABLE REQUIRED

--   v_BusinessCenter		 CHAR(50);
'',                                         -- MAPPING TABLE REQUIRED

--   v_HoldMailReason		 CHAR(200);
'',                                         -- MAPPING TABLE REQUIRED

--   v_PreferredFormat		 CHAR(50);
'STRUCTURED_FORMAT',                                         -- MAPPING TABLE REQUIRED



--   v_FreeTextAddress		 CHAR(200);
'',                                         -- DEFAULT SET TO BLANK

--   v_FreeTextLabel		 CHAR(200);
'',                                         -- DEFAULT SET TO BLANK

--   v_ADDRESS_PROOF_RCVD	 CHAR(1);
'',                                         -- MAPPING TABLE REQUIRED

--   v_LASTUPDATE_DATE	 	 CHAR(17);
'',                                         --SX20LF.SXDLM, BUT "SXDLM" IS NOT A FIELD IN "SX20LF" TABLE

--   v_BANK_ID		 	 CHAR(8);
'01'                                         -- MAPPING TABLE REQUIRED


FROM /* SX20LF,    */  MAP_CIF inner join gfpf on map_cif.leg_cust_number=gfpf.gfcus
    left join map_cif_type on leg_cust_type_code = gfpf.gfctp
    where map_cif_type.leg_cust_type ='Individual'
    and map_cif.fin_sol_id='0006');

commit;
END;