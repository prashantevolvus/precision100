-- File Name		: G1PF.ctl

-- File Created for	: Control file for upload the Branch details Mster DaTa

-- Created By		: Ashok Kumar.S

-- Client		: ENBD

-- Created On		: 01-11-2011
-------------------------------------------------------------------

load data
truncate into table G1PF
fields terminated by x'09'
TRAILING NULLCOLS
(
   G1CUS,
   G1CLC,
   G1CF01,
   G1CF02,
   G1CF03,
   G1CF04,
   G1CF05,
   G1CF06,
   G1CF07,
   G1CF08,
   G1CF09,
   G1CF10,
   G1CF11,
   G1CF12,
   G1CF13,
   G1CF14,
   G1CF15,
   G1DLM
)

