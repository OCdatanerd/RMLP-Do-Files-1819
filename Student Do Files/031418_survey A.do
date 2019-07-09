


** Reverse code items
gen rpss4= 4-pss4
gen rpss5= 4-pss5
gen rpss7= 4-pss7
gen rpss8= 4-pss8
gen rasri1= 4-asri1
gen rasri2= 4-asri2
gen rasri5= 4-asri5
gen rasri6= 4-asri6
gen rasri7= 4-asri7
gen rasri8= 4-asri8
gen rasri12= 4-asri12
gen rasri13= 4-asri13
gen rasri14= 4-asri14
gen rasri15= 4-asri15
gen rasri16= 4-asri16
gen rasri18= 4-asri18
gen rasri19= 4-asri19
gen rasri21= 4-asri21
gen rasri34= 4-asri34
gen rasri35= 4-asri35
gen rpgh5= 4-pgh5


order(rpss4 rpss5), after(pss5)
order (rpss7 rpss8), after (pss8)
order rasri1-rasri2, after(asri2)
order rasri5-rasri8, after(asri9)
order rasri12-rasri16, after(asri16)
order rasri18-rasri19, after(asri19)
order rasri34-rasri35, after(asri35)
order rasri21, after(asri21)
order rpgh5, after(pgh5)
drop( pss4 pss5 pss7 pss8 asri1 asri2 asri5 asri6 asri7 asri8 asri12 asri13 asri14 asri15 asri16 asri18 asri19 asri21 asri34 asri35 pgh5)
rename r* *

** Name data
rename(pss1-pgh7)=_pre
rename(pss1-pgh7)=_post


** Remove Duplicates
gen lstu_id= lower(stu_id)
order lstu_id, after(stu_id)
drop stu_id
rename lstu_id stu_id
duplicates drop stu_id teach_id, force
duplicates drop stu_id, force



** Merge
use "C:\Users\drochman\Dropbox (OCDE)\Job Files\RMLP\Data Files\SY 2017-18\Fall\Student Merge\031418_Survey A_premerge.dta"
merge 1:1 stu_id teach_id using "C:\Users\drochman\Dropbox (OCDE)\Job Files\RMLP\Data Files\SY 2017-18\Fall\Student Merge\031418_Survey A_postmerge.dta"
keep if _merge==3

** Scales
egen pss_pre= rowtotal( pss1_pre-pss10_pre)
egen pss_post= rowtotal(pss1_post-pss10_post)
order(pss_pre pss_post), after(fluent)
sumscale, f1( asri1_pre-asri36_pre)
rename Factor1_average asri_pre
sumscale, f1( asri1_post-asri36_post)
rename Factor1_average asri_post
order (asri_pre asri_post), after(pss_post)
egen pgh_pre= rowtotal( pgh1_pre-pgh7_pre)
egen pgh_post= rowtotal( pgh1_post-pgh7_post)
order(pgh_pre pgh_post), after (asri_post)
tab gender
tab age
tab ethnic

** Tests
ttest pss_post==pss_pre
ttest asri_post==asri_pre
ttest pgh_post==pgh_pre

