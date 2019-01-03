-- File Name		: col_guar_upload.sql

-- File Created for	: Upload file for col_guar

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure col_guar_upload(
v_mig_date IN TIMESTAMP
)
   as
   v_Collateral_Id  	 	 CHAR(10);
   v_Withdraw	 		 CHAR(1);
   v_Value_Indicator 	 	 CHAR(1);
   v_Reason_Code	 	 CHAR(5);
   v_Guarantor_Type	 	 CHAR(1);
   v_Guarantor_ID	 	 CHAR(9);
   v_Lodged_Date	 	 CHAR(8);
   v_Guatantor_Type 	 	 CHAR(5);
   v_Withdrawn_Date 	 	 CHAR(8);
   v_Review_Date	 	 CHAR(8);
   v_Guarantee_percentage	 CHAR(9);
   v_Guarantee_Amount	 	 CHAR(20);
   v_Received_Date	 	 CHAR(8);
   v_Collateral_Value	 	 CHAR(17);
   v_Due_Date	 	 	 CHAR(8);
   v_Aportioned_Value	 	 CHAR(17);
   v_Apportioned_Value_CCY_Code	 CHAR(3);
   v_Address_line_1	 	 CHAR(40);
   v_Address_line_2	 	 CHAR(40);
   v_Address_line_3	 	 CHAR(40);
   v_City		 	 CHAR(5);
   v_State	 		 CHAR(5);
   v_Zip_PIN_Code	 	 CHAR(6);
   v_Notes	 		 CHAR(240);
   
   
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

EXECUTE IMMEDIATE 'truncate table COL_GUAR_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Collateral_Id,v_Withdraw,v_Value_Indicator,v_Reason_Code,v_Guarantor_Type,v_Guarantor_ID,v_Lodged_Date,v_Guatantor_Type,v_Withdrawn_Date,v_Review_Date,v_Guarantee_percentage,v_Guarantee_Amount,v_Received_Date,v_Collateral_Value,v_Due_Date,v_Aportioned_Value,v_Apportioned_Value_CCY_Code,v_Address_line_1,v_Address_line_2,v_Address_line_3,v_City,v_State,v_Zip_PIN_Code,v_Notes;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into COL_GUAR_O_TABLE values (v_Collateral_Id,v_Withdraw,v_Value_Indicator,v_Reason_Code,v_Guarantor_Type,v_Guarantor_ID,v_Lodged_Date,v_Guatantor_Type,v_Withdrawn_Date,v_Review_Date,v_Guarantee_percentage,v_Guarantee_Amount,v_Received_Date,v_Collateral_Value,v_Due_Date,v_Aportioned_Value,v_Apportioned_Value_CCY_Code,v_Address_line_1,v_Address_line_2,v_Address_line_3,v_City,v_State,v_Zip_PIN_Code,v_Notes ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;