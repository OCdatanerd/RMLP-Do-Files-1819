

** Reverse Code Value
replace pgh5= 4-pgh5

forv i = 6/8 {
	replace qsr`i' = 4- qsr`i'
	}


** Remove Duplicates
gen lstu_id= lower(stu_id)
order lstu_id, after(stu_id)
drop stu_id
rename lstu_id stu_id
duplicates drop stu_id, force


**Suffix
rename (psq1-pgh7)=_pre
rename (psq1-pgh7)=_post


** Merge

keep if _merge==3

** Create Scales
egen psq_pre= rowtotal(psq1_pre-psq19_pre)
egen psq_post= rowtotal(psq1_post-psq19_post)

sumscale, f1(srq1_pre-srq13_pre)
rename Factor1_average srq_pre
sumscale, f1(srq1_post-srq13_post)
rename Factor1_average srq_post

egen pgh_pre= rowtotal(pgh1_pre-pgh7_pre)
egen pgh_post= rowtotal(pgh1_post-pgh7_post)
order (psq_pre-pgh_post), after(fluent)


** Analysis
ttest psq_post==psq_pre
ttest srq_post==srq_pre
ttest pgh_post==pgh_pre

tab gender
tab age
tab ethnic
