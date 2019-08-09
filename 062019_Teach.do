
** Reverse Score Values

forv i = 10/16 {
	replace bif`i'= 6-bif`i'
	}

forv i = 10/16 {
	replace bis`i'= 7-bis`i'
	}

** For LDA
forv i = 1/3 {
	replace pss`i'= 4-pss`i'
	}
replace pss6= 4-pss6

forv i = 9/10 {
	replace pss`i'= 4-pss`i'
	}

** For Difference in Means Testing
forv i = 4/5 {
	gen pss`i'_post2= 4-pss`i'
	}

forv i = 7/8 {
	gen pss`i'= 4-pss`i'
	}

	

** Correct for Entry

forv i = 1/21 {
	replace bis`i' = 7 if bif`i' ==6
	}
	**
forv i = 1/34 {
	replace tsis`i' = 5 if tsif`i' ==6
	}

	
** Create subscales

egen pss = rowtotal( pss1-pss10)
egen tsif = rowtotal( tsif1-tsif34)
egen tsis = rowtotal( tsis1-tsis34)
egen PGH = rowtotal( pgh1-pgh10)
sumscale, f1( maa1- maa10) f2( bif1-bif21) f3( bis1-bis21)
rename Factor1_average MAA 
rename Factor2_average bif 
rename Factor3_average bis
order pss tsif tsis MAA bif bis PGH , after(vet2)
order pss tsif tsis MAA bif bis PGH , after(BURN1)
order pss tsif tsis MAA bif bis PGH , after(BURN2)
encode gender_birth, gen(gender)
order gender, after(gender_birth)
drop gender_birth 
encode orient, gen(orienti)
order orienti, after(orient)
drop orient
rename orienti orient 

** Clean for Analysis
drop (maa1-pgh10)
gen STRESS= (pss+tsif+tsis)/3
sumscale, f1(bif-bis)
rename Factor1_average BURN
order(STRESS-BURN), after(teach_id)
drop (pss tsif tsis bif bis)
keep if _merge==3
order(STRESS-BURN), after(PGH)
rename (MAA-BURN)=1
order(MAA STRESS BURN), after(teach_id)
rename (MAA-PGH)=2
order(STRESS-BURN), after(PGH)
rename (STRESS-PGH)=3

drop _merge



** Analysis

gen id=_n
reshape long MAA PGH STRESS BURN, i(id) j(period)
order id, after (teach_id)

** First Pass
reg PGH	MAA STRESS gender orient i.period, vce(cluster id)	
reg PGH STRESS gender orient i.period, vce(cluster id) 
reg PGH MAA gender orient i.period, vce(cluster id)	
reg STRESS MAA gender orient i.period, vce(cluster id)	
reg BURN MAA gender orient i.period, vce(cluster id)	


** T-Tests
ttest MAA2==MAA1
ttest MAA3==MAA1
ttest STRESS2==STRESS1
ttest STRESS3==STRESS1 
ttest BURN2==BURN1
ttest BURN3==BURN1
ttest PGH2==PGH1
ttest PGH3==PGH1

** Putdocx

putdocx begin