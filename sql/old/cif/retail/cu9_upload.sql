-- File Name		: cu8_upload.sql

-- File Created for	: Upload file for cu7

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure cu9_load
as 

 BEGIN
    begin
      EXECUTE IMMEDIATE 'truncate table CU9_O_TABLE';
    end;

INSERT INTO CU9_O_TABLE (
SELECT 
--     V_ORGKEY		CHAR(50);
MAP_CIF.FIN_CIF_ID,



--     V_COMMUNICATION_LANGUAGE	CHAR(50);
'',



--     V_PREFERRED_ADDRESS_MODE	CHAR(50);
'',



--     V_BEHAVIOURAL_SCORE  CHAR(100);
'',



--     V_RISK_BEHAVIOUR	CHAR(100);
'',



--     V_OTHER_BEHAVIOURAL_PROFILE	CHAR(100);
'',



--     V_LIFE_CYCLE_STAGE 	CHAR(100);
'',



--     V_SERVICE_PERSONALISE	CHAR(200);
'',



--     V_PSYCHOGRAPHICTYPE	CHAR(50);
'',



--     V_PRIORITY_IDENTIFIER	CHAR(25);
'', 



--     V_HOUSEHOLD_NUMBER	CHAR(10);
'',



--     V_PREFERRED_REP		CHAR(38);
'',



--     V_SEGMENTATION_CLASS	CHAR(100);
'',



--     V_PREFERREDNAME		CHAR(50);
gfpf.gfcun,



--     V_NUMBEROFDEPENDANTS	CHAR(38);
'',



--     V_NUMBEROFDEPENDANTCHILDREN	CHAR(38);
'',



--     V_STMTDATEFORCOMBSTMT	CHAR(10);
'',



--     V_SUBSEGMENT	CHAR(50);
'',



--     V_HOBBYFIELD1	CHAR(50);
'',



--     V_HOBBYFIELD2	CHAR(50);
'',



--     V_HOBBYFIELD3	CHAR(50);
'',



--     V_HOBBYFIELD4	CHAR(50);
'',


--     V_HOBBYFIELD5	CHAR(50);
'',



--     V_HOBBYFIELD6	CHAR(50);
'',



--     V_PROFILE_FIELD1	CHAR(200);
'',



--     V_PROFILE_FIELD2	CHAR(200);
'',



--     V_PROFILE_FIELD3	CHAR(200);
'',



--     V_PROFILE_FIELD4	CHAR(200);
'',



--     V_ALERT1	CHAR(100);
'',



--     V_ALERT2	CHAR(100);
'',



--     V_ALERT3	CHAR(100);
'',



--     V_ALERT4	CHAR(100);
'',



--     V_ALERT5	CHAR(100);
'',



--     V_FLAG1	CHAR(5);
'',



--     V_FLAG2	CHAR(5);
'',



--     V_FLAG3	CHAR(5);
'',



--     V_FLAG4	CHAR(5);
'',



--     V_FLAG5	CHAR(5);
'',



--     V_BANK_DEFINED_PREFER_VAR1	CHAR(20);
'',



--     V_BANK_DEFINED_PREFER_VAR2	CHAR(20);
'',



--     V_BANK_DEFINED_PREFER_VAR3	CHAR(20);
'',



--     V_BANK_DEFINED_PREFER_DATE1	CHAR(10);
'',



--     V_BANK_DEFINED_PREFER_DATE2	CHAR(10);
'',



--     V_BANK_DEFINED_PREFER_DATE3	CHAR(10);
'',



--     V_USERFIELD1	CHAR(50);
'',



--     V_USERFIELD2	CHAR(50);
'',



--     V_USERFIELD3	CHAR(50);
'',



--     V_USERFIELD4	CHAR(50);
'',



--     V_USERFIELD5	CHAR(50);
'',



--     V_USERFIELD6	CHAR(50);
'',



--     V_SPSERVICEREQUIRED1	CHAR(25);
'',



--     V_SPSERVICEREQUIRED2	CHAR(25);
'',



--     V_SPSERVICEREQUIRED3	CHAR(25);
'',



--     V_SPSERVICEREQUIRED4	CHAR(25);
'',



--     V_SPSERVICEREQUIRED5	CHAR(25);
'',



--     V_USERFLAG1	CHAR(1);
'',



--     V_USERFLAG2	CHAR(1);
'',



--     V_PREFRELSHIPDISCOUNT1	CHAR(20);
'',



--     V_PREFRELSHIPDISCOUNT2	CHAR(20);
'',



--     V_PREFRELSHIPDISCOUNTPERCENT1	CHAR(9);
'',



--     V_PREFRELSHIPDISCOUNTPERCENT2	CHAR(9);
'',



--     V_USERFIELD7	CHAR(50);
'',



--     V_USERFIELD8	CHAR(50);
'',



--     V_USERFIELD9	CHAR(50);
'',



--     V_USERFIELD10	CHAR(50);
'',



--     V_USERFIELD11	CHAR(50);
'',



--     V_USERFIELD12	CHAR(50);
'',



--     V_USERFIELD13	CHAR(50);
'',



--     V_AMOUNT1	CHAR(20);
'',



--     V_AMOUNT2	CHAR(20);
'',



--     V_AMOUNT3	CHAR(20);
'',



--     V_AMOUNT4	CHAR(20);
'',



--     V_AMOUNT5	CHAR(20);
'',



--     V_AMOUNT6	CHAR(20);
'',



--     V_AMOUNT7	CHAR(20);
'',



--     V_INTFIELD1	CHAR(38);
'',



--     V_INTFIELD2	CHAR(38);
'',



--     V_INTFIELD3	CHAR(38);
'',



--     V_INTFIELD4	CHAR(38);
'',



--     V_INTFIELD5	CHAR(38);
'',



--     V_STATEMENTTYPE	CHAR(5);
'',



--     V_STATEMENTFREQUENCY	CHAR(5);
'',



--     V_STMTDATEWEEKDAY	CHAR(1);
'',



--     V_STMTMONTHLYSTARTDATE	CHAR(2);
'',



--     V_ACTIONDURINGHOLIDAY	CHAR(10);
'',



--     V_DESPATCHMODE	CHAR(5);
'',



--     V_CALENDERTYPE	CHAR(5);
'',



--     V_DISCOUNTAVAILED	CHAR(1);
'',



--     V_DISCOUNTTYPE	CHAR(5);
'',



--     V_PREFEFFECTIVEDATE	CHAR(11);
'',



--     V_PREFEXPIRYDATE	CHAR(11);
'',



--     V_LASTCONTACTEDDATE	CHAR(11);
'',



--     V_LASTCONTACTEDCHANNEL	CHAR(20);
'',



--     V_FAMILYTYPE	CHAR(50);
'',



--     V_NOOFEARNERS	CHAR(2);
'',



--     V_REMARKS	CHAR(50);
'',



--     V_COMMUNITY	CHAR(50);
'',



--     V_LTVINDICATOR	CHAR(5);
'',



--     V_ASSETCLASSIFICATION	CHAR(5);
'',



--     V_ASSETCLASSIFICATIONDESC	CHAR(50);
'',



--     V_ASSETCLASSIFIEDON	CHAR(11);
'',



--     V_CUSTHEALTHCODE	CHAR(5);
'',



--     V_CREDITDISCOUNTPERCENT	CHAR(9);
'',



--     V_DEBITDISCOUNTPERCENT	CHAR(9);
'',



--     V_PREFERRENTIALEXPIRYDATE	CHAR(11);
'',



--     V_INTERESTDESCRIPTION	CHAR(20);
'',



--     V_STMTWEEKOFMONTH	CHAR(1);
'',



--     V_CUSTCHARGECODE	CHAR(5);
'',



--     V_CUSTCHARGE	CHAR(50);
'',



--     V_CHARGEDEBITFORACID	CHAR(16);
'',



--     V_CHARGEDEBITSOLID	CHAR(8);
'',



--     V_CHARGEHISTORYFLAG	CHAR(1);
'',



--     V_CUSTOMERCURRENCY	CHAR(3);
'',



--     V_LOANSSTATEMENTTYPE	CHAR(1);
'',



--     V_TDSSTATEMENTTYPE	CHAR(1);
'',



--     V_COMBSTMTCHARGECODE	CHAR(5);
'',



--     V_TDSCUSTFLOORLIMIT	CHAR(20);
'',



--     V_COMMUNITY_CODE	CHAR(5);
'',



--     V_CUST_HEALTH_REF_CODE	CHAR(5);
'',



--     V_CUST_PREF_TILL_DATE	CHAR(11);
'',



--     V_CU_TDSCUSTFLOORLIMIT	CHAR(3);
'',



--     V_CHECKSUM	CHAR(100);
'',



--     V_PREFERRED_LOCALE	CHAR(50);
'en_US',



--     V_BANK_ID	CHAR(8);
'01',



--     V_NATURE_OF_ACT	CHAR(50);
''

FROM MAP_CIF inner join gfpf on map_cif.leg_cust_number = gfpf.gfcus
    left join map_cif_type on leg_cust_type_code = gfpf.gfctp
    where map_cif_type.leg_cust_type ='Individual'
    and map_cif.fin_sol_id='0006');

commit;
END;