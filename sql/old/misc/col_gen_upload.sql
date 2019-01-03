-- File Name		: col_gen_upload.sql

-- File Created for	: Upload file for col_gen

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure col_gen_upload(
v_mig_date IN TIMESTAMP
)
   as
   v_Type  	 		 CHAR(1);
   v_Collateral_Id	 	 CHAR(10);
   v_Drawing_Power_Contribution  CHAR(17);
   v_Collateral_Code	 	 CHAR(8);
   v_CCY	 		 CHAR(3);
   v_Collateral_Class	 	 CHAR(5);
   v_Collateral_Group	 	 CHAR(5);
   v_Ceiling_Limit 	 	 CHAR(17);
   v_Margin_percent 		 CHAR(10);
   v_Loan_to_Value_percent	 CHAR(10);
   v_Dr_AC_for_FeesLoan_to_Value CHAR(16);
   v_Last_Valuation_Date	 CHAR(8);
   
   
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

EXECUTE IMMEDIATE 'truncate table COL_GEN_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Type,v_Collateral_Id,v_Drawing_Power_Contribution,v_Collateral_Code,v_CCY,v_Collateral_Class,v_Collateral_Group,v_Ceiling_Limit,v_Margin_percent,v_Loan_to_Value_percent,v_Dr_AC_for_FeesLoan_to_Value,v_Last_Valuation_Date;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into COL_GEN_O_TABLE values (v_Type,v_Collateral_Id,v_Drawing_Power_Contribution,v_Collateral_Code,v_CCY,v_Collateral_Class,v_Collateral_Group,v_Ceiling_Limit,v_Margin_percent,v_Loan_to_Value_percent,v_Dr_AC_for_FeesLoan_to_Value,v_Last_Valuation_Date ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;