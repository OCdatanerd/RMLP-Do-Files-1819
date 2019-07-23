


** Reverse code items
replace pss4= 4-pss4
replace pss5= 4-pss5
replace pss7= 4-pss7
replace pss8= 4-pss8
replace asri1= 4-asri1
replace asri2= 4-asri2
forv i 5/8 {
	replace asri`i'= 4-asri`i'
	}

forv i 12/16 {
	replace asri`i'= 4-asri`i'
	}
	
forv i 12/16 {
	replace asri`i'= 4-asri`i'
	}
	
replace asri18= 4-asri18
replace asri19= 4-asri19
replace asri21= 4-asri21
replace asri34= 4-asri34
replace asri35= 4-asri35
replace pgh5= 4-pgh5

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

