-- File Name		: drawdown_upload.sql

-- File Created for	: Upload file for drawdown

-- Created By		: Ashok Kumar.S

-- Client		: Indus Ind Bank

-- Created On		: 01-11-2011
-------------------------------------------------------------------

create or replace
procedure drawdown_upload(
v_mig_date IN TIMESTAMP
)
   as
   v_Account_Number		 CHAR(16);
   v_Start_Date			 CHAR(10);
   v_End_Date 			 CHAR(10);
   v_Scheduled_Draw_Down_Amount	 CHAR(17);
   v_Draw_Down_Currency		 CHAR(3);
   v_Credit_Account_Num		 CHAR(16);
   v_ECS_Mandate_Serial_Number	 CHAR(12);
   v_Mode_of_Draw_Down		 CHAR(1);
   v_Actual_Draw_Down_Amount	 CHAR(17);
   v_Remarks			 CHAR(60);
   v_Paysys_ID			 CHAR(5);
   
   
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

EXECUTE IMMEDIATE 'truncate table DRAWDOWN_O_TABLE';
  
end;

   OPEN c1;
     LOOP
--   FOR i IN 1..5 LOOP
      FETCH c1 INTO v_Account_Number,v_Start_Date,v_End_Date,v_Scheduled_Draw_Down_Amount,v_Draw_Down_Currency,v_Credit_Account_Num,v_ECS_Mandate_Serial_Number,v_Mode_of_Draw_Down,v_Actual_Draw_Down_Amount,v_Remarks,v_Paysys_ID;
     
      EXIT WHEN c1%NOTFOUND;  
            
      insert into DRAWDOWN_O_TABLE values (v_Account_Number,v_Start_Date,v_End_Date,v_Scheduled_Draw_Down_Amount,v_Draw_Down_Currency,v_Credit_Account_Num,v_ECS_Mandate_Serial_Number,v_Mode_of_Draw_Down,v_Actual_Draw_Down_Amount,v_Remarks,v_Paysys_ID ); 
      
      COMMIT;
   
   END LOOP;
   CLOSE c1;
END;