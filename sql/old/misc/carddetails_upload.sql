-- File Name		: carddetails_upload.sql

-- File Created for	: Upload file for carddetails

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure carddetails_upload(
v_mig_date IN TIMESTAMP
)
   as
   v_crd_srl_num 	 	 CHAR(12);
   v_card_number	 	 CHAR(19);
   v_del_flg 	 		 CHAR(1);
   v_entity_cre_flg	 	 CHAR(1);
   v_issue_sol_id	 	 CHAR(8);
   v_customer_id	 	 CHAR(9);
   v_acid	 		 CHAR(11);
   v_card_type 	 		 CHAR(5);
   v_card_sub_type 	 	 CHAR(5);
   v_emboss_name	 	 CHAR(80);
   v_issue_date	 		 CHAR(99);
   v_valid_from_date	 	 CHAR(99);
   v_valid_to_date	 	 CHAR(99);
   v_first_usage_date	 	 CHAR(99);
   v_card_status	 	 CHAR(1);
   v_card_mandate	 	 CHAR(5);
   v_daily_card_limit	 	 CHAR(20);
   v_daily_card_limit_used	 CHAR(20);
   v_daily_card_limit_currency	 CHAR(3);
   v_offline_card_limit	 	 CHAR(20);
   v_offline_card_limit_used	 CHAR(20);
   v_offline_card_limit_currency CHAR(3);
   v_pos_purchase_limit	 	 CHAR(20);
   v_pos_purchase_limit_used	 CHAR(20);
   v_pos_purchase_limit_currency CHAR(3);
   v_pin_mailer_flag	 	 CHAR(1);
   v_Free_Code_1	 	 CHAR(16);
   v_Free_Code_2	 	 CHAR(16);
   v_Free_Code_3	 	 CHAR(16);
   v_Free_Code_4	 	 CHAR(16);
   v_Free_Text	 		 CHAR(80);
   v_custom_address_flag	 CHAR(1);
   v_address_1	 		 CHAR(45);
   v_address_2	 		 CHAR(45);
   v_city_code	 		 CHAR(5);
   v_state_code	 		 CHAR(5);
   v_pin_code	 		 CHAR(6);
   v_country_code	 	 CHAR(5);
   v_phone_num	 		 CHAR(15);
   v_telex_num	 		 CHAR(15);
   v_fax_num	 		 CHAR(15);
   v_email_id	 		 CHAR(50);
   v_mothers_maiden_name	 CHAR(40);
   v_date_of_birth	 	 CHAR(99);
   v_first_upload_date_time	 CHAR(99);
   v_no_of_times_renewed	 CHAR(3);
   v_last_oprn_done	 	 CHAR(1);
   v_lchg_user_id	 	 CHAR(15);
   v_lchg_time	 		 CHAR(99);
   v_rcre_user_id	 	 CHAR(15);
   v_rcre_time	 		 CHAR(99);
   v_bank_id	 		 CHAR(8);
   
   
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

EXECUTE IMMEDIATE 'truncate table CARDDETAILS_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_crd_srl_num,v_card_number,v_del_flg,v_entity_cre_flg,v_issue_sol_id,v_customer_id,v_acid,v_card_type,v_card_sub_type,v_emboss_name,v_issue_date,v_valid_from_date,v_valid_to_date,v_first_usage_date,v_card_status,v_card_mandate,v_daily_card_limit,v_daily_card_limit_used,v_daily_card_limit_currency,v_offline_card_limit,v_offline_card_limit_used,v_offline_card_limit_currency,v_pos_purchase_limit,v_pos_purchase_limit_used,v_pos_purchase_limit_currency,v_pin_mailer_flag,v_Free_Code_1,v_Free_Code_2,v_Free_Code_3,v_Free_Code_4,v_Free_Text,v_custom_address_flag,v_address_1,v_address_2,v_city_code,v_state_code,v_pin_code,v_country_code,v_phone_num,v_telex_num,v_fax_num,v_email_id,v_mothers_maiden_name,v_date_of_birth,v_first_upload_date_time,v_no_of_times_renewed,v_last_oprn_done,v_lchg_user_id,v_lchg_time,v_rcre_user_id,v_rcre_time,v_bank_id;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into CARDDETAILS_O_TABLE values (v_crd_srl_num,v_card_number,v_del_flg,v_entity_cre_flg,v_issue_sol_id,v_customer_id,v_acid,v_card_type,v_card_sub_type,v_emboss_name,v_issue_date,v_valid_from_date,v_valid_to_date,v_first_usage_date,v_card_status,v_card_mandate,v_daily_card_limit,v_daily_card_limit_used,v_daily_card_limit_currency,v_offline_card_limit,v_offline_card_limit_used,v_offline_card_limit_currency,v_pos_purchase_limit,v_pos_purchase_limit_used,v_pos_purchase_limit_currency,v_pin_mailer_flag,v_Free_Code_1,v_Free_Code_2,v_Free_Code_3,v_Free_Code_4,v_Free_Text,v_custom_address_flag,v_address_1,v_address_2,v_city_code,v_state_code,v_pin_code,v_country_code,v_phone_num,v_telex_num,v_fax_num,v_email_id,v_mothers_maiden_name,v_date_of_birth,v_first_upload_date_time,v_no_of_times_renewed,v_last_oprn_done,v_lchg_user_id,v_lchg_time,v_rcre_user_id,v_rcre_time,v_bank_id ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;