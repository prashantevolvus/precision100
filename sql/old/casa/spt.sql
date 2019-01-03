create or replace
procedure spt
   as
   v_Indicator  		  CHAR(3) NULL;
   v_Account_Number		  CHAR(16) NULL;
   v_Begin_Cheque_Number	  CHAR(16) NULL;
   v_SP_Acceptance_Date		  CHAR(8) NULL;
   v_Cheque_Date		  CHAR(8) NULL;
   v_Cheque_Amount		  CHAR(17) NULL;
   v_Payee_Name			  CHAR(40) NULL;
   v_No_of_Leaves		  CHAR(3) NULL;
   v_Cheque_Alpha_Code		  CHAR(6) NULL;
   v_Reason_Code_for_Stop_Payment CHAR(5) NULL;
   v_Account_Balance		  CHAR(17) NULL;
   v_Currency_Code		  CHAR(3) NULL;


--  DECLARE
  CURSOR c1 is
     select 'SPT',
            rpad(map_acc.fin_acc_num,16,' '),
            rpad(r4pf.R4FSN,16,' '),
	    to_char(to_date(pack_mig_EQ3.get_date_fm_btrv(r4eff),'DD/MM/YYYY'),'YYYYMMDD'),
            lpad(' ',8,' '),
            lpad(to_number((r4amt)/POWER(10,C8CED)),17,' '),
            rpad(' ',40,' '),
            rpad(to_number((r4pf.R4LSR-r4pf.R4FSN) +1),3,' '),
            lpad(' ',6,' '),
            lpad(r4pf.r4nar,5,' '),
            lpad(' ',17,' '),
            rpad(scpf.scccy,3,' ')
  	from map_acc
  inner join scpf on scpf.scab||scan||scas = map_acc.leg_acc_num
  inner join r4pf on r4pf.r4ab||r4an||r4as = map_acc.leg_acc_num
 	inner join c8pf on c8ccy = scccy
  where rownum <= 10;

   
BEGIN

Begin

EXECUTE IMMEDIATE 'truncate table spt_o_table';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Indicator,v_Account_Number,v_Begin_Cheque_Number,v_SP_Acceptance_Date,v_Cheque_Date,v_Cheque_Amount,v_Payee_Name,v_No_of_Leaves,v_Cheque_Alpha_Code,v_Reason_Code_for_Stop_Payment,v_Account_Balance,v_Currency_Code;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into spt_o_table values (v_Indicator,v_Account_Number,v_Begin_Cheque_Number,v_SP_Acceptance_Date,v_Cheque_Date,v_Cheque_Amount,v_Payee_Name,v_No_of_Leaves,v_Cheque_Alpha_Code,v_Reason_Code_for_Stop_Payment,v_Account_Balance,v_Currency_Code ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;