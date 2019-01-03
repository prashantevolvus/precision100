-- File Name		: cropemail_upload.sql

-- File Created for	: Upload file for cropemail

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure cropemail_upload(
v_mig_date IN TIMESTAMP
)
   as
   v_CORP_KEY  		 CHAR(50);
   v_PHONEEMAILTYPE	 CHAR(200);
   v_PHONEOREMAIL	 CHAR(50);
   v_PHONE_NO		 CHAR(25);
   v_PHONENOLOCALCODE	 CHAR(20);
   v_PHONENOCITYCODE	 CHAR(20);
   v_PHONENOCOUNTRYCODE	 CHAR(20);
   v_WORKEXTENSION	 CHAR(30);
   v_EMAIL 		 CHAR(50);
   v_EMAILPALM		 CHAR(50);
   v_URL		 CHAR(150);
   v_PREFERRED_FLAG	 CHAR(50);
   v_Start_Date		 CHAR(17);
   v_End_Date		 CHAR(17);
   v_USERFIELD1		 CHAR(200);
   v_USERFIELD2		 CHAR(200);
   v_USERFIELD3		 CHAR(200);
   v_DATE1		 CHAR(17);
   v_DATE2		 CHAR(17);
   v_DATE3		 CHAR(17);
   v_BANK_ID		 CHAR(8);   
   
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

EXECUTE IMMEDIATE 'truncate table CROPEMAIL_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_CORP_KEY,v_PHONEEMAILTYPE,v_PHONEOREMAIL,v_PHONE_NO,v_PHONENOLOCALCODE,v_PHONENOCITYCODE,v_PHONENOCOUNTRYCODE,v_WORKEXTENSION,v_EMAIL,v_EMAILPALM,v_URL,v_PREFERRED_FLAG,v_Start_Date,v_End_Date,v_USERFIELD1,v_USERFIELD2,v_USERFIELD3,v_DATE1,v_DATE2,v_DATE3,v_BANK_ID;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into CROPEMAIL_O_TABLE values (v_CORP_KEY,v_PHONEEMAILTYPE,v_PHONEOREMAIL,v_PHONE_NO,v_PHONENOLOCALCODE,v_PHONENOCITYCODE,v_PHONENOCOUNTRYCODE,v_WORKEXTENSION,v_EMAIL,v_EMAILPALM,v_URL,v_PREFERRED_FLAG,v_Start_Date,v_End_Date,v_USERFIELD1,v_USERFIELD2,v_USERFIELD3,v_DATE1,v_DATE2,v_DATE3,v_BANK_ID ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;