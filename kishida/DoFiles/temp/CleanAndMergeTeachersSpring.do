*Cleaning each data file************************************************************************************************************************************
*Pretest****************************************************************************************************************************************************
import delimited "C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Spring\Working Folder\Teacher\Excel files\073019_teach_pre_sp19.csv", clear 
gen period==1
save "C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Spring\Working Folder\Teacher\Stata files\073019_teach_pre_sp19.dta", replace

import delimited "C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Spring\Working Folder\Teacher\Excel files\073019_teach_post_sp19.csv", clear 
gen period==2
save "C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Spring\Working Folder\Teacher\Stata files\073019_teach_pre_post.dta", replace

import delimited "C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Spring\Working Folder\Teacher\Excel files\073019_teach_post2_sp19.csv", clear 
gen period==3
save "C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Spring\Working Folder\Teacher\Stata files\073019_teach_post2_sp19.dta", replace


****************UNDER CONSTRUCTION***********************************************************************************************************************
gen id=_n
reshape long MAA PGH STRESS BURN, i(id) j(period)



forv i = 10/16 {
	replace bif`i'= 7-bif`i'
	}
	
forv i = 10/16 {
	replace bis`i'= 8-bis`i'
	}
	
forv i = 1/21 {
	replace bis`i' = 7 if bif`i' ==6
	}
	**
forv i = 1/34 {
	replace tsis`i' = 5 if tsif`i' ==6
	}
