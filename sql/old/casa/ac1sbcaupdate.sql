update AC1SBCA_O_TABLE set Next_Debit_interest_run_dt=(select key_value from sys_config where key_string='NEXT_INT_RUN_DT_DR_SB')
where scheme_code like 'SB%' ;

update AC1SBCA_O_TABLE set Next_cr_interest_run_date=(select key_value from sys_config where key_string='NEXT_INT_RUN_DT_CR_SB')
where scheme_code like 'SB%' ;

update AC1SBCA_O_TABLE set Next_debit_interest_run_dt=(select key_value from sys_config where key_string='NEXT_INT_RUN_DT_DR_CA')
where scheme_code like 'CA%' ;

update ac1sbca_o_table set Int_freq_start_dd_Credit = substr(Next_cr_interest_run_date,7,2);

update ac1sbca_o_table set Int_freq_start_dd_Debit = substr(Next_debit_interest_run_dt,7,2);




