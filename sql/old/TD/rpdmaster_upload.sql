-- File Name		: rpdmaster_upload.sql

-- File Created for	: Upload file for rpdmaster

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure rpdmaster_upload(
v_mig_date IN TIMESTAMP
)
   as
   v_Master_Account_ID		  CHAR(16);
   v_Cif_Id			  CHAR(50);
   v_Record_Type		  CHAR(1);
   v_Name			  CHAR(80);
   v_Designation		  CHAR(5);
   v_Remarks			  CHAR(60);
   v_Amount_allowed		  CHAR(17);
   v_Start_date			  CHAR(10);
   v_End_date			  CHAR(10);
   v_Customer_Relation_Code	  CHAR(5);
   v_Pass_Sheet_flag		  CHAR(1);
   v_Standing_Instruction_adv_flg CHAR(1);
   v_TD_Maturity_Notice_Flg	  CHAR(1);
   v_Interest_Advice_Flag	  CHAR(1);
   v_Interest_Certificate_Flag	  CHAR(1);
   v_Guarantor_liab_Percent	  CHAR(8);
   v_Guarantor_liab_sequence	  CHAR(2);
   v_Mode_of_Despatch		  CHAR(1);
   v_Statement_Cif_Id		  CHAR(50);
   v_Exclude_Combined_Statement	  CHAR(1);
   v_Currency_Code		  CHAR(3);
   v_Communication_Address_1	  CHAR(45);
   v_Communication_Address_2	  CHAR(45);
   v_Communication_Address_3	  CHAR(45);
   v_Communication_City_Code	  CHAR(5);
   v_Communication_State_Code	  CHAR(5);
   v_Communication_Country_Code	  CHAR(5);
   v_Communication_Pin_Code	  CHAR(6);
   v_Communication_Phone_Number_1 CHAR(20);
   v_Communication_Phone_Number_2 CHAR(20);
   v_Communication_Fax_Number_1	  CHAR(20);
   v_Communication_Fax_Number_2	  CHAR(20);
   v_Communication_Email_Id	  CHAR(50);
   v_Communication_Telex_Number	  CHAR(15);
   v_Related_Party_Title_Code	  CHAR(5);
   v_Address_Type		  CHAR(12);
   v_Phone_Type			  CHAR(12);
   v_Email_Type			  CHAR(12);
   v_Alternate_Name		  CHAR(80);
   
   
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

EXECUTE IMMEDIATE 'truncate table RPDMASTER_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Master_Account_ID,v_Cif_Id,v_Record_Type,v_Name,v_Designation,v_Remarks,v_Amount_allowed,v_Start_date,v_End_date,v_Customer_Relation_Code,v_Pass_Sheet_flag,v_Standing_Instruction_adv_flg,v_TD_Maturity_Notice_Flg,v_Interest_Advice_Flag,v_Interest_Certificate_Flag,v_Guarantor_liab_Percent,v_Guarantor_liab_sequence,v_Mode_of_Despatch,v_Statement_Cif_Id,v_Exclude_Combined_Statement,v_Currency_Code,v_Communication_Address_1,v_Communication_Address_2,v_Communication_Address_3,v_Communication_City_Code,v_Communication_State_Code,v_Communication_Country_Code,v_Communication_Pin_Code,v_Communication_Phone_Number_1,v_Communication_Phone_Number_2,v_Communication_Fax_Number_1,v_Communication_Fax_Number_2,v_Communication_Email_Id,v_Communication_Telex_Number,v_Related_Party_Title_Code,v_Address_Type,v_Phone_Type,v_Email_Type,v_Alternate_Name;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into RPDMASTER_O_TABLE values (v_Master_Account_ID,v_Cif_Id,v_Record_Type,v_Name,v_Designation,v_Remarks,v_Amount_allowed,v_Start_date,v_End_date,v_Customer_Relation_Code,v_Pass_Sheet_flag,v_Standing_Instruction_adv_flg,v_TD_Maturity_Notice_Flg,v_Interest_Advice_Flag,v_Interest_Certificate_Flag,v_Guarantor_liab_Percent,v_Guarantor_liab_sequence,v_Mode_of_Despatch,v_Statement_Cif_Id,v_Exclude_Combined_Statement,v_Currency_Code,v_Communication_Address_1,v_Communication_Address_2,v_Communication_Address_3,v_Communication_City_Code,v_Communication_State_Code,v_Communication_Country_Code,v_Communication_Pin_Code,v_Communication_Phone_Number_1,v_Communication_Phone_Number_2,v_Communication_Fax_Number_1,v_Communication_Fax_Number_2,v_Communication_Email_Id,v_Communication_Telex_Number,v_Related_Party_Title_Code,v_Address_Type,v_Phone_Type,v_Email_Type,v_Alternate_Name ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;