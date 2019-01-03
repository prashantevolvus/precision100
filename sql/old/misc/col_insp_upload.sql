-- File Name		: col_insp_upload.sql

-- File Created for	: Upload file for col_insp

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure col_insp_upload(
v_mig_date IN TIMESTAMP
)
   as
   v_Collateral_Id  	 CHAR(10);
   v_Inspection_Type	 CHAR(5);
   v_Address_line_1 	 CHAR(45);
   v_Address_line_2	 CHAR(45);
   v_City		 CHAR(5);
   v_State		 CHAR(5);
   v_Postal_Code	 CHAR(6);
   v_Telephone_No 	 CHAR(20);
   v_Due_Date_for_Visit	 CHAR(8);
   v_Inspected_CCY_Code	 CHAR(3);
   v_Inspected_Value	 CHAR(17);
   v_Inspection_Emp_ID	 CHAR(10);
   v_Notes_1	 	 CHAR(100);
   v_Notes_2		 CHAR(100);
   v_Del		 CHAR(1);
   
   
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

EXECUTE IMMEDIATE 'truncate table COL_INSP_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Collateral_Id,v_Inspection_Type,v_Address_line_1,v_Address_line_2,v_City,v_State,v_Postal_Code,v_Telephone_No,v_Due_Date_for_Visit,v_Inspected_CCY_Code,v_Inspected_Value,v_Inspection_Emp_ID,v_Notes_1,v_Notes_2,v_Del;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into COL_INSP_O_TABLE values (v_Collateral_Id,v_Inspection_Type,v_Address_line_1,v_Address_line_2,v_City,v_State,v_Postal_Code,v_Telephone_No,v_Due_Date_for_Visit,v_Inspected_CCY_Code,v_Inspected_Value,v_Inspection_Emp_ID,v_Notes_1,v_Notes_2,v_Del ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;