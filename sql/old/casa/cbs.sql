create or replace
procedure cbs
   as
   v_Indicator 			 CHAR(3);
   v_Account_Number		 CHAR(16);
   v_Currency_Code		 CHAR(3);
--   v_sol_id			 CHAR(8);
   v_Begin_Cheque_Number	 CHAR(16);
   v_Number_of_Cheque_Leaves	 CHAR(4);
   v_Date_of_Issue		 CHAR(8);
   v_Cheque_Leaf_Status		 CHAR(100);
   v_Begin_Cheque_Alpha		 CHAR(6);
   v_Dummy			 CHAR(100);
   
   
--  DECLARE
   CURSOR c1 is
-- v_Indicator 			 CHAR(3);
     select 'CBS',
--   v_Account_Number		 CHAR(16);
            rpad(map_acc.fin_acc_num,16,' '),
--   v_Currency_Code		 CHAR(3);
            lpad(scpf.scccy,3,' '),
--   v_sol_id			 CHAR(8);
--            rpad(map_acc.fin_sol_id,5,' '),
--   v_Begin_Cheque_Number	 CHAR(16);
            rpad(sdupf_o_table.sdufirs,16,' '),
--   v_Number_of_Cheque_Leaves	 CHAR(4);
            rpad((sdulast -sdufirs) + 1,4,' ') end,
--   v_Date_of_Issue		 CHAR(8);
            lpad(' ',5,' '),
-- v_Cheque_Leaf_Status		 CHAR(100);
            rpad(rpad(rpad('U',(sdulast - sdufirs +1),'U'),100,' '),100,' '),
-- v_Begin_Cheque_Alpha		 CHAR(6);
            lpad(' ',6,' '),
--   v_Dummy			 CHAR(100);
            lpad(' ',100,' ')
  	from map_acc
    inner join scpf on scpf.scab||scpf.scan||scpf.scas= map_acc.LEG_ACC_NUM
    inner join sdupf_o_table on sdupf_o_table.sduabc||sduanc||sduasc = map_acc.LEG_ACC_NUM
    where rownum <=10;
	


   
BEGIN

Begin

EXECUTE IMMEDIATE 'truncate table cbs_o_table';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Indicator,v_Account_Number,v_Currency_Code,v_Begin_Cheque_Number,v_Number_of_Cheque_Leaves,v_Date_of_Issue,v_Cheque_Leaf_Status,v_Begin_Cheque_Alpha,v_Dummy;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into cbs_o_table values (v_Indicator,v_Account_Number,v_Currency_Code,v_Begin_Cheque_Number,v_Number_of_Cheque_Leaves,v_Date_of_Issue,v_Cheque_Leaf_Status,v_Begin_Cheque_Alpha,v_Dummy ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;