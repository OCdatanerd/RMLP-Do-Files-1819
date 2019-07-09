
** Reverse Score Values

forv i = 10/16 {
	replace bif`i'= 6-bif`i'
	}

forv i = 10/16 {
	replace bis`i'= 7-bif`i'
	}
	
forv i = 1/3 {
	replace pss`i'= 4-pss`i'
	}
replace pss6= 4-pss6

forv i = 9/10 {
	replace pss`i'= 4-pss`i'
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


** Clean for Analysis
drop (maa1-pgh10)
gen STRESS= (pss+tsif+tsis)/3
sumscale, f1(bif-bis)
rename Factor1_average BURN
order(STRESS-BURN), after(PGH)
drop (pss tsif tsis bif bis)
keep if _merge==3
order(STRESS-BURN), after(PGH)
rename (MAA-BURN)=2
order(STRESS-BURN), after(PGH)
rename (MAA-BURN)=3

drop _merge



** Analysis

gen id=_n
reshape long MAA PGH STRESS BURN, i(id) j(period)


