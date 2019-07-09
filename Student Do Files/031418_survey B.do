
** Reverse score items

gen rpgh5= 4-pgh5

forv i = 6/8 {
	gen rsrq`i' = 4- srq`i'
	}

order rsrq6-rsrq8, after(srq8)
order rpgh5, after(pgh5)
drop (srq6-srq8)
drop pgh5
rename r* *

** Remove Duplicates
gen lstu_id= lower(stu_id)
order lstu_id, after(stu_id)
drop stu_id
rename lstu_id stu_id
duplicates drop stu_id teach_id, force


** Add Suffix
rename (sam1-pgh7)=_pre
rename (sam1-pgh7)=_post


** Merge
use "C:\Users\drochman\Dropbox (OCDE)\Job Files\RMLP\Data Files\SY 2017-18\Fall\Student Merge\031418_Survey B_premerge.dta"
merge 1:1 stu_id teach_id using "C:\Users\drochman\Dropbox (OCDE)\Job Files\RMLP\Data Files\SY 2017-18\Fall\Student Merge\031418_Survey B_postmerge.dta"
keep if _merge==3

** Make Scales
sumscale, f1(sam1_pre-sam11_pre)
rename Factor1_average sam_pre
sumscale, f1(sam1_post-sam11_post)
rename Factor1_average sam_post
sumscale, f1(srq1_pre-srq13_pre)
rename Factor1_average srq_pre
sumscale, f1( srq1_post-srq13_post)
rename Factor1_average srq_post
egen pgh_pre= rowtotal(pgh1_pre-pgh7_pre)
egen pgh_post= rowtotal(pgh1_post-pgh7_post)
order (sam_pre-srq_post), after(fluent)

** Analysis
ttest sam_post==sam_pre
ttest srq_post==srq_pre
ttest pgh_post==pgh_pre

tab gender
tab age
tab ethnic
