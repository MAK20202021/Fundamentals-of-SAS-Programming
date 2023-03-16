libname PG1 base "/home/u63305039/EPG1V2/data";

/*Creating One-way Frequency Report*/
ods noproctitle;
title "Categories of Reported Species";
title2 "In the Everglades";

proc freq data=pg1.np_species order=freq;
	tables Category/nocum plots=freqplot(orient=horizontal);
	where Species_ID like "EVER%" and Category not contains 'Vascular Plant';
run;

ods proctitle;

/*Creating Two-way Frequency Report*/
ods noproctitle;
title "Park Types by Region";
proc freq data=pg1.np_codelookup order=freq;
	tables Type*Region/nocol;
	where Type not contains 'Other';
run;
ods proctitle;

/*Considering highest three parks*/

ods noproctitle;
title "Park Types by Region";
proc freq data=pg1.np_codelookup order=freq;
	tables Type*Region/nocol crosslist 
	plots = freqplot(orient=horizontal groupby=row scale=grouppercent);
	where Type in ('National Historic Site','National Monument','National Park');
run;
ods proctitle;