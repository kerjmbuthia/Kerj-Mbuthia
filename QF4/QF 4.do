* Loading my data.
webuse m1gdp.dta
** Declaring it is time series data.
tsset  t
** Testing for non-stationarity.
dfuller  ln_m1
dfuller ln_gdp
*** Generating differenced variable and testing for non-stationarity.
gen dln_m1= ln_m1-l.ln_m1
gen dln_gdp= ln_gdp-l.ln_gdp
dfuller dln_m1
dfuller dln_gdp
*Box Jenkins Methodology
** Identification.
ac dln_m1, lags(12)
pac dln_m1, lags(12)
ac dln_gdp, lags(12)
pac dln_gdp, lags(12)
** Estimation and diagnostic checking
*** dln_m1
arima dln_m1, arima(1,0,0)
predict resm11, residuals
lmalb  resm11, lags(12)
clear 
webuse m1gdp.dta
tsset t
gen dln_m1= ln_m1-l.ln_m1
arima dln_m1, arima(2,0,0)
predict resm12, residuals
lmalb  resm12, lags(12)
clear 
webuse m1gdp.dta
tsset t
gen dln_m1= ln_m1-l.ln_m1
arima dln_m1, arima(3,0,0)
predict resm13, residuals
lmalb  resm13, lags(12)
clear 
webuse m1gdp.dta
tsset t
gen dln_m1= ln_m1-l.ln_m1
arima dln_m1, arima(4,0,0)
predict resm14, residuals
lmalb  resm14, lags(12)
clear 
webuse m1gdp.dta
tsset t
gen dln_m1= ln_m1-l.ln_m1
arima dln_m1, arima(5,0,0)
predict resm15, residuals
lmalb  resm15, lags(12)
clear 
webuse m1gdp.dta
tsset t
gen dln_m1= ln_m1-l.ln_m1
arima dln_m1, arima(6,0,0)
predict resm16, residuals
lmalb  resm16, lags(12)
clear 
webuse m1gdp.dta
tsset t
gen dln_m1= ln_m1-l.ln_m1
arima dln_m1, arima(8,0,0)
predict resm18, residuals
lmalb  resm18, lags(12)
*** dln_gdp
clear 
webuse m1gdp.dta
tsset t
gen dln_gdp= ln_gdp-l.ln_gdp
arima dln_gdp, arima(0,0,1)
predict resgdp1, residuals
lmalb  resgdp1, lags(12)
clear 
webuse m1gdp.dta
tsset t
gen dln_gdp= ln_gdp-l.ln_gdp
arima dln_gdp, arima(0,0,2)
predict resgdp2, residuals
lmalb  resgdp2, lags(12)
clear 
webuse m1gdp.dta
tsset t
gen dln_gdp= ln_gdp-l.ln_gdp
arima dln_gdp, arima(0,0,5)
predict resgdp5, residuals
lmalb  resgdp5, lags(12)
clear 
webuse m1gdp.dta
tsset t
gen dln_gdp= ln_gdp-l.ln_gdp
arima dln_gdp, arima(1,0,0)
predict resgdp11, residuals
lmalb  resgdp11, lags(12)
clear 
webuse m1gdp.dta
tsset t
gen dln_gdp= ln_gdp-l.ln_gdp
arima dln_gdp, arima(12,0,0)
predict resgdp12, residuals
lmalb  resgdp12, lags(12)
** Model complexity evaluation
*** dln_m1
clear 
webuse m1gdp.dta
tsset t
gen dln_m1= ln_m1-l.ln_m1
arima dln_m1, arima(1,0,0)
estat ic
clear 
webuse m1gdp.dta
tsset t
gen dln_m1= ln_m1-l.ln_m1
arima dln_m1, arima(2,0,0)
estat ic
clear 
webuse m1gdp.dta
tsset t
gen dln_m1= ln_m1-l.ln_m1
arima dln_m1, arima(3,0,0)
estat ic
clear 
webuse m1gdp.dta
tsset t
gen dln_m1= ln_m1-l.ln_m1
arima dln_m1, arima(4,0,0)
estat ic
clear 
webuse m1gdp.dta
tsset t
gen dln_m1= ln_m1-l.ln_m1
arima dln_m1, arima(5,0,0)
estat ic
clear 
webuse m1gdp.dta
tsset t
gen dln_m1= ln_m1-l.ln_m1
arima dln_m1, arima(6,0,0)
estat ic
clear 
webuse m1gdp.dta
tsset t
gen dln_m1= ln_m1-l.ln_m1
arima dln_m1, arima(8,0,0)
estat ic
*** dln_gdp
clear 
webuse m1gdp.dta
tsset t
gen dln_gdp= ln_gdp-l.ln_gdp
arima dln_gdp, arima(0,0,1)
estat ic
clear 
webuse m1gdp.dta
tsset t
gen dln_gdp= ln_gdp-l.ln_gdp
arima dln_gdp, arima(0,0,2)
estat ic
clear 
webuse m1gdp.dta
tsset t
gen dln_gdp= ln_gdp-l.ln_gdp
arima dln_gdp, arima(0,0,5)
estat ic
clear 
webuse m1gdp.dta
tsset t
gen dln_gdp= ln_gdp-l.ln_gdp
arima dln_gdp, arima(1,0,0)
estat ic
clear 
webuse m1gdp.dta
tsset t
gen dln_gdp= ln_gdp-l.ln_gdp
arima dln_gdp, arima(12,0,0)
estat ic
** Forecasting
** dln_m1
clear 
webuse m1gdp.dta
tsset t
gen dln_m1= ln_m1-l.ln_m1
arima dln_m1, arima(2,0,0)
predict gdln_m1, y
twoway (line dln_m1 t) (line gdln_m1 t)
** dln_gdp
clear 
webuse m1gdp.dta
tsset t
gen dln_gdp= ln_gdp-l.ln_gdp
arima dln_gdp, arima(1,0,0)
predict gdln_gdp, y
twoway (line dln_gdp t) (line gdln_gdp t)



