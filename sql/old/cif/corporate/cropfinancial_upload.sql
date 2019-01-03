-- File Name		: cropfinancial_upload.sql

-- File Created for	: Upload file for cropfinancial

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure cropfinancial
   as

BEGIN

  Begin

EXECUTE IMMEDIATE 'truncate table CROPFINANCIAL_O_TABLE';
  
  end;

insert into CROPFINANCIAL_O_TABLE
(
select
--   Corp_Key  	 	 CHAR(32);
	map_cif.fin_cif_id,
--   CIFID	 	 CHAR(32);
	map_cif.fin_cif_id,
-- FinanceDetail_Type    CHAR(50);
	'',
-- STR1			 CHAR(100);
	'',
-- STR2			 CHAR(100);
	'',
-- STR3			 CHAR(100);
	'',
-- STR4			 CHAR(100);
	'',
--   STR5 		 CHAR(100);
	'',
--   STR6 		 CHAR(100);
	'',
-- STR7			 CHAR(100);
	'',
-- STR8			 CHAR(100);
	'',
--   STR26		 CHAR(200);
	'',
--   STR27		 CHAR(200);
	'',
--   STR28		 CHAR(200);
	'',
--   DATE1		 CHAR(99);
	'',
--   DATE2		 CHAR(99);
	'',
-- INT1			 CHAR(38);
	'',
-- INT7			 CHAR(38);
	'',
-- INT4			 CHAR(38);
	'',
-- INT8			 CHAR(38);
	'',
-- INT9			 CHAR(38);
	'',
--   AMOUNT2		 CHAR(20);
	'',
--   AMOUNT3		 CHAR(20);
	'',
--   AMOUNT4		 CHAR(20);
	'',
--   AMOUNT5		 CHAR(20);
	'',
--   AMOUNT6		 CHAR(20);
	'',
--   AMOUNT7		 CHAR(20);
	'',
--   AMOUNT8		 CHAR(20);
	'',
--   AMOUNT9		 CHAR(20);
	'',
--   AMOUNT10		 CHAR(20);
	'',
--   AMOUNT11		 CHAR(20);
	'',
--   AMOUNT12		 CHAR(20);
	'',
--   AMOUNT13		 CHAR(20);
	'',
--   AMOUNT14		 CHAR(20);
	'',
--   AMOUNT15		 CHAR(20);
	'',
--   AMOUNT16		 CHAR(20);
	'',
--   AMOUNT17		 CHAR(20);

--   AMOUNT18		 CHAR(20);
	'',
--   AMOUNT19		 CHAR(20);
	'',
--   AMOUNT20		 CHAR(20);
	'',
--   AMOUNT21		 CHAR(20);
	'',
--   AMOUNT22		 CHAR(20);
	'',
--   AMOUNT23		 CHAR(20);
	'',
--   AMOUNT24		 CHAR(20);
	'',
--   AMOUNT25		 CHAR(20);
	'',
--   AMOUNT26		 CHAR(20);
	'',
--   AMOUNT27		 CHAR(20);
	'',
--   AMOUNT28		 CHAR(20);
	'',
--   SMALL_STR1		 CHAR(50);
	'',
--   SMALL_STR2		 CHAR(50);
	'',
--   SMALL_STR3		 CHAR(50);
	'',
--   SMALL_STR4		 CHAR(50);
	'',
--   SMALL_STR5		 CHAR(50);
	'',
--   SMALL_STR6		 CHAR(50);
	'',
--   SMALL_STR7		 CHAR(50);
	'',
--   SMALL_STR8		 CHAR(50);
	'',
--   SMALL_STR9		 CHAR(50);
	'',
--  SMALL_STR10		 CHAR(50);
	'',
--   MED_STR1		 CHAR(100);
	'',
--   MED_STR2		 CHAR(100);
	'',
--   MED_STR3		 CHAR(100);
	'',
--   MED_STR4		 CHAR(100);
	'',
--   MED_STR5		 CHAR(100);
	'',
--   MED_STR6		 CHAR(100);
	'',
--   MED_STR7		 CHAR(100);
	'',
--   MED_STR8		 CHAR(100);
	'',
--   MED_STR9		 CHAR(100);
	'',
--   MED_STR10		 CHAR(100);
	'',
--   LARGE_STR1		 CHAR(250);
	'',
--   LARGE_STR2		 CHAR(250);
	'',
--   LARGE_STR3		 CHAR(250);
	'',
--   LARGE_STR4		 CHAR(250);
	'',
--   LARGE_STR5		 CHAR(250);
	'',
--   DATE3		 CHAR(99);
	'',
--   DATE4		 CHAR(99);
	'',
--   DATE5		 CHAR(99);
	'',
--   DATE6		 CHAR(99);
	'',
--   DATE7		 CHAR(99);
	'',
--   DATE8		 CHAR(99);
	'',
--   DATE9		 CHAR(99);
	'',
--   DATE10		 CHAR(99);
	'',
--   NUMBER1		 CHAR(38);
	'',
--   NUMBER2		 CHAR(38);
	'',
--   NUMBER3		 CHAR(38);
	'',
--   NUMBER4		 CHAR(38);
	'',
--   NUMBER5		 CHAR(38);
	'',
--   NUMBER6		 CHAR(38);
	'',
--   NUMBER7		 CHAR(38);
	'',
--   NUMBER8		 CHAR(38);
	'',
--   NUMBER9		 CHAR(38);
	'',
--   NUMBER10		 CHAR(38);
	'',
--   DECIMAL1		 CHAR(25);
	'',
--   DECIMAL2		 CHAR(25);
	'',
--   DECIMAL3		 CHAR(25);
	'',
--   DECIMAL4		 CHAR(25);
	'',
--   DECIMAL5		 CHAR(25);
	'',
--   DECIMAL6		 CHAR(25);
	'',
--   DECIMAL7		 CHAR(25);
	'',
--   DECIMAL8		 CHAR(25);
	'',
--   DECIMAL9		 CHAR(25);
	'',
--   DECIMAL10		 CHAR(25);
	'',
--   EntityKey		 CHAR(50);
	'',
--   CIFType		 CHAR(50);
	'',
--   EntityType		 CHAR(50);
	'',
--   STR21		 CHAR(1);
	'',
--   STR22		 CHAR(1);
	'',
--   STR23		 CHAR(1);
	'',
--   STR24		 CHAR(1);
	'',
--   STR25		 CHAR(1);
	'',
--   STR29		 CHAR(200);
	'',
--   STR30		 CHAR(200);
	'',
--   AMOUNT29		 CHAR(20);
	'',
--   AMOUNT30		 CHAR(20);
	'',
--   FLAG1		 CHAR(10);
	'',
--   FLAG2		 CHAR(10);
	'',
--   FLAG3		 CHAR(10);
	'',
--   FLAG4		 CHAR(10);
	'',
--   FLAG5		 CHAR(10);
	'',
-- INT6			 CHAR(38);
	'',
--   INT10		 CHAR(38);
	'',
--   INT11		 CHAR(38);
	'',
--   INT12		 CHAR(38);
	'',
--   INT13		 CHAR(38);
	'',
--   INT14		 CHAR(38);
	'',
--   INT15		 CHAR(38);
	'',
-- MLUSERFIELD1	 	 CHAR(80);
	'',
-- MLUSERFIELD2	 	 CHAR(80);
	'',
-- MLUSERFIELD3	 	 CHAR(80);
	'',
-- MLUSERFIELD4	 	 CHAR(80);
	'',
-- MLUSERFIELD5	 	 CHAR(80);
	''
     from map_cif
     inner join gfpf on gfpf.gfcus = map_cif.leg_cust_number
     left join map_cif_type on leg_cust_type_code = gfpf.gfctp
     where map_cif_type.leg_cust_type ='Other than Individual'
     and map_cif.fin_sol_id='0006');

      COMMIT;
   
END;