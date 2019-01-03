-- File Name		: cu5_upload.sql
-- File Created for	: Upload file for cu5
-- Created By		: Ashok Kumar.S
-- Client		: Indus Ind Bank
-- Created On		: 01-11-2011
-------------------------------------------------------------------
truncate table CU5_O_TABLE;
INSERT
INTO CU5_O_TABLE
  (  SELECT 
--    V_ORGKEY            CHAR(32)
  MAP_CIF.FIN_CIF_ID,
--    V_DOCDUEDATE        CHAR(17)
      case when get_date_fm_btrv(GFCOD) <> 'ERROR'  then
            to_char(to_date(to_char(get_date_fm_btrv(GFCOD)),'YYYYMMDD'),'DD-MON-YYYY')
          else ''
          end,
--    V_DOCRECEIVEDDATE        CHAR(17)
      case when get_date_fm_btrv(GFCOD) <> 'ERROR'  then
            to_char(to_date(to_char(get_date_fm_btrv(GFCOD)),'YYYYMMDD'),'DD-MON-YYYY')
          else ''
          end,
--    V_DOCEXPIRYDATE        CHAR(17)
      case when expiry_dt <> 0 and get_date_fm_btrv(expiry_dt) <> 'ERROR'  then
            to_char(to_date(to_char(get_date_fm_btrv(expiry_dt)),'YYYYMMDD'),'DD-MON-YYYY')
          else ''
          end,
--    V_DOCDELFLG        CHAR(1)
'',
--    V_DOCREMARKS        CHAR(255)
'',
--    V_SCANNED            CHAR(1)
'',
--    V_DOCCODE            CHAR(20)
doctype,  
--    V_DOCDESCR        CHAR(255)
doctypedesc,
--    V_REFERENCENUMBER        CHAR(100)
bgippn,
--    V_TYPE            CHAR(50)
'',
--    V_ISMANDATORY        CHAR(1)
'N',
--    V_SCANREQUIRED        CHAR(10)
'',
--    V_ROLE            CHAR(50)
'',
--    V_DOCTYPECODE        CHAR(50)
'RETAIL',
--    V_DOCTYPEDESCR        CHAR(2000)
'RETAIL',
--    V_MINDOCSREQD        CHAR(38)
'',
--    V_WAIVEDORDEFEREDDATE    CHAR(17)
'',
--    V_COUNTRYOFISSUE        CHAR(50)
'SA',
--    V_PLACEOFISSUE        CHAR(200)
'SA',
--    V_DOCISSUEDATE        CHAR(17)
 '01-JAN-2001',
--    V_IDENTIFICATIONTYPE    CHAR(50)
'',
--    V_CORE_CUST_ID        CHAR(9)
'',
--    V_IS_DOCUMENT_VERIFIED    CHAR(1)
'',
--    V_BEN_OWN_KEY        CHAR(50)
'',
--    V_BANK_ID            CHAR(8)
get_param('BANK_ID'),
--    V_DOCTYPEDESCR_ALT1    CHAR(2000)
'',
--    V_DOCDESCR_ALT1        CHAR(255)
'',
--    V_IDISSUEORGANISATION    CHAR(255)
IDISSUE
from  customer_doc    
inner join map_cif on map_cif.leg_cust_number = bgcus
inner join migr_customer_retail on map_cif.leg_cust_number = gfcpnc);
commit;
exit;
