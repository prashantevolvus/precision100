-- File Name		: D3PF.ctl

-- File Created for	: Control file for upload the Branch details Mster DaTa

-- Created By		: Ashok Kumar.S

-- Client		: ENBD

-- Created On		: 01-11-2011
-------------------------------------------------------------------

load data
truncate into table D3PF
fields terminated by x'09'
TRAILING NULLCOLS
(
   D3XMS  CHAR(2),
   D3XME  CHAR(25),
   D3DLM  NUMBER(7,0)
)

