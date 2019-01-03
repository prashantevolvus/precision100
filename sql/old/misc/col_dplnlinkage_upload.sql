-- File Name		: col_dplnlinkage_upload.sql

-- File Created for	: Upload file for col_dplnlinkage

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure col_dplnlinkage_upload(
v_mig_date IN TIMESTAMP
)
   as
   v_Account_No  	 	CHAR(16);
   v_Applicable_Date	 	CHAR(8);
   v_Currency_Code 	 	CHAR(3);
   v_Drawing_Power_Indicator	CHAR(1);
   v_Drawing_Power	 	CHAR(17);
   v_DACC_Limit_Percentage	CHAR(8);
   v_DACC_Limit_Absolute_Value	CHAR(17);
   v_Remarks 	 		CHAR(240);
   v_Recall_flag 	 	CHAR(1);
   v_Limit_Prefix	 	CHAR(12);
   v_Limit_Suffix	 	CHAR(5);

   
   
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

EXECUTE IMMEDIATE 'truncate table COL_DPLNLINKAGE_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Account_No,v_Applicable_Date,v_Currency_Code,v_Drawing_Power_Indicator,v_Drawing_Power,v_DACC_Limit_Percentage,v_DACC_Limit_Absolute_Value,v_Remarks,v_Recall_flag,v_Limit_Prefix,v_Limit_Suffix;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into COL_DPLNLINKAGE_O_TABLE values (v_Account_No,v_Applicable_Date,v_Currency_Code,v_Drawing_Power_Indicator,v_Drawing_Power,v_DACC_Limit_Percentage,v_DACC_Limit_Absolute_Value,v_Remarks,v_Recall_flag,v_Limit_Prefix,v_Limit_Suffix ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;