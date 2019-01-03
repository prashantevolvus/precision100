-- File Name		: col_immov_upload.sql

-- File Created for	: Upload file for col_immov

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure col_immov_upload(
v_mig_date IN TIMESTAMP
)
   as
   v_Collateral_Id  	 	  CHAR(10);
   v_Withdraw	 		  CHAR(1);
   v_Value_Indicator 	 	  CHAR(1);
   v_Reason_Code	 	  CHAR(5);
   v_Nature_of_charge	 	  CHAR(5);
   v_ThirdParty_LienValue_CCYCode CHAR(3);
   v_Third_Party_Lien_Value	  CHAR(17);
   v_Derive_Value_From 	 	  CHAR(1);
   v_Assessed_Value_CCY_Code 	  CHAR(3);
   v_Assessed_Value	 	  CHAR(17);
   v_Invoice_Value_CCY_Code	  CHAR(3);
   v_Invoice_Value	 	  CHAR(17);
   v_Market_Value_CCY_Code	  CHAR(3);
   v_Market_Value	 	  CHAR(17);
   v_Written_Down_Value_CCY_Code  CHAR(3);
   v_Written_Down_Value	 	  CHAR(17);
   v_Apportioned_Value_CCY_Code	  CHAR(3);
   v_Apportioned_Value	 	  CHAR(17);
   v_Collateral_Value_CCY_Code	  CHAR(3);
   v_Collateral_Value	 	  CHAR(17);
   v_Property_Document_No	  CHAR(20);
   v_Lodged_Date	 	  CHAR(8);
   v_Withdrawn_Date	 	  CHAR(8);
   v_Review_Date	 	  CHAR(8);
   v_Received_Date	 	  CHAR(8);
   v_Due_Date	 		  CHAR(8);
   v_Date_of_Purchase	 	  CHAR(8);
   v_Built_Area	 		  CHAR(15);
   v_Built_Unit_of_Measurement	  CHAR(5);
   v_Land_Ares_of_Measurement	  CHAR(5);
   v_Builder_Name	 	  CHAR(16);
   v_Property_Rating	 	  CHAR(5);
   v_Year_of_Construction	  CHAR(2);
   v_Address_line_1	 	  CHAR(40);
   v_Address_line_2	 	  CHAR(40);
   v_Address_line_3	 	  CHAR(40);
   v_Address_line_4	 	  CHAR(40);
   v_Address_line_5	 	  CHAR(40);
   v_City	 		  CHAR(5);
   v_State	 		  CHAR(5);
   v_Zip_PIN_Code	 	  CHAR(6);
   v_Property_Owner	 	  CHAR(250);
   v_Leased	 		  CHAR(1);
   v_Lease_Expiry_Date	 	  CHAR(8);
   v_CIF_Id	 		  CHAR(32);
   v_Age_of_Building	 	  CHAR(4);
   v_Notes	 		  CHAR(240);
   
   
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

EXECUTE IMMEDIATE 'truncate table COL_IMMOV_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Collateral_Id,v_Withdraw,v_Value_Indicator,v_Reason_Code,v_Nature_of_charge,v_ThirdParty_LienValue_CCYCode,v_Third_Party_Lien_Value,v_Derive_Value_From,v_Assessed_Value_CCY_Code,v_Assessed_Value,v_Invoice_Value_CCY_Code,v_Invoice_Value,v_Market_Value_CCY_Code,v_Market_Value,v_Written_Down_Value_CCY_Code,v_Written_Down_Value,v_Apportioned_Value_CCY_Code,v_Apportioned_Value,v_Collateral_Value_CCY_Code,v_Collateral_Value,v_Property_Document_No,v_Lodged_Date,v_Withdrawn_Date,v_Review_Date,v_Received_Date,v_Due_Date,v_Date_of_Purchase,v_Built_Area,v_Built_Unit_of_Measurement,v_Land_Ares_of_Measurement,v_Builder_Name,v_Property_Rating,v_Year_of_Construction,v_Address_line_1,v_Address_line_2,v_Address_line_3,v_Address_line_4,v_Address_line_5,v_City,v_State,v_Zip_PIN_Code,v_Property_Owner,v_Leased,v_Lease_Expiry_Date,v_CIF_Id,v_Age_of_Building,v_Notes;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into COL_IMMOV_O_TABLE values (v_Collateral_Id,v_Withdraw,v_Value_Indicator,v_Reason_Code,v_Nature_of_charge,v_ThirdParty_LienValue_CCYCode,v_Third_Party_Lien_Value,v_Derive_Value_From,v_Assessed_Value_CCY_Code,v_Assessed_Value,v_Invoice_Value_CCY_Code,v_Invoice_Value,v_Market_Value_CCY_Code,v_Market_Value,v_Written_Down_Value_CCY_Code,v_Written_Down_Value,v_Apportioned_Value_CCY_Code,v_Apportioned_Value,v_Collateral_Value_CCY_Code,v_Collateral_Value,v_Property_Document_No,v_Lodged_Date,v_Withdrawn_Date,v_Review_Date,v_Received_Date,v_Due_Date,v_Date_of_Purchase,v_Built_Area,v_Built_Unit_of_Measurement,v_Land_Ares_of_Measurement,v_Builder_Name,v_Property_Rating,v_Year_of_Construction,v_Address_line_1,v_Address_line_2,v_Address_line_3,v_Address_line_4,v_Address_line_5,v_City,v_State,v_Zip_PIN_Code,v_Property_Owner,v_Leased,v_Lease_Expiry_Date,v_CIF_Id,v_Age_of_Building,v_Notes ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;