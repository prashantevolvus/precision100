-- File Name		: businessinformation_upload.sql

-- File Created for	: Upload file for businessinformation

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure businessinformation_upload(
v_mig_date IN TIMESTAMP
)
   as
   v_Account_Number		 CHAR(16);
   v_Record_Indicator		 CHAR(1);
   v_Project_Country_Code	 CHAR(5);
   v_Project_Name		 CHAR(25);
   v_Project_Cost		 CHAR(17);
   v_Utilized_Limit		 CHAR(17);
   v_Sales_Managers_Emp_ID	 CHAR(10);
   v_Credit_Manager_Emp_ID	 CHAR(10);
   v_Reviewer_Emp_ID		 CHAR(10);
   v_User_Field_1		 CHAR(5);
   v_Remarks			 CHAR(50);
   v_Rating_Agency		 CHAR(5);
   v_Rating			 CHAR(5);
   v_Rating_Date		 CHAR(10);
   v_Rating_Expiry_Date		 CHAR(10);
   v_Interest_Rate_Ref_Country	 CHAR(5);
   
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

EXECUTE IMMEDIATE 'truncate table BUSINESSINFORMATION_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Account_Number,v_Record_Indicator,v_Project_Country_Code,v_Project_Name,v_Project_Cost,v_Utilized_Limit,v_Sales_Managers_Emp_ID,v_Credit_Manager_Emp_ID,v_Reviewer_Emp_ID,v_User_Field_1,v_Remarks,v_Rating_Agency,v_Rating,v_Rating_Date,v_Rating_Expiry_Date,v_Interest_Rate_Ref_Country;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into BUSINESSINFORMATION_O_TABLE values (v_Account_Number,v_Record_Indicator,v_Project_Country_Code,v_Project_Name,v_Project_Cost,v_Utilized_Limit,v_Sales_Managers_Emp_ID,v_Credit_Manager_Emp_ID,v_Reviewer_Emp_ID,v_User_Field_1,v_Remarks,v_Rating_Agency,v_Rating,v_Rating_Date,v_Rating_Expiry_Date,v_Interest_Rate_Ref_Country ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;