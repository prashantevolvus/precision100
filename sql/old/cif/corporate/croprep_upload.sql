-- File Name		: croprep_upload.sql

-- File Created for	: Upload file for croprep

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure croprep_upload(
v_mig_date IN TIMESTAMP
)
   as
   v_CORP_KEY                   CHAR(32);
   v_CIF_ID			CHAR(32);
   v_CORP_REP_KEY	 	CHAR(38);
   v_GENDER_CODE	 	CHAR(10);
   v_DOB		 	CHAR(99);
   v_DESIGNATION	 	CHAR(50);
   v_ACTIVE_INACTICE_CODE	CHAR(10);
   v_SMALL_STR1  	 	CHAR(50);
   v_SMALL_STR2  	 	CHAR(50);
   v_SMALL_STR3 	 	CHAR(50);
   v_SMALL_STR4 	 	CHAR(50);
   v_SMALL_STR5 	 	CHAR(50);
   v_SMALL_STR6 	 	CHAR(50);
   v_SMALL_STR7 	 	CHAR(50);
   v_SMALL_STR8	 		CHAR(50);
   v_SMALL_STR9	 		CHAR(50);
   v_SMALL_STR10	 	CHAR(50);
   v_MED_STR1	 		CHAR(100);
   v_MED_STR2	 		CHAR(100);
   v_MED_STR3	 		CHAR(100);
   v_MED_STR4	 		CHAR(100);
   v_MED_STR5	 		CHAR(100);
   v_MED_STR6	 		CHAR(100);
   v_MED_STR7	 		CHAR(100);
   v_MED_STR8	 		CHAR(100);
   v_MED_STR9	 		CHAR(100);
   v_MED_STR10	 		CHAR(100);
   v_LARGE_STR1	 		CHAR(250);
   v_LARGE_STR2	 		CHAR(250);
   v_LARGE_STR3	 		CHAR(250);
   v_LARGE_STR4	 		CHAR(250);
   v_LARGE_STR5	 		CHAR(250);
   v_DATE1	 		CHAR(99);
   v_DATE2	 		CHAR(99);
   v_DATE3	 		CHAR(99);
   v_DATE4	 		CHAR(99);
   v_DATE5	 		CHAR(99);
   v_DATE6	 		CHAR(99);
   v_DATE7	 		CHAR(99);
   v_DATE8	 		CHAR(99);
   v_DATE9	 		CHAR(99);
   v_DATE10	 		CHAR(99);
   v_NUMBER1	 		CHAR(38);
   v_NUMBER2	 		CHAR(38);
   v_NUMBER3	 		CHAR(38);
   v_NUMBER4	 		CHAR(38);
   v_NUMBER5	 		CHAR(38);
   v_NUMBER6	 		CHAR(38);
   v_NUMBER7	 		CHAR(38);
   v_NUMBER8	 		CHAR(38);
   v_NUMBER9	 		CHAR(38);
   v_NUMBER10	 		CHAR(38);
   v_DECIMAL1	 		CHAR(25);
   v_DECIMAL2	 		CHAR(25);
   v_DECIMAL3	 		CHAR(25);
   v_DECIMAL4	 		CHAR(25);
   v_DECIMAL5	 		CHAR(25);
   v_DECIMAL6	 		CHAR(25);
   v_DECIMAL7	 		CHAR(25);
   v_DECIMAL8	 		CHAR(25);
   v_DECIMAL9	 		CHAR(25);
   v_DECIMAL10	 		CHAR(25);
   v_ENTITYKEY	 		CHAR(50);
   v_ISSIGNATORY	 	CHAR(1);
   v_CIFADDRENTITY 		CHAR(50);
   v_ADDRESSCATEOGRY 		CHAR(50);
   v_FIRST_NAME_NATIVE 		CHAR(80);
   v_LAST_NAME_NATIVE 		CHAR(80);
   v_CORPORATE_NAME_NATIVE	CHAR(80);
   v_FIRST_NAME	 		CHAR(80);
   v_LAST_NAME	 		CHAR(80);
   v_email_ID	 		CHAR(150);
   v_ENTITY_TYPE	 	CHAR(30);
   v_qualification 		CHAR(50);
   v_pref_Comm_Channel 		CHAR(50);
   v_REPORTS_TO	 		CHAR(50);
   v_pref_Language 		CHAR(50);
   v_pref_Contact_Number 	CHAR(50);
   v_pref_Contact_Time 		CHAR(5);
   v_PREF_NAME	 		CHAR(50);
   v_PREF_ADDRESS_MODE 		CHAR(50);
   v_SALUATION_CODE 		CHAR(5);
   v_STR1		 	CHAR(1);
   v_STR2		 	CHAR(1);
   v_STR3		 	CHAR(1);
   v_STR4		 	CHAR(1);
   v_STR5		 	CHAR(1);
   v_STR6		 	CHAR(100);
   v_STR7		 	CHAR(100);
   v_STR8		 	CHAR(100);
   v_STR9		 	CHAR(100);
   v_STR10	 		CHAR(100);
   v_STR11	 		CHAR(200);
   v_STR12	 		CHAR(200);
   v_STR13	 		CHAR(200);
   v_STR14	 		CHAR(200);
   v_STR15	 		CHAR(200);
   v_AMOUNT1	 		CHAR(20);
   v_AMOUNT2	 		CHAR(20);
   v_AMOUNT3	 		CHAR(20);
   v_AMOUNT4	 		CHAR(20);
   v_AMOUNT5	 		CHAR(20);
   v_FLAG1	 		CHAR(10);
   v_FLAG2	 		CHAR(10);
   v_FLAG3	 		CHAR(10);
   v_FLAG4	 		CHAR(10);
   v_FLAG5	 		CHAR(10);
   v_INT1		 	CHAR(38);
   v_INT2		 	CHAR(38);
   v_INT3		 	CHAR(38);
   v_INT4		 	CHAR(38);
   v_INT5		 	CHAR(38);
   v_MLUSERFIELD1	 	CHAR(80);
   v_MLUSERFIELD2	 	CHAR(80);
   v_MLUSERFIELD3	 	CHAR(80);
   v_MLUSERFIELD4	 	CHAR(80);
   v_MLUSERFIELD5	 	CHAR(80);
   v_MLUSERFIELD6	 	CHAR(80);
   v_MLUSERFIELD7	 	CHAR(80);
   v_MLUSERFIELD8	 	CHAR(80);
   v_MLUSERFIELD9	 	CHAR(80);
   v_MLUSERFIELD10 		CHAR(80);
   v_Bank_ID	 		CHAR(99);
   v_LAST_NAME_alt1  		CHAR(99);
   v_FIRST_NAME_alt1  		CHAR(99);
   
   
