-- File Name		: collateral.sql

-- File Created for	: Upload file for Lien

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure collateral
   as

   
BEGIN

Begin

EXECUTE IMMEDIATE 'truncate table COLLATERAL_O_TABLE';
  
end;

insert into COLLATERAL_O_TABLE
( select 
-- COLL_SRL_NUM			 CHAR(32) NULL,
	case
	when HYDLR is not null then HYCLP||HYDBNM||HYDLP||HYDLR
	when HYAN is not null then HYCLP||HYAB||HYAN||HYAS
	else HYCLP||HYCLR end,
--   SECU_TYPE_IND		 CHAR(1) NULL,
	substr(collateral_type,1,1),
--   SECU_CODE 			 CHAR(8) NULL,
	'',
--   SECU_GROUP_CODE		 CHAR(5) NULL,
	'',
--   SECU_CLASS_CODE		 CHAR(5) NULL,
	'',
--   USE_FOR_INT_FLG		 CHAR(1) NULL,
	'',
--   USE_FOR_DP_IND		 CHAR(1) NULL,
	'P',
--  LIEN_ACID  			 CHAR(11) NULL,
	map_acc.fin_acc_num,
-- UNIT_VALUE  			 CHAR(20) NULL,
	hypf.hyunp,
-- NUM_OF_UNITS			 CHAR(9) NULL,
	hypf.hynou,
--   SECU_VALUE			 CHAR(20) NULL,
	hypf.hyclv,
--   RETAIN_MARGIN_PCNT		 CHAR(9) NULL,
	'25',
--   MAX_CEILING_LIM		 CHAR(20) NULL,
	'',
--   ITEM_FREQ_TYPE		 CHAR(1) NULL,
	mapfrequency(hypf.hyfrq),
--   ITEM_FREQ_WEEK_NUM		 CHAR(1) NULL,
	'',
--   ITEM_FREQ_WEEK_DAY		 CHAR(1) NULL,
	'',
--   ITEM_FREQ_START_DD		 CHAR(2) NULL,
	substr(mapfrequency(hypf.hyfrq),2,2),
--  ITEM_FREQ_HLDY_STAT		 CHAR(1) NULL,
	'P',
--   ITEM_DUE_DATE		 CHAR(10) NULL,
	case
	when hycxd='9999999' then '31-DEC-2099'
	else to_char(to_date(to_char(pack_mig_eq3.get_date_fm_btrv(HYPF.HYCXD)),'DD-MM-YYYY'),'DD-MON-YYYY') end,
--   ITEM_RENEW_DATE		 CHAR(10) NULL,
	case
	when pack_mig_eq3.get_date_fm_btrv(HYPF.HYNRD)<>'ERROR'
	then to_char(to_date(to_char(pack_mig_eq3.get_date_fm_btrv(HYPF.HYNRD)),'DD-MM-YYYY'),'DD-MON-YYYY') end,
--   CHRG_CODE			 CHAR(5) NULL,
	'',
--   FREE_TEXT			 CHAR(240) NULL,
	'',
--   CRNCY_CODE			 CHAR(3) NULL,
	hypf.hyccy,
--   LIEN_ACID_SRL_NUM		 CHAR(3) NULL,
	'',
--   DR_ACID_FOR_FEES		 CHAR(11) NULL,
	'',
--   DERIVE_VALUE_FROM_IND	 CHAR(1) NULL,
	'M',
-- THIRD_PARTY_LIEN_AMT		 CHAR(20) NULL,
	'',
--   ASSESSED_VALUE		 CHAR(20) NULL,
	'',
--   INVOICE_VALUE		 CHAR(20) NULL,
	'',
-- MARKET_VALUE			 CHAR(20) NULL,
	'',
--   WRITTEN_DOWN_VALUE		 CHAR(20) NULL,
	'',
--   APPORTIONED_VALUE		 CHAR(20) NULL,
	to_number(abs(hypf.hyclv)/power(10,c8pf.c8ced)),
--   PURCHASE_DATE		 CHAR(10) NULL,
	'',
--   YEAR_OF_CREATION		 CHAR(7) NULL,
	'',
--   RECEIVED_DATE		 CHAR(10) NULL,
	'',
-- WITHDRAW_FLG			 CHAR(1) NULL,
	'',
--   NET_VAL_REMARKS1		 CHAR(20) NULL,
	'',
--   NET_VAL_REMARKS2		 CHAR(20) NULL,
	'',
--   NET_VAL_REMARKS3		 CHAR(20) NULL,
	'',
--   NET_VAL_REMARKS4		 CHAR(20) NULL,
	'',
-- NET_VAL_AMT1			 CHAR(20) NULL,
	'',
-- NET_VAL_AMT2			 CHAR(20) NULL,
	'',
-- NET_VAL_AMT3			 CHAR(20) NULL,
	'',
-- NET_VAL_AMT4			 CHAR(20) NULL,
	'',
-- NET_VAL_DD_SUB_FLG1		 CHAR(1) NULL,
	'',
-- NET_VAL_ADD_SUB_FLG2		 CHAR(1) NULL,
	'',
-- NET_VAL_ADD_SUB_FLG3		 CHAR(1) NULL,
	'',
-- NET_VAL_ADD_SUB_FLG4		 CHAR(1) NULL,
	'',
--   FULL_BENEFIT_FLG		 CHAR(1) NULL,
	'',
--   LODGE_DATE			 CHAR(10) NULL,
	to_char(to_date(to_char(pack_mig_eq3.get_date_fm_btrv(sys_config.key_value)),'DD-MM-YYYY'),'DD-MON-YYYY'),
--   WITHDRAW_DATE		 CHAR(10) NULL,
	case
	when hycxd='9999999' then '31-DEC-2099'
	else to_char(to_date(to_char(pack_mig_eq3.get_date_fm_btrv(hypf.hycxd)),'DD-MM-YYYY'),'DD-MON-YYYY') end,
-- GROSS_VALUE			 CHAR(20) NULL,
	to_number(abs(hypf.hyclv)/power(10,c8pf.c8ced)),
--   CUST_ID			 CHAR(9) NULL,
	map_cif.fin_cif_id,
-- LAST_VALUATION_DATE		 CHAR(10) NULL,
	'',
--   WITHDRAWAL_REASON_CODE	 CHAR(5) NULL,
	'',
--   BANK_ID			 CHAR(8) NULL,
	'01',
--  SECU_STATUS			 CHAR(1) NULL,
	'',
--   ERR_MESG			 CHAR(240) NULL
	''
	from sys_config,map_collateral,hypf
	inner join c8pf on c8ccy = hyccy
	inner join map_acc on leg_acc_num = hypf.hydbnm||hydlp||hydlr
	inner join map_cif on leg_cust_number = hycus
	where key_string='EQ3_BUSINESS_DATE'
	and substr(map_collateral.collateral_code,4,3) = hyclp);
    
      COMMIT;
END;