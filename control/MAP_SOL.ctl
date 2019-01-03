-- File Name		: MAP_SOL.ctl

-- File Created for	: Control file for upload the Branch details Mster DaTa

-- Created By		: Ashok Kumar.S

-- Client		: ENBD

-- Created On		: 01-11-2011
-------------------------------------------------------------------

load data
truncate into table MAP_SOL
fields terminated by x'09'
TRAILING NULLCOLS
(
    BR_CODE,
    BR_NAME,
    LOCATION,
    FIN_SOL_ID,
    FIN_BR_CODE
  )
  