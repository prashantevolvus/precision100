-- File Name		: limithisitory.sql

-- File Created for	: Upload file for limithisitory

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure limithisitory(
v_mig_date IN TIMESTAMP
)
   as
   v_Indicator  		 CHAR(3);
   v_Account_Number		 CHAR(16);
   v_Applicable_Date		 CHAR(8);
   v_Crncy_Code  		 CHAR(3);
   v_Sanction_Limit_Amount	 CHAR(17);
   v_Limit_Sanction_Date	 CHAR(8);
   v_Limit_Expiry_Date		 CHAR(8);
   v_Limit_Penalty_Month	 CHAR(4);
   v_Limit_Penalty_Day		 CHAR(4);
   v_Loan_paper_date		 CHAR(8);
   v_Limit_review_date		 CHAR(8);
   v_Sanction_level_code	 CHAR(5);
   v_Sanction_authority_code	 CHAR(5);
   v_Sanction_ref_number	 CHAR(25);
   v_Limit_level_Interest_Flag	 CHAR(1);
   v_Limit_Normal_Interest_Rate	 CHAR(10);
   v_Limit_Penal_Interest_Rate	 CHAR(10);
   v_Security_Description	 CHAR(240);
   v_Remarks			 CHAR(240);
   v_Limit_Margin_Interest_Rate	 CHAR(10);
   
--  DECLARE
   CURSOR c1 is
     select 'LHT',
--   v_Indicator  		 CHAR(3);
--   v_Account_Number		 CHAR(16);
            lpad(map_acc.fin_acc_num,16,' '),
--   v_Applicable_Date		 CHAR(8);
            lpad(' ',8,' '),
--   v_Crncy_Code  		 CHAR(3);
            lpad(' ',3,' '),
--   v_Sanction_Limit_Amount	 CHAR(17);
            lpad(' ',17,' '),
--   v_Limit_Sanction_Date	 CHAR(8);
            lpad(' ',8,' '),
--  v_Limit_Expiry_Date		 CHAR(8);
            lpad(' ',8,' '),
--   v_Limit_Penalty_Month	 CHAR(4);
            lpad(' ',4,' '),
--  v_Limit_Penalty_Day		 CHAR(4);
            lpad(' ',4,' '),
--   v_Loan_paper_date		 CHAR(8);
            lpad(' ',8,' '),
--  v_Limit_review_date		 CHAR(8);
            lpad(' ',8,' '),
--   v_Sanction_level_code	 CHAR(5);
            lpad(' ',5,' '),
--   v_Sanction_authority_code	 CHAR(5);
            lpad(' ',5,' '),
--   v_Sanction_ref_number	 CHAR(25);
            lpad(' ',25,' '),
--  v_Limit_level_Interest_Flag	 CHAR(1);
            lpad(' ',1,' '),
-- v_Limit_Normal_Interest_Rate	 CHAR(10);
            lpad(' ',10,' '),
--  v_Limit_Penal_Interest_Rate	 CHAR(10);
            lpad(' ',10,' '),
--   v_Security_Description	 CHAR(240);
            lpad(' ',240,' '),
--   v_Remarks			 CHAR(240);
            lpad(' ',240,' '),
-- v_Limit_Margin_Interest_Rate	 CHAR(10);
            lpad(' ',10,' '),

--            lpad(' ',5,' '),
--            lpad(nvl(pack_mig_bm.get_date_fm_btrv(jusdte),' '),8,' '),
--            lpad(nvl(pack_mig_bm.get_date_fm_btrv(juhed),' '),8,' '),
--            lpad(' ',5,' '),
--  	from jupf;

   
BEGIN

Begin

EXECUTE IMMEDIATE 'truncate table LIMITHISITORY_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Indicator,v_Account_Number,v_Applicable_Date,v_Crncy_Code,v_Sanction_Limit_Amount,v_Limit_Sanction_Date,v_Limit_Expiry_Date,v_Limit_Penalty_Month,v_Limit_Penalty_Day,v_Loan_paper_date,v_Limit_review_date,v_Sanction_level_code,v_Sanction_authority_code,v_Sanction_ref_number,v_Limit_level_Interest_Flag,v_Limit_Normal_Interest_Rate,v_Limit_Penal_Interest_Rate,v_Security_Description,v_Remarks,v_Limit_Margin_Interest_Rate;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into LIMITHISITORY_O_TABLE values (v_Indicator,v_Account_Number,v_Applicable_Date,v_Crncy_Code,v_Sanction_Limit_Amount,v_Limit_Sanction_Date,v_Limit_Expiry_Date,v_Limit_Penalty_Month,v_Limit_Penalty_Day,v_Loan_paper_date,v_Limit_review_date,v_Sanction_level_code,v_Sanction_authority_code,v_Sanction_ref_number,v_Limit_level_Interest_Flag,v_Limit_Normal_Interest_Rate,v_Limit_Penal_Interest_Rate,v_Security_Description,v_Remarks,v_Limit_Margin_Interest_Rate ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;