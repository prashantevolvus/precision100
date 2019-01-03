-- File Name		: ltd_upload.sql

-- File Created for	: Upload file for ltd

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure ltd_upload(
v_mig_date IN TIMESTAMP
)
   as
  v_Transaction_Type		 CHAR(1);
  v_Transaction_Sub_Type	 CHAR(2);
  v_Account_Number		 CHAR(16);
  v_Currency			 CHAR(3);
  v_Sol_Id			 CHAR(8);
  v_Transaction_Amount		 CHAR(17);
  v_Part_Tran_Type		 CHAR(1);
  v_Type_of_demands		 CHAR(1);
  v_Value_Date			 CHAR(10);
  v_Flow_Id			 CHAR(5);
  v_Demand_Date			 CHAR(10);
  v_Last_part_tran_flag		 CHAR(1);
  v_Transaction_End_indicator	 CHAR(1);
  v_Advance_Payment_flag	 CHAR(1);
  v_Prepayment_Type		 CHAR(1);
  v_Int_colc_on_prepayment_flg	 CHAR(1);
  v_Transaction_Remarks		 CHAR(30);
  v_Transaction_Particulars	 CHAR(50);
   
   
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

EXECUTE IMMEDIATE 'truncate table LTD_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Transaction_Type,v_Transaction_Sub_Type,v_Account_Number,v_Currency,v_Sol_Id,v_Transaction_Amount,v_Part_Tran_Type,v_Type_of_demands,v_Value_Date,v_Flow_Id,v_Demand_Date,v_Last_part_tran_flag,v_Transaction_End_indicator,v_Advance_Payment_flag,v_Prepayment_Type,v_Int_colc_on_prepayment_flg,v_Transaction_Remarks,v_Transaction_Particulars;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into LTD_O_TABLE values (v_Transaction_Type,v_Transaction_Sub_Type,v_Account_Number,v_Currency,v_Sol_Id,v_Transaction_Amount,v_Part_Tran_Type,v_Type_of_demands,v_Value_Date,v_Flow_Id,v_Demand_Date,v_Last_part_tran_flag,v_Transaction_End_indicator,v_Advance_Payment_flag,v_Prepayment_Type,v_Int_colc_on_prepayment_flg,v_Transaction_Remarks,v_Transaction_Particulars ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;