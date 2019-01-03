-- File Name		: ldt_upload.sql

-- File Created for	: Upload file for ldt

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure ldt_upload(
v_mig_date IN TIMESTAMP
)
   as
   v_Account_ID			   CHAR(16);
   v_Demand_Date		   CHAR(10);
   v_Demand_Effective_Date	   CHAR(10);
   v_Principal_Demand_ID	   CHAR(5);
   v_Demand_Amount		   CHAR(17);
   v_Late_Fee_Applied		   CHAR(1);
   v_Late_Fee_Amount		   CHAR(17);
   v_Late_Fee_Date		   CHAR(10);
   v_Status_Of_Late_Fee		   CHAR(1);
   v_Late_Fee_Currency_Code	   CHAR(3);
   v_Demand_Overdue_Date	   CHAR(10);
   v_Accrued_Penal_Interest_Amount CHAR(17);
   v_IBAN_Number		   CHAR(34);

   
   
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

EXECUTE IMMEDIATE 'truncate table LDT_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Account_ID,v_Demand_Date,v_Demand_Effective_Date,v_Principal_Demand_ID,v_Demand_Amount,v_Late_Fee_Applied,v_Late_Fee_Amount,v_Late_Fee_Date,v_Status_Of_Late_Fee,v_Late_Fee_Currency_Code,v_Demand_Overdue_Date,v_Accrued_Penal_Interest_Amount,v_IBAN_Number;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into LDT_O_TABLE values (v_Account_ID,v_Demand_Date,v_Demand_Effective_Date,v_Principal_Demand_ID,v_Demand_Amount,v_Late_Fee_Applied,v_Late_Fee_Amount,v_Late_Fee_Date,v_Status_Of_Late_Fee,v_Late_Fee_Currency_Code,v_Demand_Overdue_Date,v_Accrued_Penal_Interest_Amount,v_IBAN_Number ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;