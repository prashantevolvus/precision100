-- File Name		: cu5_upload.sql
-- File Created for	: Upload file for cu5
-- Created By		: Ashok Kumar.S
-- Client		: Indus Ind Bank
-- Created On		: 01-11-2011
-------------------------------------------------------------------
truncate table CU7CROP_O_TABLE;
INSERT
INTO CU7CROP_O_TABLE
  ( 
   SELECT 
    --CORP_KEYvarchar(50) null
    fin_cif_id,
    --CORP_REP_KEYvarchar(50) null
    '',
    --BENEFICIALOWNERKEYvarchar(50) null
    '',
    --ENTITYTYPEvarchar(50) null
    '',
    --DOCDUEDATEvarchar(11) null
    '',
    --DOCRECEIVEDDATE          varchar(11) null
    case when get_date_fm_btrv(GFCOD) <> 'ERROR'  then
            to_char(to_date(to_char(get_date_fm_btrv(GFCOD)),'YYYYMMDD'),'DD-MON-YYYY')
          else ''
          end,
    --DOCEXPIRYDATE            varchar(11) null
    case when BGBTRD <> 0 and get_date_fm_btrv(BGBTRD) <> 'ERROR'  then
            to_char(to_date(to_char(get_date_fm_btrv(BGBTRD)),'YYYYMMDD'),'DD-MON-YYYY')
          else '01-JAN-2020'
          end,
    --DOCDELFLG                varchar(1) null
    '',
    --DOCREMARKS               varchar(255) null
    'Trade License',
    --SCANNED                  varchar(1) null
    '',
    --DOCCODE                  varchar(20) null
    'TRDLI',
    --DOCDESCR                 varchar(255) null
    'TRADE LICENSE',
    --REFERENCENUMBER          varchar(100) null
    case when BGBTRN is null then cast('99999' as NCHAR(15))
    else BGBTRN 
    end,
    --TYPE                     varchar(50) null
    '',
    --ISMANDATORY              varchar(1) null
    '',
    --SCANREQUIRED             varchar(10) null
    '',
    --ROLE                     varchar(50) null
    '',
    --DOCTYPECODE              varchar(50) null
    'CORPORATE',
    --DOCTYPEDESCR             varchar(2000) null
    '',
    --MINDOCSREQD              varchar(38) null
    '',    
    --WAIVEDORDEFEREDDATE      varchar(11) null
    '',    
    --COUNTRYOFISSUE           varchar(50) null
    'SA',
    --PLACEOFISSUE             varchar(200) null
    'SA',    
    --DOCISSUEDATE             varchar(11) null
     '01-JAN-2001',
    --IDENTIFICATIONTYPE       varchar(50) null
    '',
    --CORE_CUST_IDvarchar(9) null
    '',
    --IS_DOCUMENT_VERIFIEDvarchar(1) null
    '',
    --BANK_IDvarchar(8) null
    get_param('BANK_ID'),
    --IDISSUEORGANISATIONvarchar(255) null
    'Ministry of Home'
from migr_customer_corp
inner join map_cif on gfcpnc = leg_cust_number 
left join bgpf on gfcpnc = bgcus
  );

commit;
exit;
