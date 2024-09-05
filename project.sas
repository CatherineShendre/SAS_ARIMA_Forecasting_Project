FILENAME REFFILE '/home/u63750051/Project/AIRTEL.csv';

PROC IMPORT DATAFILE=REFFILE DBMS=CSV OUT=AIRTEL;
	GETNAMES=YES;
RUN;

proc sort data=AIRTEL;
	by Date;
run;

FILENAME REFFILE '/home/u63750051/Project/APOLLOHOSP.csv';

PROC IMPORT DATAFILE=REFFILE DBMS=CSV OUT=APOLLOHOSP;
	GETNAMES=YES;
RUN;

proc sort data=APOLLOHOSP;
	by Date;
run;

FILENAME REFFILE '/home/u63750051/Project/BPCL.csv';

PROC IMPORT DATAFILE=REFFILE DBMS=CSV OUT=BPCL;
	GETNAMES=YES;
RUN;

proc sort data=BPCL;
	by Date;
run;

FILENAME REFFILE '/home/u63750051/Project/CIPLA.csv';

PROC IMPORT DATAFILE=REFFILE DBMS=CSV OUT=CIPLA;
	GETNAMES=YES;
RUN;

proc sort data=CIPLA;
	by Date;
run;

FILENAME REFFILE '/home/u63750051/Project/DABUR.csv';

PROC IMPORT DATAFILE=REFFILE DBMS=CSV OUT=DABUR;
	GETNAMES=YES;
RUN;

proc sort data=DABUR;
	by Date;
run;

FILENAME REFFILE '/home/u63750051/Project/DMART.csv';

PROC IMPORT DATAFILE=REFFILE DBMS=CSV OUT=DMART;
	GETNAMES=YES;
RUN;

proc sort data=DMART;
	by Date;
run;

FILENAME REFFILE '/home/u63750051/Project/DRREDDY.csv';

PROC IMPORT DATAFILE=REFFILE DBMS=CSV OUT=DRREDDY;
	GETNAMES=YES;
RUN;

proc sort data=DRREDDY;
	by Date;
run;

FILENAME REFFILE '/home/u63750051/Project/EXPEDIA.csv';

PROC IMPORT DATAFILE=REFFILE DBMS=CSV OUT=EXPEDIA;
	GETNAMES=YES;
RUN;

proc sort data=EXPEDIA;
	by Date;
run;

FILENAME REFFILE '/home/u63750051/Project/GODREJPROP.csv';

PROC IMPORT DATAFILE=REFFILE DBMS=CSV OUT=GODREJPROP;
	GETNAMES=YES;
RUN;

proc sort data=GODREJPROP;
	by Date;
run;

FILENAME REFFILE '/home/u63750051/Project/HCLTECH.csv';

PROC IMPORT DATAFILE=REFFILE DBMS=CSV OUT=HCLTECH;
	GETNAMES=YES;
RUN;

proc sort data=HCLTECH;
	by Date;
run;

FILENAME REFFILE '/home/u63750051/Project/INDIAN_OIL.csv';

PROC IMPORT DATAFILE=REFFILE DBMS=CSV OUT=INDIAN_OIL;
	GETNAMES=YES;
RUN;

proc sort data=INDIAN_OIL;
	by Date;
run;

FILENAME REFFILE '/home/u63750051/Project/INDIGO.csv';

PROC IMPORT DATAFILE=REFFILE DBMS=CSV OUT=INDIGO;
	GETNAMES=YES;
RUN;

proc sort data=INDIGO;
	by Date;
run;

FILENAME REFFILE '/home/u63750051/Project/JETAIRWAYS.csv';

PROC IMPORT DATAFILE=REFFILE DBMS=CSV OUT=JETAIRWAYS;
	GETNAMES=YES;
RUN;

proc sort data=JETAIRWAYS;
	by Date;
run;

FILENAME REFFILE '/home/u63750051/Project/META.csv';

PROC IMPORT DATAFILE=REFFILE DBMS=CSV OUT=META;
	GETNAMES=YES;
RUN;

proc sort data=META;
	by Date;
run;

FILENAME REFFILE '/home/u63750051/Project/MHRIL.csv';

PROC IMPORT DATAFILE=REFFILE DBMS=CSV OUT=MHRIL;
	GETNAMES=YES;
RUN;

proc sort data=MHRIL;
	by Date;
run;

FILENAME REFFILE '/home/u63750051/Project/M_M.csv';

PROC IMPORT DATAFILE=REFFILE DBMS=CSV OUT=M_M;
	GETNAMES=YES;
RUN;

proc sort data=M_M;
	by Date;
run;

FILENAME REFFILE '/home/u63750051/Project/NFLX.csv';

PROC IMPORT DATAFILE=REFFILE DBMS=CSV OUT=NFLX;
	GETNAMES=YES;
RUN;

proc sort data=NFLX;
	by Date;
run;

FILENAME REFFILE '/home/u63750051/Project/OBEROIRLTY.csv';

PROC IMPORT DATAFILE=REFFILE DBMS=CSV OUT=OBEROIRLTY;
	GETNAMES=YES;
RUN;

proc sort data=OBEROIRLTY;
	by Date;
run;

FILENAME REFFILE '/home/u63750051/Project/RCOMMUNICATION.csv';

PROC IMPORT DATAFILE=REFFILE DBMS=CSV OUT=RCOMMUNICATION;
	GETNAMES=YES;
RUN;

proc sort data=RCOMMUNICATION;
	by Date;
run;

FILENAME REFFILE '/home/u63750051/Project/RINDUSTRIES.csv';

PROC IMPORT DATAFILE=REFFILE DBMS=CSV OUT=RINDUSTRIES;
	GETNAMES=YES;
RUN;

proc sort data=RINDUSTRIES;
	by Date;
