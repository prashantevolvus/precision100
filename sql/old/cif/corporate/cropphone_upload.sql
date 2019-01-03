-- File Name		: cropphone_upload.sql

-- File Created for	: Upload file for cropphone

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure cropphone_upload
   as

begin

   Begin

EXECUTE IMMEDIATE 'truncate table CROPPHONE_O_TABLE';
  
  end;

insert into CROPPHONE_O_TABLE
(
select
--   CORP_KEY  		 CHAR(50);
	map_cif.fin_cif_id,
--   PHONEEMAILTYPE	 CHAR(200);
	'EMAIL',
-- PHONEOREMAIL		 CHAR(50);
	'',
--   PHONE_NO		 CHAR(25);
	'',
--   PHONENOLOCALCODE	 CHAR(20);
	'',
--   PHONENOCITYCODE	 CHAR(20);
	'',
--   PHONENOCOUNTRYCODE	 CHAR(20);
	'',
--   WORKEXTENSION	 CHAR(30);
	'',
--   EMAIL 		 CHAR(50);
	'info@indusind.com',
--   EMAILPALM		 CHAR(50);
	'',
-- URL			 CHAR(150);
	'',
--   PREFERRED_FLAG	 CHAR(50);
	'',
--   Start_Date		 CHAR(17);
	to_char(to_date(to_char(pack_mig_eq3.get_date_fm_btrv(GFPF.GFCOD)),'DD-MM-YYYY'),'DD-MON-YYYY'),
--   End_Date		 CHAR(17);
	'',
--   USERFIELD1		 CHAR(200);
	'',
--   USERFIELD2		 CHAR(200);
	'',
--   USERFIELD3		 CHAR(200);
	'',
--   DATE1		 CHAR(17);
	'',
--   DATE2		 CHAR(17);
	'',
--   DATE3		 CHAR(17);
	'',
--   BANK_ID		 CHAR(8);
	'01'
     from map_cif
     inner join gfpf on gfpf.gfcus = map_cif.leg_cust_number
     left join map_cif_type on leg_cust_type_code = gfpf.gfctp
     where map_cif_type.leg_cust_type ='Other than Individual'
     and map_cif.fin_sol_id='0006');

      COMMIT;
   
END;