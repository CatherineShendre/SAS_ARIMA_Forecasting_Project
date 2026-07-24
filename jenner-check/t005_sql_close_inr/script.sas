/* CatherineShendre/SAS_ARIMA_Forecasting_Project — Project_Code.sas
 * FX-conversion stage: merge a USD/INR Price onto a USD-quoted stock, then
 * compute Close_INR = Close * Price via PROC SQL (as done for META/Netflix/Zoom).
 * Values supplied inline (originally an ExchangeRate table + imported CSV). */

data META;
    informat Date ddmmyy10.;
    format  Date ddmmyy10.;
    input Date Close;
    datalines;
01/01/2020 210.50
01/02/2020 201.91
01/03/2020 166.80
01/04/2020 204.71
01/05/2020 224.15
01/06/2020 227.07
;
run;

data ExchangeRate;
    informat Date ddmmyy10.;
    format  Date ddmmyy10.;
    input Date Price;
    datalines;
01/01/2020 71.38
01/02/2020 71.53
01/03/2020 74.38
01/04/2020 76.24
01/05/2020 75.63
01/06/2020 75.51
;
run;

data META;
    merge META ExchangeRate;
    by Date;
run;

proc sql;
    create table META as select *, Close * Price as Close_INR from META;
quit;

proc print data=META;
    title 'META close price converted to INR';
run;
