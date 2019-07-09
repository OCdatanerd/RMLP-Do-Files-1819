
** Remove Duplicates
gen lstu_id= lower(stu_id)
order lstu_id, after(stu_id)
drop stu_id
rename lstu_id stu_id
duplicates drop stu_id teach_id, force


**Suffix
rename (psq1-pgh7)=_pre
rename (psq1-pgh7)=_post




** Merge
use "C:\Users\drochman\Dropbox (OCDE)\Job Files\RMLP\Data Files\SY 2017-18\Fall\Student Merge\031418_Survey D_premerge.dta"
merge 1:1 stu_id teach_id using "C:\Users\drochman\Dropbox (OCDE)\Job Files\RMLP\Data Files\SY 2017-18\Fall\Student Merge\031418_Survey D_postmerge.dta"
keep if _merge==3


** Create Scales
egen psq_pre= rowtotal(psq1_pre-psq19_pre)
egen psq_post= rowtotal(psq1_post-psq19_post)


egen pgh_pre= rowtotal(pgh1_pre-pgh7_pre)
egen pgh_post= rowtotal(pgh1_post-pgh7_post)
order (psq_pre-pgh_post), after(fluent)

ttest psq_post==psq_pre
ttest pgh_post==pgh_pre

tab gender
tab age
tab ethnic
