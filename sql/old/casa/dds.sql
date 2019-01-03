-- File Name		: dds.sql

-- File Created for	: Upload file for dds

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure dds
   as
   v_Indicator  		 CHAR(3);
   v_DD_Issued_Branch_Code	 CHAR(6);
   v_DD_Number 			 CHAR(16);
   v_DD_Issue_Date		 CHAR(8);
   v_DD_Issued_Bank_Code	 CHAR(6);
   v_DD_Currency		 CHAR(3);
   v_Scheme_Code		 CHAR(5);
   v_Status  			 CHAR(1);
   v_Status_Update_Date		 CHAR(8);
   v_DD_Amount			 CHAR(17);
   v_Payee_Branch_Code		 CHAR(6);
   v_Payee_Bank_Code		 CHAR(6);
   v_Instrument_No		 CHAR(16);
   v_DD_Revalidation_Date	 CHAR(8);
   v_Print_Advice_Flag		 CHAR(1);
   v_Print_Remarks		 CHAR(50);
   v_Paying_Branch_Code		 CHAR(6);
   v_Paying_Bank_Code		 CHAR(6);
   v_Routing_Branch_Code	 CHAR(6);
   v_Routing_Bank_Code		 CHAR(6);
   v_Instrument_Type		 CHAR(6);
   v_Instrument_Alpha		 CHAR(6);
   v_Purchasers_Name		 CHAR(80);
   v_Payees_Name		 CHAR(80);
   v_Print_Option		 CHAR(1);
   v_Print_Flag			 CHAR(1);
   v_Print_Count		 CHAR(3);
   v_Duplicate_Issue_Count	 CHAR(3);
   v_Duplicate_Issue_Date	 CHAR(8);
   v_Rectified_Count		 CHAR(3);
   v_Cautioned_Status		 CHAR(1);
   v_Reason_for_Caution		 CHAR(50);
   v_Paid_Ex_Advice		 CHAR(1);
   v_Inventory_Serial_No	 CHAR(16);
   v_Paid_Advice_Flag		 CHAR(1);
   v_Advice_Received_Date	 CHAR(8);
   v_Issue_Extn_Cntr_Code	 CHAR(2);   
   
--  DECLARE
   CURSOR c1 is
     select 'DDS',
--   v_Indicator  		 CHAR(3);
--   v_DD_Issued_Branch_Code	 CHAR(6);
            lpad(capf.cabbn,6,' '),
-- v_DD_Number 			 CHAR(16);
            lpad(sa14lf.sadrf,16,' '),
--   v_DD_Issue_Date		 CHAR(8);
	    to_char(to_date(pack_mig_EQ3.get_date_fm_btrv(sapod),'DD/MM/YYYY'),'YYYYMMDD'),
--   v_DD_Issued_Bank_Code	 CHAR(6);
            lpad('IBL',6,' '),
--   v_DD_Currency		 CHAR(3);
            'INR',
--   v_Scheme_Code		 CHAR(5);
            lpad('IBLDD ',5,' '),
--   v_Status  			 CHAR(1);
            'U',
-- v_Status_Update_Date		 CHAR(8);
	    to_char(to_date(pack_mig_EQ3.get_date_fm_btrv(sapod),'DD/MM/YYYY'),'YYYYMMDD'),
-- v_DD_Amount			 CHAR(17);
            lpad(to_number((saama)/POWER(10,C8CED)),17,' '),
--  v_Payee_Branch_Code		 CHAR(6);
            lpad('IBL',6,' '),
--   v_Payee_Bank_Code		 CHAR(6);
            lpad(sgpf.sgnr4,6,' '),
--   v_Instrument_No		 CHAR(16);
            lpad(sa14lf.sadrf,16,' '),
--   v_DD_Revalidation_Date	 CHAR(8);
            lpad(' ',8,' '),
-- v_Print_Advice_Flag		 CHAR(1);
            lpad(' ',1,' '),
--   v_Print_Remarks		 CHAR(50);
            lpad(' ',50,' '),
-- v_Paying_Branch_Code		 CHAR(6);
            lpad(' ',6,' '),
--   v_Paying_Bank_Code		 CHAR(6);
            lpad(' ',6,' '),
