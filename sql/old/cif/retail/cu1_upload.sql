-- File Name		: cu1_upload.sql

-- File Created for	: Upload file for CU1

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------
create or replace
procedure cu1_load
as 

BEGIN
    begin
      EXECUTE IMMEDIATE 'truncate table CU1_O_TABLE';
    end;

 INSERT INTO CU1_O_TABLE
   (
--   v_ORGKEY		 		CHAR(32);
 select map_cif.fin_cif_id,               -- Done

--   v_CIF_ID 			 	CHAR(32);
            map_cif.fin_cif_id,           -- Done

--   v_ENTITYTYPE  			CHAR(50);
            'CUSTOMER',                   -- DEFAULT SET TO 'CUSTOMER'

--   v_CUST_TYPE_CODE		 	CHAR(5);        -- Mapping Table Required
            '',

--   v_SALUTATION_CODE		 	CHAR(5);      -- Mapping Table Required
            'MRS.',

--   v_CUST_FIRST_NAME		 	CHAR(80);     -- Done
            gfpf.gfcun,

-- v_CUST_MIDDLE_NAME  			CHAR(80);     
            '',                           -- Dedope will have this data

--   v_CUST_LAST_NAME  			CHAR(80);
           gfpf.gfcun,                           -- Dedope will have this data

--   v_PREFERREDNAME	 		CHAR(50);
            gfpf.gfcun,                   -- Done

-- v_SHORT_NAME			 	CHAR(10);
            substr(gfpf.gfdas,1,10),      -- Done

--   v_CUST_DOB			 	CHAR(17); -- if the dob is greater than the current date, set it to 01-01-1960, otherwise set the same date	     
      

      case when pack_mig_eq3.get_date_fm_btrv(BGPF.BG0007) <> 'ERROR' then 
               case when sysdate <  to_date(pack_mig_eq3.get_date_fm_btrv(BGPF.BG0007),'DD-MM-YYYY') then '01-JAN-1960'
                    else to_char(to_date(pack_mig_eq3.get_date_fm_btrv(BGPF.BG0007),'DD-MM-YYYY'),'DD-MON-YYYY')
                 end
       
      else '01-JAN-1960'
     end,                   -- Completed

--   v_GENDER  			 	CHAR(10);
           
      case
	     when BGPF.BG0006 is null then 'U'
	     else bgpf.bg0006 
        end,                              -- Done -- if we insert as unspecified, it will be 11 characters, so simply U as unspecified

-- v_OCCUPATION_CODE  			CHAR(5);
            '',                                         -- mapping table required


--   v_NATIONALITY  			CHAR(50);
            gfpf.gfcnap,                                -- nationality

--   v_NATIVELANG_TITLE			CHAR(5);
            '',                                         -- Default Blank    

--   v_NATIVELANG_NAME			CHAR(80);
            '',                                         -- Default Blank 

-- v_DOCUMENT_RECIEVED			CHAR(1);
    case
		   when BGPF.BG0001 is not null then 'Y'
		else 'N'
	  end,                                        -- check it -- Checked -- ok 

-- v_STAFF_FLAG			 	CHAR(25);
            'N',                                        -- Check it  -- checked  -- ok  until mock 4

--   v_STAFFEMPLOYEEID		 	CHAR(50);
            '',                           -- MAPPING TABLE REQUIRED


--   v_MANAGER			 	CHAR(100);
            'FIVUSR',                          -- MAPPING TABLE REQUIRED


--   v_CUSTOMERNRE_FLAG			CHAR(1);
        case
	     when  gfpf.gfctp  in ('ED','EB','EN') then 'Y'
	     else 'N'
        end,                                            -- Check it

-- v_DATEOFBECOMINGNRE			CHAR(17);   -- 
 case when  gfpf.gfctp  in ('ED','EB','EN') then
 
                 case when pack_mig_eq3.get_date_fm_btrv(GFPF.GFCOD) <> 'ERROR'  then
                            to_char(to_date(to_char(pack_mig_eq3.get_date_fm_btrv(GFPF.GFCOD)),'DD-MM-YYYY'),'DD-MON-YYYY')   -- Req Format : DD-Mon-YYYY, But now its DD-MM-YYYY
                      else ''
                 end
              ELSE '' 
            END,
    
--   v_CUSTOMER_MINOR			CHAR(1);
        case
	     when  gfpf.gfctp in ('EM','EY') then 'Y'
	     else 'N'
        end,                                              -- CHECK IT  -- Checked -- ok 

--   v_CUSTOMER_GUARDIAN_ID		CHAR(50);
            '',                                     -- DEFAULT BLANK


--   v_MINOR_GUARD_CODE			CHAR(1);
            '',                                     -- DEFAULT BLANK


--   v_MINOR_GUARD_NAME			CHAR(40);
            '',                                     -- DEFAULT BLANK


--   v_REGION			 	CHAR(50);
            '',                                      -- Zafin -- MAPPING TABLE REQUIRED


--   v_PRIMARY_SERVICE_CENTRE		CHAR(5);
            map_cif.fin_sol_id,                      -- DEFAULT SET TO THE BRANCH OF THE CUSTOMER

--   v_RELATIONSHIPOPENINGDATE		CHAR(17);

     case  when pack_mig_eq3.get_date_fm_btrv(GFPF.GFCOD) <> 'ERROR' then
          to_char(to_date(pack_mig_EQ3.get_date_fm_btrv(GFPF.gfcod),'DD-MM-YYYY'),'DD-MON-YYYY')
       else ''
       end,    

--   v_STATUS_CODE			CHAR(5);
            '',                                     -- Mapping table required


--  v_CUSTSTATUSCHGDATE			CHAR(17);
            '',                                     -- DEFAULT BLANK


--   v_HOUSEHOLD_ID			CHAR(50);
            '',                                     -- DEFAULT BLANK


--   v_HOUSEHOLD_NAME			CHAR(50);
            '',                                     -- DEFAULT BLANK


--  v_CRNCY_CODE_RETAIL			CHAR(3);
            'INR',                                   -- DEFAULT 'INR'


--   v_RATING_CODE			CHAR(5);
            '',                                      -- DEFAULT BLANK


--   v_RATING_DATE			CHAR(17);
            '',                                      -- DEFAULT BLANK


--   v_CUST_PREF_TILL_DATE		CHAR(17);
            '',                                      -- DEFAULT BLANK

--   v_TDS_TBL_CODE			CHAR(5);
            '',                                   -- DEFAULT ZERO


--   v_INTRODUCER_ID			CHAR(50);
            '',                                      -- DEFAULT BLANK


--   v_INTRODUCER_SALUTATION		CHAR(5);
            '',                                      -- DEFAULT BLANK


--   v_INTRODUCER_NAME			CHAR(40);
            BGPF.BG0003,                             -- CHECK IT  -- Checked -- OK


--   v_INTRODUCER_STATUS_CODE		CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_OFFLINE_CUM_DEBIT_LIMIT		CHAR(25);
            '',                                      -- DEFAULT BLANK


--   v_CUST_TOT_TOD_ALWD_TIMES		CHAR(5);
            '',                                      -- DEFAULT BLANK


--   v_CUST_COMMU_CODE			CHAR(5);
            '',                                      --MAPPING TABLE REQUIRED


--   v_CARD_HOLDER			CHAR(1);
            '',                                      -- DEFAULT BLANK


--  v_CUST_HLTH			 	CHAR(200);
            '',                                      -- DEFAULT BLANK


--   v_CUST_HLTH_CODE			CHAR(5);
            '',                                      -- DEFAULT BLANK


--   v_TFPARTYFLAG			CHAR(1);
            'N',                                      -- DEFAULT SET TO 'N'


--   v_PRIMARY_SOL_ID			CHAR(8);
            map_cif.fin_sol_id,                       -- Done


--   v_CONSTITUTION_REF_CODE		CHAR(5);
            '',                                      -- DEFAULT BLANK


--  v_CUSTOTHERBANKCODE			CHAR(6);
            '',                                      -- DEFAULT BLANK


--   v_CUST_FIRST_ACCT_DATE		CHAR(17);
            '',                                      -- DEFAULT BLANK


--  v_CHARGE_LEVEL_CODE			CHAR(5);
            '',                                      -- DEFAULT BLANK


--   v_CHRG_DR_FORACID			CHAR(16);
            '',                                      -- DEFAULT BLANK


--   v_CHRG_DR_SOL_ID			CHAR(8);
            '',                                      -- DEFAULT BLANK


--   v_CUST_CHRG_HISTORY_FLG		CHAR(1);
            'N',                                      -- DEFAULT 'N'


-- v_COMBINED_STMT_REQD			CHAR(1);
            'N',                                      -- DEFAULT SET TO 'N'


--   v_LOANS_STMT_TYPE			CHAR(1);
            '',                                      -- DEFAULT BLANK


--   v_TD_STMT_TYPE			CHAR(1);
            '',                                      -- DEFAULT BLANK


--   v_COMB_STMT_CHRG_CODE		CHAR(5);
            '',                                      -- DEFAULT BLANK


--   v_DESPATCH_MODE			CHAR(1);
            '',                                      -- DEFAULT BLANK


--   v_CS_LAST_PRINTED_DATE		CHAR(17);
            '',                                      -- DEFAULT BLANK


--   v_CS_NEXT_DUE_DATE			CHAR(17);
            '',                                      -- DEFAULT BLANK


--   v_ALLOW_SWEEPS			CHAR(1);
            'Y',                                      -- DEFAULT SET TO 'Y'


--   v_PS_FREQ_TYPE			CHAR(1);
            '',                                      -- DEFAULT BLANK


--   v_PS_FREQ_WEEK_NUM			CHAR(1);
            '',                                      -- DEFAULT BLANK


--   v_PS_FREQ_WEEK_DAY			CHAR(1);
            '',                                      -- DEFAULT BLANK


--   v_PS_FREQ_START_DD			CHAR(2);
            '',                                      -- DEFAULT BLANK


--  v_PS_FREQ_HLDY_STAT			CHAR(1);
            '',                                      -- DEFAULT BLANK


--   v_ENTITY_TYPE			CHAR(30);
            'CUSTOMER',                              -- DEFAULT SET TO 'CUSTOMER'


--   v_LINKEDRETAILCIF			CHAR(32);
            '',                                      -- DEFAULT BLANK


--   v_HSHLDU_FLAG			CHAR(1);
            'N',                                      -- DEFAULT SET TO 'N'


-- v_SMALL_STR1			 	CHAR(50);
            '',                                      -- DEFAULT BLANK


-- v_SMALL_STR2			 	CHAR(50);
            '',                                      -- DEFAULT BLANK


-- v_SMALL_STR3			 	CHAR(50);
            '',                                      -- DEFAULT BLANK


-- v_SMALL_STR4			 	CHAR(50);
            '',                                      -- DEFAULT BLANK


-- v_SMALL_STR5			 	CHAR(50);
            '',                                      -- DEFAULT BLANK


-- v_SMALL_STR6			 	CHAR(50);
            '',                                      -- DEFAULT BLANK


-- v_SMALL_STR7			 	CHAR(50);
            '',                                      -- DEFAULT BLANK


-- v_SMALL_STR8			 	CHAR(50);
            '',                                      -- DEFAULT BLANK


-- v_SMALL_STR9			 	CHAR(50);
            '',                                      -- DEFAULT BLANK


--   v_SMALL_STR10			CHAR(50);
            '',                                      -- DEFAULT BLANK


--   v_MED_STR1			 	CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_MED_STR2			 	CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_MED_STR3			 	CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_MED_STR4			 	CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_MED_STR5		 		CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_MED_STR6			 	CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_MED_STR7			 	CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_MED_STR8			 	CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_MED_STR9			 	CHAR(100);
            '',                                      -- DEFAULT BLANK


-- v_MED_STR10			 	CHAR(100);
            '',                                      -- DEFAULT BLANK


-- v_LARGE_STR1			 	CHAR(250);
            '',                                      -- DEFAULT BLANK


-- v_LARGE_STR2			 	CHAR(250);
            '',                                      -- DEFAULT BLANK


-- v_LARGE_STR3			 	CHAR(250);
            '',                                      -- DEFAULT BLANK


-- v_LARGE_STR4			 	CHAR(250);
            '',                                      -- DEFAULT BLANK


-- v_LARGE_STR5			 	CHAR(250);
            '',                                      -- DEFAULT BLANK


--   v_DATE1			 	CHAR(17);
            '',                                      -- DEFAULT BLANK


--   v_DATE2			 	CHAR(17);
            '',                                      -- DEFAULT BLANK


--   v_DATE3			 	CHAR(17);
            '',                                      -- DEFAULT BLANK


--   v_DATE4			 	CHAR(17);
            '',                                      -- DEFAULT BLANK


--   v_DATE5			 	CHAR(17);
            '',                                      -- DEFAULT BLANK


--   v_DATE6			 	CHAR(17);
            '',                                      -- DEFAULT BLANK


--   v_DATE7			 	CHAR(17);
            '',                                      -- DEFAULT BLANK


--   v_DATE8			 	CHAR(17);
            '',                                      -- DEFAULT BLANK


--   v_DATE9			 	CHAR(17);
            '',                                      -- DEFAULT BLANK


--   v_DATE10			 	CHAR(17);
            '',                                      -- DEFAULT BLANK


--   v_NUMBER1				CHAR(38);
            '',                                      -- DEFAULT BLANK


--   v_NUMBER2			 	CHAR(38);
            '',                                      -- DEFAULT BLANK


--   v_NUMBER3			 	CHAR(38);
            '',                                      -- DEFAULT BLANK


--   v_NUMBER4			 	CHAR(38);
            '',                                      -- DEFAULT BLANK


--   v_NUMBER5			 	CHAR(38);
            '',                                      -- DEFAULT BLANK


--   v_NUMBER6			 	CHAR(38);
            '',                                      -- DEFAULT BLANK


--   v_NUMBER7			 	CHAR(38);
            '',                                      -- DEFAULT BLANK


--   v_NUMBER8			 	CHAR(38);
            '',                                      -- DEFAULT BLANK


--   v_NUMBER9			 	CHAR(38);
            '',                                      -- DEFAULT BLANK


--   v_NUMBER10			 	CHAR(38);
            '',                                      -- DEFAULT BLANK


--   v_DECIMAL1			 	CHAR(25);
            '',                                      -- DEFAULT BLANK


--   v_DECIMAL2			 	CHAR(25);
            '',                                      -- DEFAULT BLANK


--   v_DECIMAL3			 	CHAR(25);
            '',                                      -- DEFAULT BLANK


--   v_DECIMAL4			 	CHAR(25);
            '',                                      -- DEFAULT BLANK


--   v_DECIMAL5			 	CHAR(25);
            '',                                      -- DEFAULT BLANK


--   v_DECIMAL6			 	CHAR(25);
            '',                                      -- DEFAULT BLANK


--   v_DECIMAL7			 	CHAR(25);
            '',                                      -- DEFAULT BLANK


--   v_DECIMAL8			 	CHAR(25);
            '',                                      -- DEFAULT BLANK


--   v_DECIMAL9			 	CHAR(25);
            '',                                      -- DEFAULT BLANK


-- v_DECIMAL10			 	CHAR(25);
            '',                                      -- DEFAULT BLANK


--   v_CORE_CUST_ID			CHAR(9);
            map_cif.fin_cif_id,                     --  DEFAULT TO CIF_ID


--   v_PERSON_TYPE			CHAR(50);
            '',                                      -- DEFAULT BLANK


--   v_CUST_LANGUAGE			CHAR(50);
            'UK (English)',                               -- DEFAULT SET TO 'ENGLISH'

-- v_CUST_STAFF_STATUS			CHAR(50);
            '',                                      -- DEFAULT BLANK


--   v_PHONE			 	CHAR(25);
            '',                                      -- DEFAULT BLANK


-- v_EXTENSION			 	CHAR(10);
            '',                                      -- DEFAULT BLANK


--   v_FAX			 	CHAR(25);
            '',                                      -- DEFAULT BLANK


--   v_FAX_HOME			 	CHAR(50);
            '',                                      -- DEFAULT BLANK


-- v_PHONE_HOME			 	CHAR(25);
            '',                                      -- DEFAULT BLANK


--   v_PHONE_HOME2			CHAR(50);
            '',                                      -- DEFAULT BLANK


-- v_PHONE_CELL			 	CHAR(25);
            '',                                      -- DEFAULT BLANK


-- v_EMAIL_HOME			 	CHAR(50);
            '',                                      -- DEFAULT BLANK


-- v_EMAIL_PALM			 	CHAR(50);
            '',                                      -- DEFAULT BLANK


--   v_EMAIL			 	CHAR(50);
            '',                                      -- DEFAULT BLANK


--   v_CITY			 	CHAR(50);
            '',                                      -- DEFAULT BLANK


--   v_PREFERRED_CHANNEL_ID		CHAR(38);
            '',                                      -- DEFAULT BLANK


--   v_CUSTOMER_RELATIONSHIP_no		CHAR(50);
            '',                                      -- DEFAULT BLANK


-- v_RELATIONSHIP_VALUE			CHAR(38);
            '',                                      -- DEFAULT BLANK


--   v_CATEGORY			 	CHAR(50);
            '',                                      -- DEFAULT BLANK


--   v_NUMBEROFPRODUCTS			CHAR(38);
            '',                                      -- DEFAULT BLANK


--   v_RELATIONSHIP_MANAGER_ID		CHAR(38);
            '',                                      -- MAPPING TABLE REQUIRED


-- v_RELATIONSHIP_CREATED_BY_ID		CHAR(38);
            '',                                  -- DEFAULT  SET TO BLANK


--   v_URL			 	CHAR(50);
            '',                                      -- DEFAULT BLANK


--   v_STATUS			 	CHAR(50);
            '',                                      -- MAPPING TABLE REQUIRED


--   v_INDUSTRY			 	CHAR(50);
            '',                                      -- MAPPING TABLE REQUIRED


-- v_PARENTORG			 	CHAR(50);
            '',                                      -- DEFAULT BLANK


-- v_COMPETITOR			 	CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_SIC_CODE			 	CHAR(50);
            '',                                      -- DEFAULT BLANK


--   v_CIN			 	CHAR(50);
            '',                                      -- DEFAULT BLANK


--   v_DESIGNATION			CHAR(50);
            '',                                      -- DEFAULT BLANK


-- v_ASSISTANT			 	CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_INTERNAL_SCORE			CHAR(25);
            '',                                      -- DEFAULT BLANK


--   v_CREDIT_BUREAU_SCORE_VALIDITY	CHAR(10);
            '',                                      -- DEFAULT BLANK


--   v_CREDIT_BUREAU_SCORE		CHAR(20);
            '',                                      -- DEFAULT BLANK


-- v_CREDIT_BUREAU_REQUEST_DATE		CHAR(10);
            '',                                      -- DEFAULT BLANK


-- v_CREDIT_BUREAU_DESCRIPTION		CHAR(100);
            '',                                      -- DEFAULT BLANK


-- v_MAIDEN_MOTHER_NAME			CHAR(50);
           BGPF.BGC033,                              -- CHECK IT    -- CHECKED -- OK 


--   v_ANNUAL_REVENUE			CHAR(20);
            '',                                      -- DEFAULT BLANK


--   v_REVENUE_UNITS			CHAR(20);
            '',                                      -- DEFAULT BLANK


--   v_TICKER_SYMBOL			CHAR(50);
            '',                                      -- DEFAULT BLANK


--   v_AUTO_APRPOVAL			CHAR(5);
            'N',                                      -- DEFAULT SET TO 'N'


--   v_FREEZE_PRODUCT_SALE		CHAR(5);
            '',                                      -- DEFAULT BLANK


--   v_RELATIONSHIP_FIELD_1		CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_RELATIONSHIP_FIELD_2		CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_RELATIONSHIP_FIELD_3		CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_DELINQUENCY_FLAG			CHAR(1);
            '',                                      -- DEFAULT BLANK


-- v_CUSTOMER_NRE_FLAG			CHAR(1);

case
	     when  gfpf.gfctp in ('ED','EB','EN') then 'Y'
	     else 'N'
        end,                                         --   CHECK IT   -- cHECKED -- OK 


-- v_COMBINED_STMT_FLAG			CHAR(1);
            '',                                      -- DEFAULT BLANK


--   v_CUSTOMER_TRADE			CHAR(1);
            '',                                      -- DEFAULT BLANK


--   v_PLACE_OF_BIRTH			CHAR(50);
            '',                                      -- DEFAULT BLANK


--   v_COUNTRY_OF_BIRTH			CHAR(50);
            '',                                      -- DEFAULT BLANK


-- v_PROOF_OF_AGE_FLAG			CHAR(1);
            '',                                      -- DEFAULT BLANK


--   v_PROOF_OF_AGE_DOCUMENT		CHAR(50);
            '',                                      -- DEFAULT BLANK


--   v_NAME_SUFFIX			CHAR(25);
            '',                                      -- DEFAULT BLANK


--   v_MAIDEN_NAME			CHAR(50);
            BGPF.BGC033,                              -- CHECK IT   -- CHECKED -- OK 

--   v_CUSTOMER_PROFITABILITY		CHAR(20);
            '',                                      -- DEFAULT BLANK


--   v_CURRENT_CR_EXPOSURE		CHAR(20);
            '',                                      -- DEFAULT BLANK


--   v_TOTAL_CREDIT_EXOPSURE		CHAR(20);
            '',                                      -- DEFAULT BLANK


--   v_POTENTIAL_CREDIT_LINE		CHAR(20);
            '',                                      -- DEFAULT BLANK


--   v_AVAILABLE_CREDI_LIMIT		CHAR(20);
            '',                                      -- DEFAULT BLANK


--   v_CREDIT_SCORE_REQUESTED_FLAG	CHAR(1);
            '',                                      -- DEFAULT BLANK


--   v_CREDIRT_HISTORY_REQUESTED_FL	CHAR(2);
            '',                                      -- DEFAULT BLANK


--   v_GROUP_ID				CHAR(50);
            '',                                      -- DEFAULT BLANK


--   v_FLG1			 	CHAR(10);
            '',                                      -- DEFAULT BLANK


--   v_FLG2			 	CHAR(10);
            '',                                      -- DEFAULT BLANK


--   v_FLG3			 	CHAR(10);
            '',                                      -- DEFAULT BLANK


--   v_ALERT1				CHAR(10);
            '',                                      -- DEFAULT BLANK


--   v_ALERT2				CHAR(10);
            '',                                      -- DEFAULT BLANK


--   v_ALERT3				CHAR(10);
            '',                                      -- DEFAULT BLANK


--   v_RELATIONSHIP_OFFICER_1		CHAR(50);
            '',                                      -- DEFAULT BLANK


--   v_RELATIONSHIP_OFFICER_2		CHAR(50);
            '',                                      -- DEFAULT BLANK


--   v_DTDATE1				CHAR(10);
            '',                                      -- DEFAULT BLANK


--   v_DTDATE2				CHAR(10);
            '',                                      -- DEFAULT BLANK


--   v_DTDATE3				CHAR(10);
            '',                                      -- DEFAULT BLANK


--   v_DTDATE4				CHAR(10);
            '',                                      -- DEFAULT BLANK


--   v_DTDATE5				CHAR(10);
            '',                                      -- DEFAULT BLANK


--   v_DTDATE6				CHAR(10);
            '',                                      -- DEFAULT BLANK


--   v_DTDATE7				CHAR(10);
            '',                                      -- DEFAULT BLANK


--   v_DTDATE8				CHAR(10);
            '',                                      -- DEFAULT BLANK


--   v_DTDATE9				CHAR(10);
            '',                                      -- DEFAULT BLANK


--   v_Amount1				CHAR(20);
            '',                                      -- DEFAULT BLANK


--   v_Amount2				CHAR(20);
            '',                                      -- DEFAULT BLANK


--   v_Amount3				CHAR(20);
            '',                                      -- DEFAULT BLANK


--   v_Amount4				CHAR(20);
            '',                                      -- DEFAULT BLANK


--   v_Amount5				CHAR(20);
            '',                                      -- DEFAULT BLANK


-- v_strfield1				CHAR(100);
            '',                                      -- DEFAULT BLANK


-- v_strfield2				CHAR(100);
            '',                                      -- DEFAULT BLANK


-- v_strfield3				CHAR(100);
            '',                                      -- DEFAULT BLANK


-- v_strfield4				CHAR(100);
            '',                                      -- DEFAULT BLANK


--  v_strfield5				CHAR(100);
            '',                                      -- DEFAULT BLANK


-- v_strfield6				CHAR(50);
            '',                                      -- DEFAULT BLANK


--  v_strfield7				CHAR(50);
            '',                                      -- DEFAULT BLANK


--  v_strfield8				CHAR(50);
            '',                                      -- DEFAULT BLANK


--  v_strfield9				CHAR(50);
            '',                                      -- DEFAULT BLANK


-- v_strfield10				CHAR(50);
            '',                                      -- DEFAULT BLANK


-- v_strfield11				CHAR(50);
            '',                                      -- DEFAULT BLANK


-- v_strfield12				CHAR(50);
            '',                                      -- DEFAULT BLANK


-- v_strfield13				CHAR(50);
            '',                                      -- DEFAULT BLANK


-- v_strfield14				CHAR(50);
            '',                                      -- DEFAULT BLANK


-- v_strfield15				CHAR(50);
            '',                                      -- DEFAULT BLANK


-- v_UserFlag1				CHAR(1);
            '',                                      -- DEFAULT BLANK


-- v_UserFlag2				CHAR(1);
            '',                                      -- DEFAULT BLANK


-- v_UserFlag3				CHAR(1);
            '',                                      -- DEFAULT BLANK


-- v_UserFlag4				CHAR(1);
            '',                                      -- DEFAULT BLANK


--   v_MLUserField1			CHAR(80);
            '',                                      -- DEFAULT BLANK


--   v_MLUserField2			CHAR(80);
            '',                                      -- DEFAULT BLANK


--   v_MLUserField3			CHAR(80);
            '',                                      -- DEFAULT BLANK


--   v_MLUserField4			CHAR(200);
            '',                                      -- DEFAULT BLANK


--   v_MLUserField5			CHAR(200);
            '',                                      -- DEFAULT BLANK


--   v_MLUserField6			CHAR(200);
            '',                                      -- DEFAULT BLANK


--   v_MLUserField7			CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_MLUserField8			CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_MLUserField9			CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_MLUserField10			CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_MLUserField11			CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_Notes				CHAR(1000);
            '',                                      -- DEFAULT BLANK


--   v_Priority_Code			CHAR(50);
            '',                                      -- DEFAULT BLANK


--   v_Created_From			CHAR(1);
            '',                                      -- DEFAULT BLANK


--  v_Constitution_Code			CHAR(200);
            '',                                      -- DEFAULT BLANK


-- v_StrField16				CHAR(50);
            '',                                      -- DEFAULT BLANK


-- v_StrField17				CHAR(50);
            '',                                      -- DEFAULT BLANK


-- v_StrField18				CHAR(50);
            '',                                      -- DEFAULT BLANK


-- v_StrField19				CHAR(50);
            '',                                      -- DEFAULT BLANK


-- v_StrField20				CHAR(50);
            '',                                      -- DEFAULT BLANK


-- v_StrField21				CHAR(100);
            '',                                      -- DEFAULT BLANK


-- v_StrField22				CHAR(50);
            '',                                      -- DEFAULT BLANK


--   v_Amount6				CHAR(20);
            '',                                      -- DEFAULT BLANK


--   v_Amount7				CHAR(20);
            '',                                      -- DEFAULT BLANK


--   v_Amount8				CHAR(20);
            '',                                      -- DEFAULT BLANK


--   v_Amount9				CHAR(20);
            '',                                      -- DEFAULT BLANK


--   v_Amount10				CHAR(20);
            '',                                      -- DEFAULT BLANK


--   v_Amount11				CHAR(20);
            '',                                      -- DEFAULT BLANK


--   v_Amount12				CHAR(20);
            '',                                      -- DEFAULT BLANK


-- v_IntField1				CHAR(38);
            '',                                      -- DEFAULT BLANK


--  v_IntField2				CHAR(38);
            '',                                      -- DEFAULT BLANK


-- v_IntField3				CHAR(38);
            '',                                      -- DEFAULT BLANK


--  v_IntField4				CHAR(38);
            '',                                      -- DEFAULT BLANK


--  v_IntField5				CHAR(38);
            '',                                      -- DEFAULT BLANK


--  v_nick_name				CHAR(10);
            '',                                      -- DEFAULT BLANK


--   v_mother_name			CHAR(20);
            '',                                      -- DEFAULT BLANK


--   v_father_husband_name		CHAR(20);
            '',                                      -- DEFAULT BLANK


--   v_previous_name			CHAR(20);
            '',                                      -- DEFAULT BLANK


--   v_lead_source			CHAR(50);
            '',                                      -- DEFAULT BLANK


-- v_relationship_type			CHAR(5);
            '',                                      -- DEFAULT BLANK


--   v_rm_group_id			CHAR(5);
            '',                                      -- DEFAULT BLANK


-- v_relationship_level			CHAR(5);
            '',                                      -- DEFAULT BLANK


--   v_DSA_ID				CHAR(12);
            '',                                      -- DEFAULT BLANK


--   v_photograph_id			CHAR(10);
            '',                                      -- DEFAULT BLANK


-- v_Secure_id				CHAR(10);
            '',                                      -- DEFAULT BLANK


--  v_Deliquency_Period			CHAR(38);
            '',                                      -- DEFAULT BLANK


--   v_AddName1				CHAR(50);
            '',                                      -- DEFAULT BLANK


--   v_AddName2				CHAR(50);
            '',                                      -- DEFAULT BLANK


--   v_AddName3				CHAR(50);
            '',                                      -- DEFAULT BLANK


--   v_AddName4				CHAR(50);
            '',                                      -- DEFAULT BLANK


--   v_AddName5				CHAR(50);
            '',                                      -- DEFAULT BLANK


-- v_OldEntityCreatedOn			CHAR(10);
            '',                                      -- DEFAULT BLANK


--   v_OldEntityType			CHAR(50);
            '',                                      -- DEFAULT BLANK


--   v_OldEntityID			CHAR(20);
            '',                                      -- DEFAULT BLANK


--  v_Document_Received			CHAR(1);
            '',                                      -- DEFAULT BLANK


--   v_Suspend_Notes			CHAR(500);
            '',                                      -- DEFAULT BLANK


--   v_Suspend_Reason			CHAR(250);
            '',                                      -- DEFAULT BLANK


--   v_Blacklist_Notes			CHAR(500);
            '',                                      -- DEFAULT BLANK


--   v_Blacklist_Reason			CHAR(250);
            '',                                      -- DEFAULT BLANK


--   v_Negated_Notes			CHAR(500);
            '',                                      -- DEFAULT BLANK


--   v_Negated_Reason			CHAR(250);
            '',                                      -- DEFAULT BLANK


-- v_Segmentation_Class			CHAR(100);
            'RET',                                   -- DEFAULT SET TO 'RET'


--   v_Name			 	CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_Manager_Opinion			CHAR(240);
            '',                                      -- DEFAULT BLANK


--   v_Introd_Status			CHAR(50);
            '',                                      -- DEFAULT BLANK


--   v_NativeLangCode			CHAR(10);
            'ENGLISH',                               -- DEFAULT SET TO 'ENGLISH'
  
--   v_MinorAttainMajorDate		CHAR(11);
 
   	case  	when GFPF.GFCTP in ('EM','EY') then
  
 		      case
		         when BGPF.BG0007 is not null  and pack_mig_eq3.get_date_fm_btrv(BGPF.BG0007) <> 'ERROR'then 
                to_char(add_months(to_date(pack_mig_eq3.get_date_fm_btrv(bgpf.bg0007),'DD-MM-YYYY'),216),'DD-MON-YYYY')
             else   ''
		      end
	
	
  ELSE ''
  end,
  
  -- v_NREBecomingOrdDate			CHAR(11);
            '',                                      -- DEFAULT BLANK


-- v_Start_Date				CHAR(11);
            '',                                      -- DEFAULT BLANK


--   v_Add1_First_Name			CHAR(80);
            '',                                      -- DEFAULT BLANK


--   v_Add1_Middle_Name			CHAR(80);
            '',                                      -- DEFAULT BLANK


--   v_Add1_Last_Name			CHAR(80);
            '',                                      -- DEFAULT BLANK


--   v_Add2_First_Name			CHAR(80);
            '',                                      -- DEFAULT BLANK


--   v_Add2_Middle_Name			CHAR(80);
            '',                                      -- DEFAULT BLANK


--   v_Add2_Last_Name			CHAR(80);
            '',                                      -- DEFAULT BLANK


--   v_Add3_First_Name			CHAR(80);
            '',                                      -- DEFAULT BLANK


--   v_Add3_Middle_Name			CHAR(80);
            '',                                      -- DEFAULT BLANK


--   v_Add3_Last_Name			CHAR(80);
            '',                                      -- DEFAULT BLANK


--   v_Add4_First_Name			CHAR(80);
            '',                                      -- DEFAULT BLANK


--   v_Add4_Middle_Name			CHAR(80);
            '',                                      -- DEFAULT BLANK


--   v_Add4_Last_Name			CHAR(80);
            '',                                      -- DEFAULT BLANK


--   v_Add5_First_Name			CHAR(80);
            '',                                      -- DEFAULT BLANK


--   v_Add5_Middle_Name			CHAR(80);
            '',                                      -- DEFAULT BLANK


--   v_Add5_Last_Name			CHAR(80);
            '',                                      -- DEFAULT BLANK


--   v_Dual_First_Name			CHAR(80);
            '',                                      -- DEFAULT BLANK


--   v_Dual_Middle_Name			CHAR(80);
            '',                                      -- DEFAULT BLANK


--   v_Dual_Last_Name			CHAR(80);
            '',                                      -- DEFAULT BLANK


--   v_Cust_Community			CHAR(50);
            '',                                      -- MAPPING TABLE REQUIRED


--   v_Core_introd_cust_id		CHAR(9);
            '',                                      -- DEFAULT BLANK


--   v_Introd_Salutation_code		CHAR(5);
            '',                                      -- DEFAULT BLANK


--   v_Tds_cust_id			CHAR(9);
            '',                                      -- DEFAULT BLANK


--   v_Nat_id_card_num			CHAR(16);
            '',                                      -- DEFAULT BLANK


--   v_Psprt_issue_date			CHAR(10);
            '',                                      -- DEFAULT BLANK


-- v_Psprt_det				CHAR(25);
            '',                                      -- DEFAULT BLANK


--   v_Psprt_exp_date			CHAR(10);
            '',                                      -- DEFAULT BLANK


-- v_Crncy_code				CHAR(3);
            'INR',                                   -- DEFAULT SET TO 'INR'


-- v_Pref_code				CHAR(15);
            '',                                      -- DEFAULT BLANK


-- v_Introd_Status_Code			CHAR(5);
            '',                                      -- DEFAULT BLANK


--   v_NativeLangTitle_code		CHAR(5);
            '',                                      -- DEFAULT BLANK


--   v_Groupid_code			CHAR(5);
            '',                                      -- DEFAULT BLANK


--   v_Sector				CHAR(50);
            '',                                      -- DEFAULT BLANK


-- v_SubSector				CHAR(50);
            '',                                      -- DEFAULT BLANK


--   v_CustCreationMode			CHAR(1);
            '',                                      -- DEFAULT BLANK


--   v_First_Product_Processor		CHAR(50);
            '',                                      -- DEFAULT BLANK


--   v_Interface_Reference_ID		CHAR(50);
            '',                                      -- DEFAULT BLANK


--   v_cust_health_ref_code		CHAR(5);
            '',                                      -- DEFAULT BLANK


-- v_TDS_CIFID				CHAR(50);
            map_cif.fin_cif_id,                      -- DEFAULT SET TO CIF_ID

--   v_PREF_CODE_RCODE			CHAR(5);
            '',                                      -- DEFAULT BLANK


--   v_CUST_SWIFT_CODE_DESC		CHAR(50);
            '',                                      -- DEFAULT BLANK


--   v_IS_SWIFT_CODE_OF_BANK		CHAR(1);
            '',                                      -- DEFAULT BLANK


--   v_NATIVELANGCODE_CODE		CHAR(5);
            '',                               -- DEFAULT SET TO 'ENGLISH'
---- Size is 5 and throwing 7 characters... how it is possible...?

-- v_CreatedBySystemID			CHAR(50);
            '',                                      -- DEFAULT BLANK


-- v_PreferredEmailType			CHAR(50);
            '',                                      -- DEFAULT BLANK


--   v_PreferredPhone			CHAR(25);
            '',                                      -- DEFAULT BLANK


--   v_CUST_FIRST_NAME_NATIVE		CHAR(80);
            '',                                      -- DEFAULT BLANK


--   v_CUST_MIDDLE_NAME_NATIVE		CHAR(80);
            '',                                      -- DEFAULT BLANK


--   v_CUST_LAST_NAME_NATIVE		CHAR(80);
            '',                                      -- DEFAULT BLANK


-- v_SHORT_NAME_NATIVE			CHAR(50);
            '',                                      -- DEFAULT BLANK


--   v_CUST_FIRST_NAME_NATIVE1		CHAR(80);
            '',                                      -- DEFAULT BLANK


--   v_CUST_MIDDLE_NAME_NATIVE1		CHAR(80);
            '',                                      -- DEFAULT BLANK


--   v_CUST_LAST_NAME_NATIVE1		CHAR(80);
            '',                                      -- DEFAULT BLANK


-- v_SHORT_NAME_NATIVE1			CHAR(50);
            '',                                      -- DEFAULT BLANK


--   v_SecondaryRM_ID			CHAR(50);
            '',                                      -- DEFAULT BLANK


--   v_TertiaryRM_ID			CHAR(50);
            '',                                      -- DEFAULT BLANK


-- v_SUBSEGMENT				CHAR(50);
            'RET1',                                      -- DEFAULT BLANK


--   v_ACCESSOWNERGROUP			CHAR(38);
            '',                                      -- DEFAULT BLANK


-- v_ACCESSOWNERSEGMENT			CHAR(50);
            '',                                      -- DEFAULT BLANK


--   v_ACCESSOWNERBC			CHAR(38);
            'RETAIL',                                -- DEFAULT SET TO RETAIL


--   v_ACCESSOWNERAGENT			CHAR(38);
            '',                                      -- DEFAULT BLANK


--   v_ACCESSASSIGNEEAGENT		CHAR(38);
            '',                                      -- DEFAULT BLANK


--   v_CHARGELEVELCODE			CHAR(50);
            '',                                      -- DEFAULT BLANK


--   v_IntUserField1			CHAR(38);
            '',                                      -- DEFAULT BLANK


--   v_IntUserField2			CHAR(38);
            '',                                      -- DEFAULT BLANK


--   v_IntUserField3			CHAR(38);
            '',                                      -- DEFAULT BLANK


--   v_IntUserField4			CHAR(38);
            '',                                      -- DEFAULT BLANK


--   v_IntUserField5			CHAR(38);
            '',                                      -- DEFAULT BLANK


--   v_StrUserField1			CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_StrUserField2			CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_StrUserField3			CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_StrUserField4			CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_StrUserField5			CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_StrUserField6			CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_StrUserField7			CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_StrUserField8			CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_StrUserField9			CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_StrUserField10			CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_StrUserField11			CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_StrUserField12			CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_StrUserField13			CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_StrUserField14			CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_StrUserField15			CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_StrUserField16			CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_StrUserField17			CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_StrUserField18			CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_StrUserField19			CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_StrUserField20			CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_StrUserField21			CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_StrUserField22			CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_StrUserField23			CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_StrUserField24			CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_StrUserField25			CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_StrUserField26			CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_StrUserField27			CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_StrUserField28			CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_StrUserField29			CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_StrUserField30			CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_DateUserField1			CHAR(11);
            '',                                      -- DEFAULT BLANK


--   v_DateUserField2			CHAR(11);
            '',                                      -- DEFAULT BLANK


--   v_DateUserField3			CHAR(11);
            '',                                      -- DEFAULT BLANK


--   v_DateUserField4			CHAR(11);
            '',                                      -- DEFAULT BLANK


--   v_DateUserField5			CHAR(11);
            '',                                      -- DEFAULT BLANK


--   v_Back_End_ID			CHAR(50);
            '',                                      -- DEFAULT BLANK


-- v_RISK_PROFILE_SCORE			CHAR(38);
            '',                                      -- MAPPING TABLE REQUIRED


--   v_RISK_PROFILE_EXPIRY_DATE		CHAR(17);
            '',                                      -- DEFAULT BLANK


-- v_PreferredPhoneType			CHAR(50);
            '',                                      -- DEFAULT BLANK


--   v_PreferredEmail			CHAR(150);
            '',                                      -- DEFAULT BLANK


--   v_NoOfCreditCards			CHAR(38);
            '',                                      -- DEFAULT BLANK


-- v_ReasonForMovingOut			CHAR(5);
            '',                                      -- DEFAULT BLANK


--   v_CompetitorProductID		CHAR(50);
            '',                                      -- DEFAULT BLANK


--   v_OCCUPATION_TYPE			CHAR(50);
            '',                                      -- MAPPING TABLE REQUIRED


--   v_BANK_ID				CHAR(8);
            '01',                                      -- DEFAULT BLANK, But given 01 in XLS RC001 sheet.


--   v_ZAKAT_DEDUCTION			CHAR(2);
            '',                                      -- DEFAULT BLANK


--   v_ASSET_CLASSIFICATION		CHAR(1);
            '',                                      -- DEFAULT BLANK


--   v_CUSTOMER_LEVEL_PROVISIONING	CHAR(1);
            '',                                      -- DEFAULT BLANK


--   v_ISLAMIC_BANKING_CUSTOMER		CHAR(1);
            '',                                      -- DEFAULT BLANK


-- v_PREFERREDCALENDER			CHAR(50);
            '',                                      -- DEFAULT BLANK


--   v_IDTYPER1				CHAR(50);
            '',                                      -- DEFAULT BLANK


--   v_IDTYPER2				CHAR(50);
            '',                                      -- DEFAULT BLANK


--   v_IDTYPER3				CHAR(50);
            '',                                      -- DEFAULT BLANK


--   v_IDTYPER4				CHAR(50);
            '',                                      -- DEFAULT BLANK


--   v_IDTYPER5				CHAR(50);
            '',                                      -- DEFAULT BLANK


--   v_CUST_LAST_NAME_ALT1		CHAR(80);
            '',                                      -- DEFAULT BLANK


--   v_CUST_FIRST_NAME_ALT1		CHAR(80);
            '',                                      -- DEFAULT BLANK


--   v_CUST_MIDDLE_NAME_ALT1		CHAR(80);
            '',                                      -- DEFAULT BLANK


--   v_STRFIELD6_ALT1			CHAR(50);
            '',                                      -- DEFAULT BLANK


-- v_NAME_ALT1				CHAR(80);
            '',                                      -- DEFAULT BLANK


--   v_SHORT_NAME_ALT1			CHAR(10);
            '',                                      -- DEFAULT BLANK


-- v_ISEBANKINGENABLED			CHAR(1);
            'Y',                                      -- DEFAULT SET TO 'Y'


-- v_PURGEFLAG				CHAR(1);
            'N',                                      -- DEFAULT SET TO 'N'


--  v_SUSPENDED				CHAR(1);
            'N',                                      -- DEFAULT SET TO 'N'


--   v_BLACKLISTED			CHAR(1);
            'N',                                      -- DEFAULT SET TO 'N'


--   v_NEGATED		 		CHAR(1);
            'N',                                      -- DEFAULT SET TO 'N'


--  v_ACCOUNTID				CHAR(50);
            '',                                      -- DEFAULT BLANK


--   v_ADDRESS_LINE1			CHAR(200);
            '',                                      -- DEFAULT BLANK


--   v_ADDRESS_LINE2			CHAR(200);
            '',                                      -- DEFAULT BLANK


--   v_ADDRESS_LINE3			CHAR(200);
            '',                                      -- DEFAULT BLANK


--   v_STATE				CHAR(200);
            '',                                      -- DEFAULT BLANK


--   v_COUNTRY				CHAR(100);
            '',                                      -- DEFAULT BLANK


--   v_ZIP				CHAR(100);
            '',                                      -- DEFAULT BLANK


-- v_BOCREATEDBYLOGINID			CHAR(50)
            ''                                      -- DEFAULT BLANK
  	from map_cif
    inner join gfpf on map_cif.leg_cust_number = gfpf.gfcus
    left join BGPF on bgcus = gfcus
    left join map_cif_type on leg_cust_type_code = gfpf.gfctp
    where map_cif_type.leg_cust_type ='Individual'
    and map_cif.fin_sol_id='0006');
    

  commit;
  END;