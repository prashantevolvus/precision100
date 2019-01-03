-- File Name		: col_linkage_upload.sql

-- File Created for	: Upload file for col_linkage

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure col_linkage_upload(
v_mig_date IN TIMESTAMP
)
   as
   v_Collateral_Id  	 CHAR(10);
   v_Account_Id		 CHAR(16);
   v_Limit_Prefix 	 CHAR(12);
   v_Limit_Suffix	 CHAR(5);
   v_Collateral_Value	 CHAR(20);
   v_Apportioned_Value	 CHAR(20);
   v_Margin_Percent	 CHAR(9);
   v_LTV_percent 	 CHAR(9);
   v_Primary_Secondary 	 CHAR(1);
   
   
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

EXECUTE IMMEDIATE 'truncate table COL_LINKAGE_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Collateral_Id,v_Account_Id,v_Limit_Prefix,v_Limit_Suffix,v_Collateral_Value,v_Apportioned_Value,v_Margin_Percent,v_LTV_percent,v_Primary_Secondary;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into COL_LINKAGE_O_TABLE values (v_Collateral_Id,v_Account_Id,v_Limit_Prefix,v_Limit_Suffix,v_Collateral_Value,v_Apportioned_Value,v_Margin_Percent,v_LTV_percent,v_Primary_Secondary ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;