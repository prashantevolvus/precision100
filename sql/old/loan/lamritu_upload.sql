-- File Name		: lamritu_upload.sql

-- File Created for	: Upload file for lamritu

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure lamritu_upload(
v_mig_date IN TIMESTAMP
)
   as
   v_Account_NUM		   CHAR(16);
   v_Instalment_Type		   CHAR(5);
   v_Repayment_Mode		   CHAR(1);
   v_Amount_Percent_Indicator	   CHAR(1);
   v_Value_In_Amount		   CHAR(17);
   v_Value_In_Percentage	   CHAR(10);
   v_Recovery_Acid		   CHAR(16);
   v_Fee_Type			   CHAR(5);
   v_ECS_Mandatory_Serial_Number   CHAR(12);
   v_Instruction_start_date	   CHAR(10);
   v_Instruction_End_Date	   CHAR(10);
   v_Max_num_of_Unsuccessfulattmpt CHAR(5);
   
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

EXECUTE IMMEDIATE 'truncate table LAMRITU_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Account_NUM,v_Instalment_Type,v_Repayment_Mode,v_Amount_Percent_Indicator,v_Value_In_Amount,v_Value_In_Percentage,v_Recovery_Acid,v_Fee_Type,v_ECS_Mandatory_Serial_Number,v_Instruction_start_date,v_Instruction_End_Date,v_Max_num_of_Unsuccessfulattmpt;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into LAMRITU_O_TABLE values (v_Account_NUM,v_Instalment_Type,v_Repayment_Mode,v_Amount_Percent_Indicator,v_Value_In_Amount,v_Value_In_Percentage,v_Recovery_Acid,v_Fee_Type,v_ECS_Mandatory_Serial_Number,v_Instruction_start_date,v_Instruction_End_Date,v_Max_num_of_Unsuccessfulattmpt ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;