-- File Name		: lat_upload.sql

-- File Created for	: Upload file for lat

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure lat_upload(
v_mig_date IN TIMESTAMP
)
   as
   v_Indicator			 CHAR(3);
   v_Transaction_Type		 CHAR(1);
   v_Transaction_sub_Type	 CHAR(2);
   v_Account_Number		 CHAR(16);
   v_Currency			 CHAR(3);
   v_Service_Outlet		 CHAR(8);
   v_Amount			 CHAR(17);
   v_Part_tran_type		 CHAR(1);
   v_Type_of_demands		 CHAR(1);
   v_Value_Date			 CHAR(8);
   v_Flow_Id			 CHAR(5);
   v_Demand_Date		 CHAR(8);
   v_Last_part_transaction_flag	 CHAR(1);
   v_Tran_end_ind		 CHAR(1);
   v_Advance_Payment_Flag	 CHAR(1);
   v_Prepayment_Type		 CHAR(1);
   v_int_coll_on_prepayment_flg	 CHAR(1);
   
   
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

EXECUTE IMMEDIATE 'truncate table LAT_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Indicator,v_Transaction_Type,v_Transaction_sub_Type,v_Account_Number,v_Currency,v_Service_Outlet,v_Amount,v_Part_tran_type,v_Type_of_demands,v_Value_Date,v_Flow_Id,v_Demand_Date,v_Last_part_transaction_flag,v_Tran_end_ind,v_Advance_Payment_Flag,v_Prepayment_Type,v_int_coll_on_prepayment_flg;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into LAT_O_TABLE values (v_Indicator,v_Transaction_Type,v_Transaction_sub_Type,v_Account_Number,v_Currency,v_Service_Outlet,v_Amount,v_Part_tran_type,v_Type_of_demands,v_Value_Date,v_Flow_Id,v_Demand_Date,v_Last_part_transaction_flag,v_Tran_end_ind,v_Advance_Payment_Flag,v_Prepayment_Type,v_int_coll_on_prepayment_flg ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;