--   v_Routing_Branch_Code	 CHAR(6);
            lpad(' ',6,' '),
--  v_Routing_Bank_Code		 CHAR(6);
            lpad(' ',6,' '),
--   v_Instrument_Type		 CHAR(6);
            lpad('DDS',6,' '),
--   v_Instrument_Alpha		 CHAR(6);
            lpad(' ',6,' '),
--   v_Purchasers_Name		 CHAR(80);
            lpad(sgpf.sgnr1,80,' '),
--   v_Payees_Name		 CHAR(80);
            lpad(' ',80,' '),
--   v_Print_Option		 CHAR(1);
            lpad(' ',1,' '),
-- v_Print_Flag			 CHAR(1);
            lpad(' ',1,' '),
--   v_Print_Count		 CHAR(3);
            lpad('Y',1,' '),
--   v_Duplicate_Issue_Count	 CHAR(3);
            lpad(' ',3,' '),
--   v_Duplicate_Issue_Date	 CHAR(8);
            lpad(' ',8,' '),
--   v_Rectified_Count		 CHAR(3);
            lpad(' ',3,' '),
--   v_Cautioned_Status		 CHAR(1);
            lpad(' ',1,' '),
-- v_Reason_for_Caution		 CHAR(50);
            lpad(' ',50,' '),
--   v_Paid_Ex_Advice		 CHAR(1);
            'N',
--   v_Inventory_Serial_No	 CHAR(16);
            lpad(sa14lf.sadrf,16,' '),
--   v_Paid_Advice_Flag		 CHAR(1);
            'N',
--   v_Advice_Received_Date	 CHAR(8);
            lpad(' ',8,' '),
--   v_Issue_Extn_Cntr_Code	 CHAR(2);   
            lpad(' ',2,' ')
  	from sa14lf
	inner join sgpf on SGPOD||SGBRNM||SGPBR||SGPSQ = SAPOD||SABRNM||SAPBR||SAPSQ;

   
BEGIN

Begin

EXECUTE IMMEDIATE 'truncate table DDS_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Indicator,v_DD_Issued_Branch_Code,v_DD_Number,v_DD_Issue_Date,v_DD_Issued_Bank_Code,v_DD_Currency,v_Scheme_Code,v_Status,v_Status_Update_Date,v_DD_Amount,v_Payee_Branch_Code,v_Payee_Bank_Code,v_Instrument_No,v_DD_Revalidation_Date,v_Print_Advice_Flag,v_Print_Remarks,v_Paying_Branch_Code,v_Paying_Bank_Code,v_Routing_Branch_Code,v_Routing_Bank_Code,v_Instrument_Type,v_Instrument_Alpha,v_Purchasers_Name,v_Payees_Name,v_Print_Option,v_Print_Flag,v_Print_Count,v_Duplicate_Issue_Count,v_Duplicate_Issue_Date,v_Rectified_Count,v_Cautioned_Status,v_Reason_for_Caution,v_Paid_Ex_Advice,v_Inventory_Serial_No,v_Paid_Advice_Flag,v_Advice_Received_Date,v_Issue_Extn_Cntr_Code;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into DDS_O_TABLE values (v_Indicator,v_DD_Issued_Branch_Code,v_DD_Number,v_DD_Issue_Date,v_DD_Issued_Bank_Code,v_DD_Currency,v_Scheme_Code,v_Status,v_Status_Update_Date,v_DD_Amount,v_Payee_Branch_Code,v_Payee_Bank_Code,v_Instrument_No,v_DD_Revalidation_Date,v_Print_Advice_Flag,v_Print_Remarks,v_Paying_Branch_Code,v_Paying_Bank_Code,v_Routing_Branch_Code,v_Routing_Bank_Code,v_Instrument_Type,v_Instrument_Alpha,v_Purchasers_Name,v_Payees_Name,v_Print_Option,v_Print_Flag,v_Print_Count,v_Duplicate_Issue_Count,v_Duplicate_Issue_Date,v_Rectified_Count,v_Cautioned_Status,v_Reason_for_Caution,v_Paid_Ex_Advice,v_Inventory_Serial_No,v_Paid_Advice_Flag,v_Advice_Received_Date,v_Issue_Extn_Cntr_Code ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;