run;

FILENAME REFFILE '/home/u63750051/Project/SPICEJET.csv';

PROC IMPORT DATAFILE=REFFILE DBMS=CSV OUT=SPICEJET;
	GETNAMES=YES;
RUN;

proc sort data=SPICEJET;
	by Date;
run;

FILENAME REFFILE '/home/u63750051/Project/TAJGVK.csv';

PROC IMPORT DATAFILE=REFFILE DBMS=CSV OUT=TAJGVK;
	GETNAMES=YES;
RUN;

proc sort data=TAJGVK;
	by Date;
run;

FILENAME REFFILE '/home/u63750051/Project/TCS.csv';

PROC IMPORT DATAFILE=REFFILE DBMS=CSV OUT=TCS;
	GETNAMES=YES;
RUN;

proc sort data=TCS;
	by Date;
run;

FILENAME REFFILE '/home/u63750051/Project/ZEEL.csv';

PROC IMPORT DATAFILE=REFFILE DBMS=CSV OUT=ZEEL;
	GETNAMES=YES;
RUN;

proc sort data=ZEEL;
	by Date;
run;

FILENAME REFFILE '/home/u63750051/Project/ZOOM.csv';

PROC IMPORT DATAFILE=REFFILE DBMS=CSV OUT=ZOOM;
	GETNAMES=YES;
RUN;

proc sort data=ZOOM;
	by Date;
run;

/*CHANGE OF FORMAT IN EXCHANGERATE*/
data ExchangeRate;
	SET myfiles.ExchangeRate;
	format date ddmmyy10.;
run;

/*FOR META*/
data META;
	set META;
	format Date ddmmyy10.;
	informat Date ddmmyy10.;
run;

data META;
	merge META ExchangeRate;
RUN;

proc sql;
	create table META as select *, Close * Price as Close_INR from META;
quit;

proc export data=META outfile='/home/u63750051/Project/New Folder/META.xlsx' 
		dbms=xlsx replace;
run;

/*FOR NETFLIX*/
data NETFLIX;
	SET NFLX;
	drop price;
	format date ddmmyy10.;
	informat Date ddmmyy10.;
run;

data Netflix;
	merge NETFLIX ExchangeRate;
RUN;

proc sql;
	create table Netflix as select *, Close * Price as Close_INR from Netflix;
quit;

proc export data=Netflix 
		outfile='/home/u63750051/Project/New Folder/Netflix.xlsx' dbms=xlsx replace;
run;

/*for ZOOM*/
data zoom;
	SET zoom;
	format date ddmmyy10.;
	informat Date ddmmyy10.;
	drop Price;
run;

data zoom;
	merge zoom ExchangeRate;
	drop price;
RUN;

proc sql;
	create table zoom as select *, Close * Price as Close_INR from zoom;
quit;

proc export data=zoom outfile='/home/u63750051/Project/New Folder/zoom.xlsx' 
		dbms=xlsx replace;
run;

/*FINAL MERGED DATASET IMPORT*/
proc sort data=myfiles.Dataset;
	by Name;
run;

data DataFrame;
	SET myfiles.Dataset;
	informat Date date9.;
run;

ods rtf file="/home/u63750051/Project/New Folder/okayyy.rtf";

/*summery of data*/
proc means data=dataframe;
	var Close;
	class Name;
run;

PROC CORR DATA=dataframe;
	VAR Close date;
run;

PROC univariate DATA=dataframe;
	VAR Close date;
	class Name;
run;

/* Plot close prices */
proc sgplot data=DataFrame;
	by Name;
	ods graphics on / width=10.25in outputfmt=gif imagemap=on 
		imagename="MyBoxplot" border=off;
	title 'Historical Closing Price Of The Stock';
	series x=Date y=Close / markers;
	xaxis label='Date' interval=Month;
	yaxis label='Close Prices';
run;

proc export data=DataFrame 
		outfile='/home/u63750051/Project/New Folder/plots.xlsx' dbms=xlsx replace;
run;

/* density function estimation */
proc kde data=DataFrame;
	by Name;
	univar Close / plots=density;
run;

proc sgplot data=DataFrame;
	by Name;
	series x=Date y=Close / lineattrs=(thickness=2);
	scatter x=Date y=Open / group=Name markerattrs=(symbol=circleFilled) 
		transparency=0.7;
	scatter x=Date y=Low / group=Name markerattrs=(symbol=barDownFilled) 
		transparency=0.7;
	scatter x=Date y=High / group=Name markerattrs=(symbol=barUpFilled) 
		transparency=0.7;
	xaxis label="Date" interval=month labelattrs=(color=blue);
	yaxis label="Price";
	keylegend / position=topright;
run;

/* Run Augmented Dickey-Fuller (ADF) Test */
PROC ARIMA DATA=DataFrame;
	by Name;
	IDENTIFY VAR=Close STATIONARITY=(ADF);
	RUN;
QUIT;

proc sort data=dataframe;
	by Name;
run;

/* Step 2: Estimate ARIMA Models and Generate Forecasts */
proc arima data=DataFrame;
	by Name;
	identify var=Close(2);
	estimate p=2 q=2 method=ml;
	forecast lead=12 id=Date interval=month out=forecast_out;

	/* Corrected forecast statement */
	run;

	/* Output Results */
proc export data=forecast_out;
	outfile='forecasted_data.csv';
	dbms=csv replace;
run;

/* Create Graphs */
proc sgplot data=Forecast_out;
	by Name;
	series x=Date y=Close / lineattrs=(color=blue);
	series x=Date y=FORECAST / lineattrs=(color=red pattern=dash);
	format Date date9.;
	title 'Historical Prices with Forecasted Values';
	keylegend / location=inside position=topright;
run;

ods rtf close;