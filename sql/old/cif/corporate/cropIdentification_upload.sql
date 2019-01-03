-- File Name		: cropIdentification_upload.sql

-- File Created for	: Upload file for cropIdentification

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure cropIdentification_upload
   as

BEGIN

Begin

EXECUTE IMMEDIATE 'truncate table CROPIDENTIFICATION_O_TABLE';
  
end;

insert into CROPIDENTIFICATION_O_TABLE
(
select
--   CORP_KEY  		  CHAR(50);
	map_cif.fin_cif_id,
-- CORP_REP_KEY	  	  CHAR(50);
	map_cif.fin_cif_id,
-- BENEFICIALOWNERKEY     CHAR(50);
	'',
--   ENTITYTYPE		  CHAR(50);
	'CIFCorpCust',
--   DOCDUEDATE		  CHAR(17);
	'',
--   DOCRECEIVEDDATE	  CHAR(17);
	to_char(to_date(pack_mig_EQ3.get_date_fm_btrv(key_value),'DD/MM/YYYY'),'DD-MON-YYYY'),
--   DOCEXPIRYDATE	  CHAR(17);
	to_char(to_date(pack_mig_EQ3.get_date_fm_btrv(key_value),'DD/MM/YYYY'),'DD-MON-YYYY'),
--   DOCDELFLG 		  CHAR(1);
	'',
-- DOCREMARKS 		  CHAR(255);
	'',
--   SCANNED		  CHAR(1);
	'',
--   DOCCODE		  CHAR(20);
	'D001',
--   DOCDESCR		  CHAR(255);
	'',
--   REFERENCENUMBER	  CHAR(100);
	'123',
-- TYPE		 	  CHAR(50);
	'',
-- ISMANDATORY	 	  CHAR(1);
	'',
-- SCANREQUIRED	 	  CHAR(10);
	'',
-- ROLE		 	  CHAR(50);
	'',
-- DOCTYPECODE	 	  CHAR(50);
	'DT001',
-- DOCTYPEDESCR	 	  CHAR(2000);
	'',
-- MINDOCSREQD	 	  CHAR(38);
	'',
-- WAIVEDORDEFEREDDATE    CHAR(99);
	'',
--   COUNTRYOFISSUE	  CHAR(50);
	'INDIA',
-- PLACEOFISSUE	 	  CHAR(200);
	'INDIA',
-- DOCISSUEDATE	 	  CHAR(17);
	to_char(to_date(pack_mig_EQ3.get_date_fm_btrv(key_value),'DD/MM/YYYY'),'DD-MON-YYYY'),
-- IDENTIFICATIONTYPE	  CHAR(50);
	'',
-- CORE_CUST_ID	 	  CHAR(9);
	'',
--   IS_DOCUMENT_VERIFIED CHAR(1);
	'',
--   BANK_ID		  CHAR(8);
	'01',
--IDISSUEORGANISATION   
	'ORG'
  	from sys_config,map_cif
	inner join gfpf on gfpf.gfcus = map_cif.leg_cust_number
	left join map_cif_type on leg_cust_type_code = gfpf.gfctp
	where map_cif_type.leg_cust_type ='Other than Individual'
	and key_string='EQ3_BUSINESS_DATE'
  and map_cif.fin_sol_id='0006');

      COMMIT;
   
END;