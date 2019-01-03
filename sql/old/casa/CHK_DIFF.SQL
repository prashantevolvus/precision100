-- File Name		: chk_diff.sql

-- File Created for	: file for cheque book split into 100's

-- Created By		: Meher Siva VN

-- Client		: Indus Ind Bank

-- Created On		: 27-12-2011
-------------------------------------------------------------------




create or replace
procedure PRO_CHK_REL
AS 

-- Variables to store the fetched Data.
F_DUABC    CHAR(4);
F_DUANC     CHAR(6);
F_DUASC	   CHAR(3);
F_DUFIRS   NUMBER(16);
F_DULAST   NUMBER(16);
F_DUCBTC   CHAR(3);

V_LL NUMBER(16);   -- Variable Lower Limit
V_UL NUMBER(16);   -- Variable Upper Limit

CHK_DIFF NUMBER(5); -- Last leave value - first leave value to calculate the number of leaves


CURSOR CUR_CHK_REL_DIFF IS SELECT DUABC,DUANC,DUASC,DUFIRS,DULAST,DUCBTC FROM DUPF;
-- Fetching the data from the DUPF table


BEGIN

		EXECUTE IMMEDIATE 'TRUNCATE TABLE SDUPF_O_TABLE'; 

		OPEN CUR_CHK_REL_DIFF;


 
 		LOOP 
			FETCH CUR_CHK_REL_DIFF INTO F_DUABC,F_DUANC,F_DUASC,F_DUFIRS,F_DULAST,F_DUCBTC;
			CHK_DIFF := F_DULAST - F_DUFIRS;
			
			V_LL := F_DUFIRS;

			WHILE ( CHK_DIFF > 100)
			LOOP
				V_UL := V_LL +99;
				INSERT INTO SDUPF_O_TABLE  VALUES (F_DUABC,F_DUANC,F_DUASC,V_LL,V_UL,F_DUCBTC);
				V_LL := V_UL+1;
				CHK_DIFF := F_DULAST - V_LL;
			END LOOP;

			
			IF CHK_DIFF <= 100 THEN
				INSERT INTO SDUPF_O_TABLE  VALUES (F_DUABC,F_DUANC,F_DUASC,V_LL,F_DULAST,F_DUCBTC);
			END IF;
			
			EXIT WHEN CUR_CHK_REL_DIFF % NOTFOUND;					

		END LOOP;


CLOSE CUR_CHK_REL_DIFF;
END;