-- File Name		: MAP_OFF_ACC.ctl

-- File Created for	: Control file for upload the Branch details Mster DaTa

-- Created By		: Ashok Kumar.S

-- Client		: ENBD

-- Created On		: 01-11-2011
-------------------------------------------------------------------

load data
truncate into table MAP_OFF_ACC
fields terminated by x'09'
TRAILING NULLCOLS
(
    LEG_ACC_NUM,
    LEG_ACCT_TYPE,
    LEG_SOC_LINE_ITEM,
    FIN_ACC_NUM,
    FIN_SOL_ID,
    FIN_SCHEME_CODE,
    FIN_SCHEME_TYPE,
    FIN_GL_SUB_HEAD,
    FIN_PLACE_HOLDER
  )