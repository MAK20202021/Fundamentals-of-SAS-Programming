libname PG1 base "/home/u63305039/EPG1V2/data";
ods noproctitle;
title "Weather Statistics by Year and Park";
proc means data=pg1.np_westweather mean max min maxdec=2;
	var Precip Snow TempMin TempMax;
	class Year Name;
	*ways 1;
run;
ods proctitle;

ods noproctitle;
title "Weather Statistics";
proc means data=pg1.np_westweather noprint;
	var Precip;
	where Precip ne 0;
	class Name Year;
	output out= rainstats N=RainDays SUM=TotalRain; 
	ways 2;
run;
ods proctitle;

ods noproctitle;
title "Rain Statistics by Year and Park";
proc print data=rainstats noobs label;
	var Name Year RainDays TotalRain;
	label Name="Park Name"
		RainDays ="Number of Days Raining"
		TotalRain = "Total Rain Amount (inches)";
run;
ods proctitle;