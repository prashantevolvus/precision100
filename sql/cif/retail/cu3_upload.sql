-- File Name		: cu3_upload.sql
-- File Created for	: Upload file for cu3
-- Created By		: Ashok Kumar.S
-- Client		: Indus Ind Bank
-- Created On		: 01-11-2011
-------------------------------------------------------------------
truncate table CU3_O_TABLE;
INSERT
INTO CU3_O_TABLE
  ( SELECT  
--   v_ORGKEY  			 CHAR(32)
fin_cif_id,
--   v_CIF_ID		 	 CHAR(32)
fin_cif_id,
--   v_STRTEXT1 		 CHAR(255)
'CURRENCY',
--   v_STRTEXT2  		 CHAR(255)
'',
--   v_TYPE		 	 CHAR(50)
'CURRENCY',
--   v_CUSTOMERCURRENCY		 CHAR(3)
scccy,
--   v_CREDITDISCOUNTPERCENT	 CHAR(9)
'',
--   v_DEBITDISCOUNTPERCENT  	 CHAR(9)
'',
--   v_WITHHOLDTAXPCNT  	 CHAR(9)
'',
--   v_WITHHOLDTAXFLOORLMT	 CHAR(20)
'',
--   v_DTDATE1			 CHAR(17)
'31-DEC-2099',
--   v_DTDATE2			 CHAR(17)
'',
--   v_countryofissue_code  	 CHAR(5)
'',
--   v_SMALL_STR1  		 CHAR(50)
'',
--   v_SMALL_STR2  		 CHAR(50)
'',
--   v_SMALL_STR3		 CHAR(50)
'',
--   v_SMALL_STR4		 CHAR(50)
'',
--   v_SMALL_STR5		 CHAR(50)
'',
--   v_SMALL_STR6		 CHAR(50)
'',
--   v_SMALL_STR7		 CHAR(50)
'',
--   v_SMALL_STR8		 CHAR(50)
'',
--   v_SMALL_STR9		 CHAR(50)
'',
--   v_SMALL_STR10		 CHAR(50)
'',
--   v_MED_STR1			 CHAR(100)
'',
--   v_MED_STR2			 CHAR(100)
'',
--   v_MED_STR3			 CHAR(100)
'',
--   v_MED_STR4			 CHAR(100)
'',
--   v_MED_STR5			 CHAR(100)
'',
--   v_MED_STR6			 CHAR(100)
'',
--   v_MED_STR7			 CHAR(100)
'',
--   v_MED_STR8			 CHAR(100)
'',
--   v_MED_STR9			 CHAR(100)
'',
--   v_MED_STR10		 CHAR(100)
'',
--   v_LARGE_STR1		 CHAR(250)
'',
--   v_LARGE_STR2		 CHAR(250)
'',
--   v_LARGE_STR3		 CHAR(250)
'',
--   v_LARGE_STR4		 CHAR(250)
'',
--   v_LARGE_STR5		 CHAR(250)
'',
--   v_DATE1			 CHAR(17)
'',
--   v_DATE2			 CHAR(17)
'',
--   v_DATE3			 CHAR(17)
'',
--   v_DATE4			 CHAR(17)
'',
--   v_DATE5			 CHAR(17)
'',
--   v_DATE6			 CHAR(17)
'',
--   v_DATE7			 CHAR(17)
'',
--   v_DATE8			 CHAR(17)
'',
--   v_DATE9			 CHAR(17)
'',
--   v_DATE10			 CHAR(17)
'',
--   v_NUMBER1			 CHAR(38)
'',
--   v_NUMBER2			 CHAR(38)
'',
--   v_NUMBER3			 CHAR(38)
'',
--   v_NUMBER4			 CHAR(38)
'',
--   v_NUMBER5			 CHAR(38)
'',
--   v_NUMBER6			 CHAR(38)
'',
--   v_NUMBER7			 CHAR(38)
'',
--   v_NUMBER8			 CHAR(38)
'',
--   v_NUMBER9			 CHAR(38)
'',
--   v_NUMBER10			 CHAR(38)
'',
--   v_DECIMAL1			 CHAR(25)
'',
--   v_DECIMAL2			 CHAR(25)
'',
--   v_DECIMAL3			 CHAR(25)
'',
--   v_DECIMAL4			 CHAR(25)
'',
--   v_DECIMAL5			 CHAR(25)
'',
--   v_DECIMAL6			 CHAR(25)
'',
--   v_DECIMAL7			 CHAR(25)
'',
--   v_DECIMAL8			 CHAR(25)
'',
--   v_DECIMAL9			 CHAR(25)
'',
--   v_DECIMAL10		 CHAR(25)
'',
--   v_STRTEXT3			 CHAR(255)
'',
--   v_STRTEXT4			 CHAR(255)
'',
--   v_STRTEXT5			 CHAR(255)
'',
--   v_STRTEXT6			 CHAR(255)
'',
--   v_STRTEXT7			 CHAR(255)
'',
--   v_STRTEXT8			 CHAR(255)
'',
--   v_STRTEXT9			 CHAR(255)
'',
--   v_STRTEXT10		 CHAR(255)
scccy,
--   v_INTINTEGER1		 CHAR(38)
'',
--   v_INTINTEGER2		 CHAR(38)
'',
--   v_INTINTEGER3		 CHAR(38)
'',
--   v_INTINTEGER4		 CHAR(38)
'',
--   v_INTINTEGER5		 CHAR(38)
'',
--   v_INTINTEGER6		 CHAR(38)
'',
--   v_INTINTEGER7		 CHAR(38)
'',
--   v_INTINTEGER8		 CHAR(38)
'',
--   v_INTINTEGER9		 CHAR(38)
'',
--   v_INTINTEGER10		 CHAR(38)
'',
--   v_INTINTEGER11		 CHAR(38)
'',
--   v_INTINTEGER12		 CHAR(38)
'',
--   v_INTINTEGER13		 CHAR(38)
'',
--   v_INTINTEGER14		 CHAR(38)
'',
--   v_INTINTEGER15		 CHAR(38)
'',
--   v_DTDATE3			 CHAR(17)
'',
--   v_DTDATE4			 CHAR(17)
'',
--   v_DTDATE5			 CHAR(17)
'',
--   v_DBFLOAT1			 CHAR(17)
'0',
--   v_DBFLOAT2			 CHAR(17)
'0',
--   v_DBFLOAT3			 CHAR(17)
'0',
--   v_DBFLOAT4			 CHAR(17)
'0',
--   v_DBFLOAT5			 CHAR(17)
'',
--   v_STRTEXT11		 CHAR(50)
'',
--   v_STRTEXT12		 CHAR(50)
'',
--   v_STRTEXT13		 CHAR(50)
'',
--   v_STRTEXT14		 CHAR(50)
'',
--   v_STRTEXT15		 CHAR(50)
'',
--   v_STRTEXT16		 CHAR(50)
'',
--   v_STRTEXT17		 CHAR(50)
'',
--   v_STRTEXT18		 CHAR(50)
'',
--   v_STRTEXT19		 CHAR(50)
'',
--   v_STRTEXT20		 CHAR(50)
'',
--   v_STRTEXT21		 CHAR(50)
'',
--   v_STRTEXT22		 CHAR(50)
 '',
--   v_STRTEXT23		 CHAR(50)
'',
--   v_STRTEXT24		 CHAR(50)
'',
--   v_STRTEXT25		 CHAR(50)
'',
--   v_STRTEXT26		 CHAR(50)
'',
--   v_STRTEXT27		 CHAR(50)
'',
--   v_EmployerID		 CHAR(50)
'',
--   v_EmployeeID		 CHAR(10)
'',
--   v_STRTEXT1_CODE		 CHAR(5)
'',
--   v_STRTEXT2_CODE		 CHAR(5)
'',
--   v_strText28		 CHAR(99)
'',
--   v_BANK_ID			 CHAR(99)
get_param('BANK_ID'),
--   v_STRTEXT4_alt1		 CHAR(99)
''
from
cust_currency
 inner join map_cif on scan = leg_cust_number
 where individual = 'Y');
 commit;
 
exit;