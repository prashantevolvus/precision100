-- File Name		: crophousehold_upload.sql

-- File Created for	: Upload file for crophousehold

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure crophousehold_upload(
v_mig_date IN TIMESTAMP
)
   as
   v_CORP_KEY  			 CHAR(50);
   v_GROUPHOUSEHOLDCODE		 CHAR(50);
   v_SHAREHOLDING_IN_PERCENTAGE	 CHAR(18);
   v_Text1			 CHAR(200);
   v_Text2			 CHAR(200);
   v_Text3			 CHAR(200);
   v_Date1			 CHAR(17);
   v_Date2 			 CHAR(17);
   v_Date3 			 CHAR(17);
   v_Dropdown1			 CHAR(50);
   v_Dropdown2			 CHAR(50);
   v_Dropdown3			 CHAR(50);
   v_Lookup1			 CHAR(50);
   v_Lookup2			 CHAR(50);
   v_Lookup3			 CHAR(50);
   v_GROUPHOUSEHOLDNAME		 CHAR(200);
   v_BANK_ID			 CHAR(99);
   v_Group_ID			 CHAR(99);
   
   
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

EXECUTE IMMEDIATE 'truncate table CROPHOUSEHOLD_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_CORP_KEY,v_GROUPHOUSEHOLDCODE,v_SHAREHOLDING_IN_PERCENTAGE,v_Text1,v_Text2,v_Text3,v_Date1,v_Date2,v_Date3,v_Dropdown1,v_Dropdown2,v_Dropdown3,v_Lookup1,v_Lookup2,v_Lookup3,v_GROUPHOUSEHOLDNAME,v_BANK_ID,v_Group_ID ;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into CROPHOUSEHOLD_O_TABLE values (v_CORP_KEY,v_GROUPHOUSEHOLDCODE,v_SHAREHOLDING_IN_PERCENTAGE,v_Text1,v_Text2,v_Text3,v_Date1,v_Date2,v_Date3,v_Dropdown1,v_Dropdown2,v_Dropdown3,v_Lookup1,v_Lookup2,v_Lookup3,v_GROUPHOUSEHOLDNAME,v_BANK_ID,v_Group_ID ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;