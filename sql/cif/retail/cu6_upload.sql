-- File Name		: cu6email_upload.sql

-- File Created for	: Upload file for Lien

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------
truncate table CU6_O_TABLE;
INSERT
INTO CU6_O_TABLE
(  
SELECT 
--ORGKEY           CHAR(32) 
fin_cif_id,
--PHONEEMAILTYPE     CHAR(200) 
phoneemailtype,
--PHONEOREMAIL      CHAR(50) 
phoneemail,
--PHONE_NO           CHAR(25) 
phone,
--PHONENOLOCALCODE     CHAR(20) 
case when phoneemail = 'PHONE' then '1'
else ''
end,
--PHONENOCITYCODE     CHAR(20) 
case when phoneemail = 'PHONE' then '0'
else ''
end,
--PHONENOCOUNTRYCODE     CHAR(20) 
case when phoneemail = 'PHONE' then '966'
else ''
end,
--WORKEXTENSION       CHAR(30) 
'',
--EMAIL           CHAR(50) 
email,
--EMAILPALM          CHAR(150) 
'',
--URL             CHAR(150) 
'',
--PREFERRED_FLAG     CHAR(50) 
preffered,
--Start_Date           CHAR(17) 
'',
--End_Date           CHAR(17) 
'',
--USERFIELD1           CHAR(200) 
'',
--USERFIELD2         CHAR(200) 
'',
--USERFIELD3         CHAR(200) 
'',
--DATE1         CHAR(17) 
'',
--DATE2         CHAR(17) 
'',
--DATE3         CHAR(17) 
'',
--BANK_ID         CHAR(8) 
get_param('BANK_ID')
from  customer_phoneemail    
inner join map_cif on map_cif.leg_cust_number = bgcus
where individual = 'Y');
commit;

exit;
