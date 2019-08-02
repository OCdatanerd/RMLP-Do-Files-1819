duplicates drop stu_id, force
gen lstu_id= lower(stu_id)
order lstu_id, after(stu_id)
drop stu_id
rename lstu_id stu_id

** Survey A
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

** Analysis
tab gender
tab age
tab ethnic
ttest pss_post==pss_pre
ttest asri_post==asri_pre
ttest pgh_post==pgh_pre

** Survey B
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
tab gender
tab age
tab ethnic
ttest sam_post==sam_pre
ttest srq_post==srq_pre
ttest pgh_post==pgh_pre

**Survey BE
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
tab gender
tab age
tab ethnic
ttest sam_post==sam_pre
ttest srq_post==srq_pre
ttest pgh_post==pgh_pre

** Survey C
egen psq_pre= rowtotal(psq1_pre-psq19_pre)
egen psq_post= rowtotal(psq1_post-psq19_post)

sumscale, f1(qsr1_pre-qsr13_pre)
rename Factor1_average qsr_pre
sumscale, f1(qsr1_post-qsr13_post)
rename Factor1_average qsr_post

egen pgh_pre= rowtotal(pgh1_pre-pgh7_pre)
egen pgh_post= rowtotal(pgh1_post-pgh7_post)
order (psq_pre-pgh_post), after(fluent)


** Analysis
tab gender
tab age
tab ethnic
ttest psq_post==psq_pre
ttest qsr_post==qsr_pre
ttest pgh_post==pgh_pre

** Survey D
egen psq_pre= rowtotal(psq1_pre-psq19_pre)
egen psq_post= rowtotal(psq1_post-psq19_post)


egen pgh_pre= rowtotal(pgh1_pre-pgh7_pre)
egen pgh_post= rowtotal(pgh1_post-pgh7_post)
order (psq_pre-pgh_post), after(fluent)


** Analysis
tab gender
tab age
tab ethnic
ttest psq_post==psq_pre
ttest pgh_post==pgh_pre

