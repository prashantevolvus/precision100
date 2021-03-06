-- File Name		: V5PF.ctl

-- File Created for	: Control file for upload the Branch details Mster DaTa

-- Created By		: Ashok Kumar.S

-- Client		: ENBD

-- Created On		: 01-11-2011
-------------------------------------------------------------------

load data
truncate into table V5PF
fields terminated by x'09'
TRAILING NULLCOLS
(
   V5BRNM,
   V5DLP,
   V5DLR,
   V5TDT,
   V5ABD,
   V5AND,
   V5ASD,
   V5DIC,
   V5CCY,
   V5ACT,
   V5DTEF,
   V5DTEH,
   V5ABI,
   V5ANI,
   V5ASI,
   V5II22,
   V5II23,
   V5II27,
   V5STM,
   V5STNL,
   V5IIF3,
   V5BAL,
   V5II53,
   V5IID0,
   V5CR1,
   V5CR2,
   V5IDB,
   V5MDT,
   V5IFQ,
   V5LCD,
   V5NCD,
   V5RFQ,
   V5LRE,
   V5NRD,
   V5II77,
   V5AIM,
   V5AM1,
   V5AM2,
   V5IM1,
   V5IM2,
   V5IM3,
   V5IIM,
   V5IM4,
   V5IM5,
   V5AM4,
   V5PRV,
   V5PL1,
   V5PL2,
   V5BRR,
   V5DRR,
   V5RAT,
   V5RTM,
   V5SPR,
   V5PEG,
   V5IIG6,
   V5YFWD,
   V5ARC,
   V5AM5,
   V5RTD,
   V5PRC,
   V5PEN,
   V5CSW,
   V5DLM,
   V5APR,
   V5APRR,
   V5IIFD,
   V5IBFD,
   V5VAFD,
   V5YLNP,
   V5POOL,
   V5FIM2,
   V5BIM2,
   V5RCAL,
   V5SCC,
   V5EXC,
   V5HSW,
   V5DAYS,
   V5RCCY,
   V5RNUM,
   V5RDDY,
   V5PCDI,
   V5MINR,
   V5MAXR,
   V5PDTE,
   V5IM6,
   V5IM7,
   V5IM8,
   V5IM9,
   V5BM6,
   V5FM6,
   V5BM9,
   V5FM9
)

