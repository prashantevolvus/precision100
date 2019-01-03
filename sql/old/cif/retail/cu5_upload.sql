-- File Name		: cu5_upload.sql

-- File Created for	: Upload file for cu5

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure cu5_load
as

BEGIN
   	 begin
	      EXECUTE IMMEDIATE 'truncate table CU5_O_TABLE';
	 end;



INSERT
INTO CU5_O_TABLE
  (  SELECT 
--    V_ORGKEY			CHAR(32);
  MAP_CIF.FIN_CIF_ID,


--    V_DOCDUEDATE		CHAR(17);
	  case when pack_mig_eq3.get_date_fm_btrv(GFPF.GFCOD) <> 'ERROR'  then
            to_char(to_date(to_char(pack_mig_eq3.get_date_fm_btrv(GFPF.GFCOD)),'DD-MM-YYYY'),'DD-MON-YYYY')
          else ''
          end,


--    V_DOCRECEIVEDDATE		CHAR(17);
	  case when pack_mig_eq3.get_date_fm_btrv(GFPF.GFCOD) <> 'ERROR'  then
            to_char(to_date(to_char(pack_mig_eq3.get_date_fm_btrv(GFPF.GFCOD)),'DD-MM-YYYY'),'DD-MON-YYYY')
          else ''
          end,


--    V_DOCEXPIRYDATE		CHAR(17);
'31-DEC-2099',


--    V_DOCDELFLG		CHAR(1);
'',


--    V_DOCREMARKS		CHAR(255);
'',


--    V_SCANNED			CHAR(1);
'',


--    V_DOCCODE			CHAR(20);
'OTH',  


--    V_DOCDESCR		CHAR(255);
'TAXID',


--    V_REFERENCENUMBER		CHAR(100);
map_cif.Fin_cif_id,


--    V_TYPE			CHAR(50);
'',


--    V_ISMANDATORY		CHAR(1);
'Y',


--    V_SCANREQUIRED		CHAR(10);
'',


--    V_ROLE			CHAR(50);
'',


--    V_DOCTYPECODE		CHAR(50);
'OTH',


--    V_DOCTYPEDESCR		CHAR(2000);
'TAXID',


--    V_MINDOCSREQD		CHAR(38);
'',


--    V_WAIVEDORDEFEREDDATE	CHAR(17);
'',


--    V_COUNTRYOFISSUE		CHAR(50);
'INDIA',


--    V_PLACEOFISSUE		CHAR(200);
'INDIA',


--    V_DOCISSUEDATE		CHAR(17);
 case  when pack_mig_eq3.get_date_fm_btrv(GFPF.GFCOD) <> 'ERROR' then
          to_char(to_date(pack_mig_EQ3.get_date_fm_btrv(GFPF.gfcod),'DD-MM-YYYY'),'DD-MON-YYYY')
       else ''
       end,


--    V_IDENTIFICATIONTYPE	CHAR(50);
'',


--    V_CORE_CUST_ID		CHAR(9);
'',


--    V_IS_DOCUMENT_VERIFIED	CHAR(1);
'',


--    V_BEN_OWN_KEY		CHAR(50);
'',


--    V_BANK_ID			CHAR(8);
'01',


--    V_DOCTYPEDESCR_ALT1	CHAR(2000);
'',


--    V_DOCDESCR_ALT1		CHAR(255);
'',


--    V_IDISSUEORGANISATION	CHAR(255);
'Ministry of Home'

FROM  map_cif inner join gfpf on map_cif.leg_cust_number = gfpf.gfcus
    left join map_cif_type on leg_cust_type_code = gfpf.gfctp
    where map_cif_type.leg_cust_type ='Individual'
    and map_cif.fin_sol_id='0006');

commit;
END;