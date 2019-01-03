-- File Name		: col_others_upload.sql

-- File Created for	: Upload file for col_others

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure col_others_upload(
v_mig_date IN TIMESTAMP
)
   as
   v_Collateral_Id  	 	CHAR(10);
   v_Withdraw	 		CHAR(1);
   v_Value_Indicator 	 	CHAR(1);
   v_Reason_Code	 	CHAR(5);
   v_Lodged_Date	 	CHAR(8);
   v_Withdrawn_Date	 	CHAR(8);
   v_Review_Date	 	CHAR(8);
   v_Received_Date 	 	CHAR(8);
   v_Collateral_Value 	 	CHAR(17);
   v_Due_Date	 		CHAR(8);
   v_Aportioned_Value	 	CHAR(17);
   v_Apportioned_Value_CCY_Code	CHAR(3);
   v_Notes	 		CHAR(240);
   v_Nature_of_charge	 	CHAR(5);
   
   
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

EXECUTE IMMEDIATE 'truncate table COL_OTHERS_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Collateral_Id,v_Withdraw,v_Value_Indicator,v_Reason_Code,v_Lodged_Date,v_Withdrawn_Date,v_Review_Date,v_Received_Date,v_Collateral_Value,v_Due_Date,v_Aportioned_Value,v_Apportioned_Value_CCY_Code,v_Notes,v_Nature_of_charge;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into COL_OTHERS_O_TABLE values (v_Collateral_Id,v_Withdraw,v_Value_Indicator,v_Reason_Code,v_Lodged_Date,v_Withdrawn_Date,v_Review_Date,v_Received_Date,v_Collateral_Value,v_Due_Date,v_Aportioned_Value,v_Apportioned_Value_CCY_Code,v_Notes,v_Nature_of_charge ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;