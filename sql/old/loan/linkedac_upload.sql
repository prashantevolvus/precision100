-- File Name		: linkedac_upload.sql

-- File Created for	: Upload file for linkedac

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure linkedac_upload(
v_mig_date IN TIMESTAMP
)
   as
   v_Account_Number		 CHAR(16);
   v_Linked_Account_Number	 CHAR(16)'
   v_Link_Type			 CHAR(5);
   v_Linked_Amount		 CHAR(17);
   v_Linked_Amount_Currency	 CHAR(3);
   v_Remarks			 CHAR(60);

   
   
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

EXECUTE IMMEDIATE 'truncate table LINKEDAC_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Account_Number,v_Linked_Account_Number,v_Link_Type,v_Linked_Amount,v_Linked_Amount_Currency,v_Remarks;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into LINKEDAC_O_TABLE values (v_Account_Number,v_Linked_Account_Number,v_Link_Type,v_Linked_Amount,v_Linked_Amount_Currency,v_Remarks ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;