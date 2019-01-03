-- File Name		: nomination.sql

-- File Created for	: Upload file for nomination

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure nomination(
v_mig_date IN TIMESTAMP
)
   as
   v_Indicator  		CHAR(3);
   v_Account_Number		CHAR(16);
   v_Currency_Code 		CHAR(3);
   v_Service_Outlet  		CHAR(8);
   v_Nomination_Srl_Num		CHAR(3);
   v_Nominee_Name		CHAR(40);
   v_Address_1st_Line		CHAR(45);
   v_Address_2nd_Line  		CHAR(45);
   v_Nominee_Relation_Code  	CHAR(5);
   v_Nominee_Registration_Num	CHAR(15);
   v_City_Code			CHAR(5);
   v_Minor_or_Guardian_Code	CHAR(1);
   v_Nominee_Date_of_Birth  	CHAR(8);
   v_Minor_Flag  		CHAR(1);
   v_Nomination_Percentage  	CHAR(10);
   v_Last_Nominee_Flag		CHAR(1);
   v_Pref_Language_Code		CHAR(10);
   v_Pref_Language_Nominee_Name	CHAR(40);
   
--  DECLARE
   CURSOR c1 is
     select 'ALT',
--   v_Indicator  		CHAR(3);
--   v_Account_Number		CHAR(16);
            lpad(' ',16,' '),
--   v_Currency_Code 		CHAR(3);
            lpad(' ',3,' '),
--   v_Service_Outlet  		CHAR(8);
            lpad(' ',8,' '),
-- v_Nomination_Srl_Num		CHAR(3);
            lpad(' ',3,' '),
--   v_Nominee_Name		CHAR(40);
            lpad(' ',40,' '),
--   v_Address_1st_Line		CHAR(45);
            lpad(' ',45,' '),
-- v_Address_2nd_Line  		CHAR(45);
            lpad(' ',45,' '),
--   v_Nominee_Relation_Code  	CHAR(5);
            lpad(' ',5,' '),
--   v_Nominee_Registration_Num	CHAR(15);
            lpad(' ',15,' '),
-- v_City_Code			CHAR(5);
            lpad(' ',5,' '),
--   v_Minor_or_Guardian_Code	CHAR(1);
            lpad(' ',1,' '),
--   v_Nominee_Date_of_Birth  	CHAR(8);
            lpad(' ',8,' '),
--   v_Minor_Flag  		CHAR(1);
            lpad(' ',1,' '),
--   v_Nomination_Percentage  	CHAR(10);
            lpad(' ',10,' '),
--  v_Last_Nominee_Flag		CHAR(1);
            lpad(' ',1,' '),
-- v_Pref_Language_Code		CHAR(10);
            lpad(' ',10,' '),
-- v_Pref_Language_Nominee_Name	CHAR(40);
            lpad(' ',40,' ')

            jubno,
            JUHAMT,
            lpad(' ',3,' '),
            lpad(' ',5,' '),
            lpad(nvl(pack_mig_bm.get_date_fm_btrv(jusdte),' '),8,' '),
            lpad(nvl(pack_mig_bm.get_date_fm_btrv(juhed),' '),8,' '),
            lpad(' ',5,' '),
            lpad(' ',16,' '),
            lpad(' ',20,' '),
            lpad(' ',12,' '),
            lpad(' ',5,' '),
            lpad(' ',16,' '),
            lpad(' ',16,' '),
            rpad(jupf.jubbn,8,' '),
            rpad(jupf.juhdd1,50,' ')
  	from jupf;

   
BEGIN

Begin

EXECUTE IMMEDIATE 'truncate table AC_NOMINATION_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Indicator,v_Account_Number,v_Currency_Code,v_Service_Outlet,v_Nomination_Srl_Num,v_Nominee_Name,v_Address_1st_Line,v_Address_2nd_Line,v_Nominee_Relation_Code,v_Nominee_Registration_Num,v_City_Code,v_Minor_or_Guardian_Code,v_Nominee_Date_of_Birth,v_Minor_Flag,v_Nomination_Percentage,v_Last_Nominee_Flag,v_Pref_Language_Code,v_Pref_Language_Nominee_Name;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into AC_NOMINATION_O_TABLE values (v_Indicator,v_Account_Number,v_Currency_Code,v_Service_Outlet,v_Nomination_Srl_Num,v_Nominee_Name,v_Address_1st_Line,v_Address_2nd_Line,v_Nominee_Relation_Code,v_Nominee_Registration_Num,v_City_Code,v_Minor_or_Guardian_Code,v_Nominee_Date_of_Birth,v_Minor_Flag,v_Nomination_Percentage,v_Last_Nominee_Flag,v_Pref_Language_Code,v_Pref_Language_Nominee_Name ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;