--  DECLARE
   CURSOR c1 is
     select 'ALT',
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

EXECUTE IMMEDIATE 'truncate table CROPREP_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_CORP_KEY,v_CIF_ID,v_CORP_REP_KEY,v_GENDER_CODE,v_DOB,v_DESIGNATION,v_ACTIVE_INACTICE_CODE,v_SMALL_STR1,v_SMALL_STR2,v_SMALL_STR3,v_SMALL_STR4,v_SMALL_STR5,v_SMALL_STR6,v_SMALL_STR7,v_SMALL_STR8,v_SMALL_STR9,v_SMALL_STR10,v_MED_STR1,v_MED_STR2,v_MED_STR3,v_MED_STR4,v_MED_STR5,v_MED_STR6,v_MED_STR7,v_MED_STR8,v_MED_STR9,v_MED_STR10,v_LARGE_STR1,v_LARGE_STR2,v_LARGE_STR3,v_LARGE_STR4,v_LARGE_STR5,v_DATE1,v_DATE2,v_DATE3,v_DATE4,v_DATE5,v_DATE6,v_DATE7,v_DATE8,v_DATE9,v_DATE10,v_NUMBER1,v_NUMBER2,v_NUMBER3,v_NUMBER4,v_NUMBER5,v_NUMBER6,v_NUMBER7,v_NUMBER8,v_NUMBER9,v_NUMBER10,v_DECIMAL1,v_DECIMAL2,v_DECIMAL3,v_DECIMAL4,v_DECIMAL5,v_DECIMAL6,v_DECIMAL7,v_DECIMAL8,v_DECIMAL9,v_DECIMAL10,v_ENTITYKEY,v_ISSIGNATORY,v_CIFADDRENTITY,v_ADDRESSCATEOGRY,v_FIRST_NAME_NATIVE,v_LAST_NAME_NATIVE,v_CORPORATE_NAME_NATIVE,v_FIRST_NAME,v_LAST_NAME,v_email_ID,v_ENTITY_TYPE,v_qualification,v_pref_Comm_Channel,v_REPORTS_TO,v_pref_Language,v_pref_Contact_Number,v_pref_Contact_Time,v_PREF_NAME,v_PREF_ADDRESS_MODE,v_SALUATION_CODE,v_STR1,v_STR2,v_STR3,v_STR4,v_STR5,v_STR6,v_STR7,v_STR8,v_STR9,v_STR10,v_STR11,v_STR12,v_STR13,v_STR14,v_STR15,v_AMOUNT1,v_AMOUNT2,v_AMOUNT3,v_AMOUNT4,v_AMOUNT5,v_FLAG1,v_FLAG2,v_FLAG3,v_FLAG4,v_FLAG5,v_INT1,v_INT2,v_INT3,v_INT4,v_INT5,v_MLUSERFIELD1,v_MLUSERFIELD2,v_MLUSERFIELD3,v_MLUSERFIELD4,v_MLUSERFIELD5,v_MLUSERFIELD6,v_MLUSERFIELD7,v_MLUSERFIELD8,v_MLUSERFIELD9,v_MLUSERFIELD10,v_Bank_ID,v_LAST_NAME_alt1,v_FIRST_NAME_alt1;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into CROPREP_O_TABLE values (v_CORP_KEY,v_CIF_ID,v_CORP_REP_KEY,v_GENDER_CODE,v_DOB,v_DESIGNATION,v_ACTIVE_INACTICE_CODE,v_SMALL_STR1,v_SMALL_STR2,v_SMALL_STR3,v_SMALL_STR4,v_SMALL_STR5,v_SMALL_STR6,v_SMALL_STR7,v_SMALL_STR8,v_SMALL_STR9,v_SMALL_STR10,v_MED_STR1,v_MED_STR2,v_MED_STR3,v_MED_STR4,v_MED_STR5,v_MED_STR6,v_MED_STR7,v_MED_STR8,v_MED_STR9,v_MED_STR10,v_LARGE_STR1,v_LARGE_STR2,v_LARGE_STR3,v_LARGE_STR4,v_LARGE_STR5,v_DATE1,v_DATE2,v_DATE3,v_DATE4,v_DATE5,v_DATE6,v_DATE7,v_DATE8,v_DATE9,v_DATE10,v_NUMBER1,v_NUMBER2,v_NUMBER3,v_NUMBER4,v_NUMBER5,v_NUMBER6,v_NUMBER7,v_NUMBER8,v_NUMBER9,v_NUMBER10,v_DECIMAL1,v_DECIMAL2,v_DECIMAL3,v_DECIMAL4,v_DECIMAL5,v_DECIMAL6,v_DECIMAL7,v_DECIMAL8,v_DECIMAL9,v_DECIMAL10,v_ENTITYKEY,v_ISSIGNATORY,v_CIFADDRENTITY,v_ADDRESSCATEOGRY,v_FIRST_NAME_NATIVE,v_LAST_NAME_NATIVE,v_CORPORATE_NAME_NATIVE,v_FIRST_NAME,v_LAST_NAME,v_email_ID,v_ENTITY_TYPE,v_qualification,v_pref_Comm_Channel,v_REPORTS_TO,v_pref_Language,v_pref_Contact_Number,v_pref_Contact_Time,v_PREF_NAME,v_PREF_ADDRESS_MODE,v_SALUATION_CODE,v_STR1,v_STR2,v_STR3,v_STR4,v_STR5,v_STR6,v_STR7,v_STR8,v_STR9,v_STR10,v_STR11,v_STR12,v_STR13,v_STR14,v_STR15,v_AMOUNT1,v_AMOUNT2,v_AMOUNT3,v_AMOUNT4,v_AMOUNT5,v_FLAG1,v_FLAG2,v_FLAG3,v_FLAG4,v_FLAG5,v_INT1,v_INT2,v_INT3,v_INT4,v_INT5,v_MLUSERFIELD1,v_MLUSERFIELD2,v_MLUSERFIELD3,v_MLUSERFIELD4,v_MLUSERFIELD5,v_MLUSERFIELD6,v_MLUSERFIELD7,v_MLUSERFIELD8,v_MLUSERFIELD9,v_MLUSERFIELD10,v_Bank_ID,v_LAST_NAME_alt1,v_FIRST_NAME_alt1 ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;