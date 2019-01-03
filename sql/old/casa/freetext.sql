-- File Name		: freetext.sql

-- File Created for	: Upload file for freetext

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure freetext(
v_mig_date IN TIMESTAMP
)
   as
   v_Account_ID  	 CHAR(16);
   v_Free_Text_1	 CHAR(80);
   v_Free_Text_2 	 CHAR(80);
   v_Free_Text_3	 CHAR(80);
   v_Free_Text_4	 CHAR(80);
   v_Free_Text_5	 CHAR(80);
   v_Free_Text_6	 CHAR(80);
   v_Free_Text_7 	 CHAR(80);
   v_Free_Text_8 	 CHAR(80);
   v_Free_Text_9	 CHAR(80);
   v_Free_Text_10	 CHAR(80);
   v_Free_Text_11	 CHAR(80);
   v_Free_Text_12	 CHAR(80);
   v_Free_Text_13	 CHAR(80);
   v_Free_Text_14	 CHAR(80);
   v_Free_Text_15	 CHAR(80);
   
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

EXECUTE IMMEDIATE 'truncate table AC_FREETEXT_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Account_ID,v_Free_Text_1,v_Free_Text_2,v_Free_Text_3,v_Free_Text_4,v_Free_Text_5,v_Free_Text_6,v_Free_Text_7,v_Free_Text_8,v_Free_Text_9,v_Free_Text_10,v_Free_Text_11,v_Free_Text_12,v_Free_Text_13,v_Free_Text_14,v_Free_Text_15;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into AC_FREETEXT_O_TABLE values (v_Account_ID,v_Free_Text_1,v_Free_Text_2,v_Free_Text_3,v_Free_Text_4,v_Free_Text_5,v_Free_Text_6,v_Free_Text_7,v_Free_Text_8,v_Free_Text_9,v_Free_Text_10,v_Free_Text_11,v_Free_Text_12,v_Free_Text_13,v_Free_Text_14,v_Free_Text_15 ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;