-- File Name		: lamratu_upload.sql

-- File Created for	: Upload file for lamratu

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure lamratu_upload(
v_mig_date IN TIMESTAMP
)
   as
   v_Account_NUM	 CHAR(16);
   v_Repay_Acid		 CHAR(32);
   v_Arrears_Amount	 CHAR(49);
   
   
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

EXECUTE IMMEDIATE 'truncate table LAMRATU_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Account_NUM,v_Repay_Acid,v_Arrears_Amount;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into LAMRATU_O_TABLE values (v_Account_NUM,v_Repay_Acid,v_Arrears_Amount ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;