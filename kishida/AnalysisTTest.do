
use "C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Spring\Working Folder\Student Files\StataFiles\072419_survey_all.dta", clear

*creat scales

egen pss_pre= rowtotal(pss1_pre-pss10_pre)
egen pss_post= rowtotal(pss1_post-pss10_post)
sumscale, f1( asri1_pre-asri36_pre)
rename Factor1_average asri_pre
sumscale, f1( asri1_post-asri36_post)
rename Factor1_average asri_post
egen pgh_pre= rowtotal( pgh1_pre-pgh7_pre)
egen pgh_post= rowtotal( pgh1_post-pgh7_post)
sumscale, f1(sam1_pre-sam11_pre)
rename Factor1_average sam_pre
sumscale, f1(sam1_post-sam11_post)
rename Factor1_average sam_post
sumscale, f1(srq1_pre-srq13_pre)
rename Factor1_average srq_pre
sumscale, f1( srq1_post-srq13_post)
rename Factor1_average srq_post
egen psq_pre= rowtotal(psq1_pre-psq19_pre)
egen psq_post= rowtotal(psq1_post-psq19_post)

log using "C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\RMLP Do Files 1819\kishida\LogFiles\StudentFallTTestResults", replace

ttest pss_post==pss_pre if survey=="A"
ttest asri_post==asri_pre if survey=="A"
ttest pgh_post==pgh_pre if survey=="A"

ttest sam_post==sam_pre if survey=="B"
ttest srq_post==srq_pre if survey=="B"
ttest pgh_post==pgh_pre if survey=="B"

ttest sam_post==sam_pre if survey=="BE"
ttest srq_post==srq_pre if survey=="BE"
ttest pgh_post==pgh_pre if survey=="BE"

ttest psq_post==psq_pre if survey=="C"
ttest srq_post==srq_pre if survey=="C"
ttest pgh_post==pgh_pre if survey=="C"

ttest psq_post==psq_pre if survey=="D"
ttest pgh_post==pgh_pre if survey=="D"

log close
