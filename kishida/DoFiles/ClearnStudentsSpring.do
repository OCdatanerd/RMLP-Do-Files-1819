*This do file cleans each individual file for all students' survey conducted in spring******************************************************************************

*First, I am cleaning each survey file, which include reverse coding, renaming variables, and idendifying and dropping duplicates**************************************
*Survey A (pre)****************************************************************************************************************************************************
import delimited "C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Spring\Working Folder\Student Files\Student Pre\072319_Survey A_pre_sp19.csv", clear


** Reverse code items
replace pss4= 4-pss4
replace pss5= 4-pss5
replace pss7= 4-pss7
replace pss8= 4-pss8

replace asri1=4-asri1
replace asri2=4-asri2

forv i=5/8 {
	replace asri`i'= 4-asri`i'
	}

forv i=12/16 {
	replace asri`i'= 4-asri`i'
	}
	
replace asri18= 4-asri18
replace asri19= 4-asri19
replace asri21= 4-asri21
replace asri34= 4-asri34
replace asri35= 4-asri35

replace pgh5=6-pgh5

** Name data
rename(pss1-pgh7)=_pre


** identify Duplicates
gen lstu_id= lower(stu_id)
duplicates tag teach_id lstu_id, generate(temp)
drop if temp!=0

save "C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Spring\Working Folder\Student Files\StataFiles\072319_survey A_pre.dta", replace

*Survey B(pre)****************************************************************************************************************************************************
import delimited "C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Spring\Working Folder\Student Files\Student Pre\072319_Survey B_pre_sp19.csv", clear

** Reverse score items

replace pgh5= 6-pgh5

forv i = 6/8 {
	replace srq`i' = 5-srq`i'
	}

** Remove Duplicates
gen lstu_id= lower(stu_id)
duplicates tag teach_id lstu_id, generate(temp)
drop if temp!=0

** Add Suffix
rename (sam1-pgh7)=_pre

save "C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Spring\Working Folder\Student Files\StataFiles\072319_survey B_pre.dta", replace

*Survey BE(pre)****************************************************************************************************************************************************

import delimited "C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Spring\Working Folder\Student Files\Student Pre\072319_Survey BE_pre_sp19.csv", clear

** Reverse score items

replace pgh5=6-pgh5

forv i = 6/8 {
	replace srq`i' = 5-srq`i'
	}

** Remove Duplicates
gen lstu_id= lower(stu_id)
duplicates tag teach_id lstu_id, generate(temp)
drop if temp!=0

** Add Suffix
rename (sam1-pgh7)=_pre

save "C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Spring\Working Folder\Student Files\StataFiles\072319_survey BE_pre.dta", replace

*Survey C(pre)****************************************************************************************************************************************************

import delimited "C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Spring\Working Folder\Student Files\Student Pre\072319_Survey C_pre_sp19.csv", clear


** Reverse Code Value
replace pgh5=6-pgh5
	
forv i = 6/8 {
	replace srq`i' = 5-srq`i'
	}

	
** Remove Duplicates
gen lstu_id= lower(stu_id)
duplicates tag teach_id lstu_id, generate(temp)
drop if temp!=0

**Suffix
rename (psq1-pgh7)=_pre

save "C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Spring\Working Folder\Student Files\StataFiles\072319_survey C_pre.dta", replace


*Survey D(pre)****************************************************************************************************************************************************
import delimited "C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Spring\Working Folder\Student Files\Student Pre\072319_Survey D_pre_sp19.csv", clear

replace pgh5=6-pgh5

** Remove Duplicates
gen lstu_id= lower(stu_id)
duplicates tag teach_id lstu_id, generate(temp)
drop if temp!=0

**Suffix
rename (psq1-pgh7)=_pre

save "C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Spring\Working Folder\Student Files\StataFiles\072319_survey D_pre.dta", replace


*Survey A (post)****************************************************************************************************************************************************

import delimited "C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Spring\Working Folder\Student Files\Student Post\072319_Survey A_Post_sp19.csv", clear

** Reverse code items
replace pss4= 4-pss4
replace pss5= 4-pss5
replace pss7= 4-pss7
replace pss8= 4-pss8

replace asri1=4-asri1
replace asri2=4-asri2

forv i=5/8 {
	replace asri`i'= 4-asri`i'
	}

forv i=12/16 {
	replace asri`i'= 4-asri`i'
	}
	
replace asri18= 4-asri18
replace asri19= 4-asri19
replace asri21= 4-asri21
replace asri34= 4-asri34
replace asri35= 4-asri35

replace pgh5=6-pgh5

** Name data
rename(pss1-pgh7)=_post

** identify Duplicates
gen lstu_id= lower(stu_id)
duplicates tag teach_id lstu_id, generate(temp)
drop if temp!=0

save "C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Spring\Working Folder\Student Files\StataFiles\072319_survey A_Post.dta", replace

*Survey B (post)****************************************************************************************************************************************************
import delimited "C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Spring\Working Folder\Student Files\Student Post\072319_Survey B_Post_sp19.csv", clear
** Reverse score items

replace pgh5= 6-pgh5

forv i = 6/8 {
	replace srq`i' = 5-srq`i'
	}


** Remove Duplicates
gen lstu_id= lower(stu_id)
duplicates tag teach_id lstu_id, generate(temp)
drop if temp!=0

** Add Suffix
rename (sam1-pgh7)=_post

save "C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Spring\Working Folder\Student Files\StataFiles\072319_survey B_Post.dta", replace

*Survey BE (post)****************************************************************************************************************************************************
import delimited "C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Spring\Working Folder\Student Files\Student Post\072319_Survey BE_Post_sp19.csv", clear

** Reverse score items

replace pgh5=6-pgh5

forv i = 6/8 {
	replace srq`i' = 5-srq`i'
	}

** Remove Duplicates
gen lstu_id= lower(stu_id)
duplicates tag teach_id lstu_id, generate(temp)
drop if temp!=0

** Add Suffix
rename (sam1-pgh7)=_post

save "C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Spring\Working Folder\Student Files\StataFiles\072319_survey BE_Post.dta", replace


*Survey C (post)****************************************************************************************************************************************************

import delimited "C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Spring\Working Folder\Student Files\Student Post\072319_Survey C_Post_sp19.csv", clear

** Reverse Code Value

replace pgh5=6-pgh5

forv i = 6/8 {
	replace srq`i' = 5-srq`i'
	}
	
** Remove Duplicates
gen lstu_id= lower(stu_id)
duplicates tag teach_id lstu_id, generate(temp)
drop if temp!=0

**Suffix
rename (psq1-pgh7)=_post

save "C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Spring\Working Folder\Student Files\StataFiles\072319_survey C_Post.dta", replace

*Survey D (post)****************************************************************************************************************************************************

import delimited "C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Spring\Working Folder\Student Files\Student Post\072319_Survey D_Post_sp19.csv", clear

replace pgh5=6-pgh5

** Remove Duplicates
gen lstu_id= lower(stu_id)
duplicates tag teach_id lstu_id, generate(temp)
drop if temp!=0


**Suffix
rename (psq1-pgh7)=_post

save "C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Spring\Working Folder\Student Files\StataFiles\072319_survey D_Post.dta", replace

