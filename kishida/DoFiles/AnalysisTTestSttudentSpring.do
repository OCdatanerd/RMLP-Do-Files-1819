
*First, I am merging pre and post for each survey, only keeping those that are matched pairs. ************************************************************

use "C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Spring\Working Folder\Student Files\StataFiles\072319_survey A_pre.dta", clear
merge 1:1 teach_id lstu_id using "C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Spring\Working Folder\Student Files\StataFiles\072319_survey A_Post.dta"
keep if _merge==3
save "C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Spring\Working Folder\Student Files\StataFiles\temp\072319_survey A.dta", replace

use "C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Spring\Working Folder\Student Files\StataFiles\072319_survey B_pre.dta", clear
merge 1:1 teach_id lstu_id using "C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Spring\Working Folder\Student Files\StataFiles\072319_survey B_Post.dta"
keep if _merge==3
save "C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Spring\Working Folder\Student Files\StataFiles\temp\072319_survey B.dta", replace

use "C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Spring\Working Folder\Student Files\StataFiles\072319_survey BE_pre.dta", clear
merge 1:1 teach_id lstu_id using "C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Spring\Working Folder\Student Files\StataFiles\072319_survey BE_Post.dta"
keep if _merge==3
save "C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Spring\Working Folder\Student Files\StataFiles\temp\072319_survey BE.dta", replace

use "C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Spring\Working Folder\Student Files\StataFiles\072319_survey C_pre.dta", clear
merge 1:1 teach_id lstu_id using "C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Spring\Working Folder\Student Files\StataFiles\072319_survey C_Post.dta"
keep if _merge==3
save "C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Spring\Working Folder\Student Files\StataFiles\temp\072319_survey C.dta", replace

use "C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Spring\Working Folder\Student Files\StataFiles\072319_survey D_pre.dta", clear
merge 1:1 teach_id lstu_id using "C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Spring\Working Folder\Student Files\StataFiles\072319_survey D_Post.dta"
keep if _merge==3
save "C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Spring\Working Folder\Student Files\StataFiles\temp\072319_survey D.dta", replace

*Finally, I append five surveys************************************************************************************************************************************

use "C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Spring\Working Folder\Student Files\StataFiles\temp\072319_survey A.dta", replace

#delimit;
append using "C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Spring\Working Folder\Student Files\StataFiles\temp\072319_survey B.dta" 
"C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Spring\Working Folder\Student Files\StataFiles\temp\072319_survey BE.dta" 
"C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Spring\Working Folder\Student Files\StataFiles\temp\072319_survey C.dta" 
"C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Spring\Working Folder\Student Files\StataFiles\temp\072319_survey D.dta", generate(temp1);

#delimit cr;

*creating a variable that indicates which survey the data come from.
gen survey="A"
replace survey="B" if temp1==1
replace survey="BE" if temp1==2
replace survey="C" if temp1==3
replace survey="D" if temp1==4

drop temp* _merge

*remove the students who took the wrong surveys
drop if grade!=6 & survey=="BE"
drop if grade!=5 & survey=="C"
drop if grade!=4 & survey=="D"

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

log using "C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\RMLP Do Files 1819\kishida\LogFiles\StudentSpringTTestResults", text replace

*sample size
tab survey,m

* *demographics
tab gender if survey=="A", m
tab gender if survey=="B", m
tab gender if survey=="BE", m
tab gender if survey=="C", m
tab gender if survey=="D", m

tab gender grade if survey=="A", col
tab gender grade if survey=="B", col

tab age if survey=="A", m
tab age if survey=="B", m
tab age if survey=="BE", m
tab age if survey=="C", m
tab age if survey=="D", m


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


