*This do.file cleans and summarizes the 6 month implimentation survey conducted for the fall 2018 cohort.

import delimited "C:\Users\s.KIshida\Dropbox (OCDE)\RMLP\Data Files\SY 2018-19\Fall\Working Folder\Teach\Excel Files\080519_6month_implementation_f18.csv", varnames(1) clear 

*use the value of the second row as a value lable

foreach x of varlist _all {
   label var `x' `"`=`x'[1]'"'
        }
		
drop in 1

*delete the observation that didn't finish the survey
drop if finished=="FALSE"

*count the number of cases with different key words
replace q6 = lower(q6)
gen breath =  strpos(q6, "breath") > 0
gen bodyscan = strpos(q6, "body scan") > 0
replace bodyscan=1 if strpos(q6, "bodyscan") > 0
gen meditation = strpos(q6, "medita") > 0
gen relax = strpos(q6, "relax")>0
gen music = strpos(q6, "music")>0
replace music=1 if strpos(q6, "sound")>0
replace music=1 if strpos(q6, "chime")>0
gen visualization = strpos(q6, "visual")>0

tab q14
tab breath if q14=="Yes"
tab bodyscan  if q14=="Yes"
tab meditation if q14=="Yes"
tab relax if q14=="Yes"
tab music if q14=="Yes"

tab q7 if q14=="Yes"
tab q8 if q14=="Yes"

tab q9

*count the number of cases with different key words

replace q11 = lower(q11)
gen breath1 =  strpos(q11, "breath") > 0
gen bodyscan1 = strpos(q11, "body scan") > 0
replace bodyscan1=1 if strpos(q11, "bodyscan") > 0
gen meditation1 = strpos(q11, "medita") > 0
gen relax1 = strpos(q11, "relax")>0
gen music1 = strpos(q11, "music")>0
replace music1=1 if strpos(q11, "sound")>0
replace music1=1 if strpos(q11, "chime")>0
gen mindful1 = strpos(q11, "mindful walking") > 0
replace mindful1=1 if strpos(q11, "mindful eating") >0
replace mindful1=1 if strpos(q11, "mindful coloring") >0
gen mindfulgame1=strpos(q11, "mindful game")>0
replace mindfulgame1=1 if strpos(q11, "mindful card")>0
gen visualization1 = strpos(q11, "visual")>0
gen noodle = strpos(q11, "noodle")>0

tab breath1
tab bodyscan1
tab meditation1
tab relax1
tab music1
tab mindful1
tab mindfulgame1
tab visualization1

tab q12
tab q13
tab q17



