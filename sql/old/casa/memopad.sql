-- File Name		: Memopad.sql

-- File Created for	: Upload format for Memopad

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure memopad
   as
   v_Indicator  		   CHAR(3);
   v_Memo_Pad_Title		   CHAR(30);
   v_Function_Code		   CHAR(5);
   v_Intent  			   CHAR(1);
   v_Security  			   CHAR(1);
   v_Text_Message		   CHAR(240);
   v_Account_No  		   CHAR(16);
   v_Transaction_ID		   CHAR(9);
   v_Transaction_Date		   CHAR(8);
   v_Trx_Serial_No		   CHAR(4);
   v_CIF_ID  			   CHAR(32);
   v_Standing_Order_Serial_No	   CHAR(12);
   v_Instrument_Type		   CHAR(5);
   v_Instrument_ID		   CHAR(16);
   v_Employee_ID 		   CHAR(10);
   v_Signatory   		   CHAR(9);
   v_Inventory_Class		   CHAR(3);
   v_Inventory_Type		   CHAR(6);
   v_Inventory_Serial_No	   CHAR(16);
   v_Inventory_Location_Class	   CHAR(2);
   v_Inventory_Location_Code	   CHAR(10);
   v_Key_Word  			   CHAR(5);
   v_Audit_Ref_No		   CHAR(9);
   v_Sol_ID  			   CHAR(8);
   v_Text_Message_in_the_Alt_Lang  CHAR(240);
   v_Memo_Pad_Title_in_Alt_Lang	   CHAR(30);
   
   
--  DECLARE
   CURSOR c1 is
--   v_Indicator  		   CHAR(3);
     select 'MPT',
--   v_Memo_Pad_Title		   CHAR(30);
            rpad('MIGR_NOTES',30,' '),
--   v_Function_Code		   CHAR(5);
            rpad('MI',5,' '),
--   v_Intent  			   CHAR(1);
            'N',
-- v_Security  			   CHAR(1);
            'S',
--   v_Text_Message		   CHAR(240);
            rpad(G1PF.G1CF01||G1CF02,240,' '),
--   v_Account_No  		   CHAR(16);
            lpad(' ',16,' '),
--   v_Transaction_ID		   CHAR(9);
            lpad(' ',9,' '),
--   v_Transaction_Date		   CHAR(8);
            lpad(' ',8,' '),
--   v_Trx_Serial_No		   CHAR(4);
            lpad(' ',4,' '),
--   v_CIF_ID  			   CHAR(32);
            rpad(map_cif.fin_cif_id,32,' '),
--   v_Standing_Order_Serial_No	   CHAR(12);
            lpad(' ',12,' '),
--   v_Instrument_Type		   CHAR(5);
            lpad(' ',5,' '),
--   v_Instrument_ID		   CHAR(16);
            lpad(' ',16,' '),
--   v_Employee_ID 		   CHAR(10);
            lpad(' ',10,' '),
--   v_Signatory   		   CHAR(9);
            lpad(' ',9,' '),
--   v_Inventory_Class		   CHAR(3);
            lpad(' ',3,' '),
--   v_Inventory_Type		   CHAR(6);
            lpad(' ',6,' '),
--   v_Inventory_Serial_No	   CHAR(16);
            lpad(' ',16,' '),
--   v_Inventory_Location_Class	   CHAR(2);
            lpad(' ',2,' '),
--   v_Inventory_Location_Code	   CHAR(10);
            lpad(' ',10,' '),
-- v_Key_Word  			   CHAR(5);
            lpad(' ',5,' '),
--   v_Audit_Ref_No		   CHAR(9);
            lpad(' ',9,' '),
--   v_Sol_ID  			   CHAR(8);
            rpad(MAP_cif.fin_sol_id,8,' '),
-- v_Text_Message_in_the_Alt_Lang  CHAR(240);
            lpad(' ',240,' '),
--   Memo_Pad_Title_in_Alt_Lang	   CHAR(30);
            lpad(' ',30,' ')
  	from map_cif
    inner join g1pf on g1cus = map_cif.leg_cust_number
    where G1CF01 is not null
    and rownum <=10;

   
BEGIN

Begin

EXECUTE IMMEDIATE 'truncate table memopad_o_table';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Indicator,v_Memo_Pad_Title,v_Function_Code,v_Intent,v_Security,v_Text_Message,v_Account_No,v_Transaction_ID,v_Transaction_Date,v_Trx_Serial_No,v_CIF_ID,v_Standing_Order_Serial_No,v_Instrument_Type,v_Instrument_ID,v_Employee_ID,v_Signatory,v_Inventory_Class,v_Inventory_Type,v_Inventory_Serial_No,v_Inventory_Location_Class,v_Inventory_Location_Code,v_Key_Word,v_Audit_Ref_No,v_Sol_ID,v_Text_Message_in_the_Alt_Lang,v_Memo_Pad_Title_in_Alt_Lang;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into memopad_o_table values (v_Indicator,v_Memo_Pad_Title,v_Function_Code,v_Intent,v_Security,v_Text_Message,v_Account_No,v_Transaction_ID,v_Transaction_Date,v_Trx_Serial_No,v_CIF_ID,v_Standing_Order_Serial_No,v_Instrument_Type,v_Instrument_ID,v_Employee_ID,v_Signatory,v_Inventory_Class,v_Inventory_Type,v_Inventory_Serial_No,v_Inventory_Location_Class,v_Inventory_Location_Code,v_Key_Word,v_Audit_Ref_No,v_Sol_ID,v_Text_Message_in_the_Alt_Lang,v_Memo_Pad_Title_in_Alt_Lang ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;