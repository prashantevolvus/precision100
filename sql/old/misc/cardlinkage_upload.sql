-- File Name		: cardlinkage_upload.sql

-- File Created for	: Upload file for cardlinkage

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure cardlinkage_upload(
v_mig_date IN TIMESTAMP
)
   as
   v_crd_srl_num 	 CHAR(12);
   v_card_number	 CHAR(19);
   v_Account_Number 	 CHAR(16);
   v_entity_cre_flg	 CHAR(1);
   v_primary_acct_flg	 CHAR(1);
   v_linked_flg	 	 CHAR(1);
   v_last_linked_date	 CHAR(99);
   v_last_delinked_date  CHAR(99);
   v_lchg_user_id 	 CHAR(15);
   v_lchg_time	 	 CHAR(99);
   v_rcre_user_id	 CHAR(15);
   v_rcre_time	 	 CHAR(99);
   v_bank_id	 	 CHAR(8);
   
   
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

EXECUTE IMMEDIATE 'truncate table CARDLINKAGE_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_crd_srl_num,v_card_number,v_Account_Number,v_entity_cre_flg,v_primary_acct_flg,v_linked_flg,v_last_linked_date,v_last_delinked_date,v_lchg_user_id,v_lchg_time,v_rcre_user_id,v_rcre_time,v_bank_id;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into CARDLINKAGE_O_TABLE values (v_crd_srl_num,v_card_number,v_Account_Number,v_entity_cre_flg,v_primary_acct_flg,v_linked_flg,v_last_linked_date,v_last_delinked_date,v_lchg_user_id,v_lchg_time,v_rcre_user_id,v_rcre_time,v_bank_id ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;