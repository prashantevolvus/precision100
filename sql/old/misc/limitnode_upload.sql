-- File Name		: limitnode_upload.sql

-- File Created for	: Upload file for limitnode

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure limitnode_upload(
v_mig_date IN TIMESTAMP
)
   as
   v_borrower_name  	  CHAR(25);
   v_node_level	 	  CHAR(1);
   v_limit_prefix 	  CHAR(16);
   v_limit_suffix	  CHAR(5);
   v_limit_desc	 	  CHAR(25);
   v_crncy_code	 	  CHAR(5);
   v_parent_limit_prefix  CHAR(12);
   v_parent_limit_suffix  CHAR(5);
   v_Sanction_Limit 	  CHAR(17);
   v_Drawing_power_ind	  CHAR(1);
   v_Limit_approval_date  CHAR(99);
   v_Limit_expiry_date	  CHAR(99);
   v_Limit_review_date	  CHAR(99);
   v_Approval_auth_code	  CHAR(5);
   v_Approval_level	  CHAR(5);
   v_Limit_approval_ref	  CHAR(25);
   v_Notes		  CHAR(60);
   v_Terms_and_Conditions CHAR(75);
   
   
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

EXECUTE IMMEDIATE 'truncate table LIMITNODE_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_borrower_name,v_node_level,v_limit_prefix,v_limit_suffix,v_limit_desc,v_crncy_code,v_parent_limit_prefix,v_parent_limit_suffix,v_Sanction_Limit,v_Drawing_power_ind,v_Limit_approval_date,v_Limit_expiry_date,v_Limit_review_date,v_Approval_auth_code,v_Approval_level,v_Limit_approval_ref,v_Notes,v_Terms_and_Conditions;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into LIMITNODE_O_TABLE values (v_borrower_name,v_node_level,v_limit_prefix,v_limit_suffix,v_limit_desc,v_crncy_code,v_parent_limit_prefix,v_parent_limit_suffix,v_Sanction_Limit,v_Drawing_power_ind,v_Limit_approval_date,v_Limit_expiry_date,v_Limit_review_date,v_Approval_auth_code,v_Approval_level,v_Limit_approval_ref,v_Notes,v_Terms_and_Conditions ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;