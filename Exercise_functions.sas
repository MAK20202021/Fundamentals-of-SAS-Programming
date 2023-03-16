***********************************************************;
*  Activity 4.05                                          *;
*    1) Open the PG1.STORM_RANGE table and examine the    *;
*       columns. Notice that each storm has four wind     *;
*       speed measurements.                               *;
*    2) Create a new column named WindAvg that is the     *;
*       mean of Wind1, Wind2, Wind3, and Wind4.           *;
*    3) Create a new column WindRange that is the range   *;
*       of Wind1, Wind2, Wind3, and Wind4.                *;
***********************************************************;
libname PG1 base "/home/u63305039/EPG1V2/data";

/*new column with different fuctions*/
data storm_wingavg;
	set pg1.storm_range;
	*Add assignment statements;
	WindAvg = Mean(Wind1,Wind2,Wind3,Wind4);
	WindRange = RANGE(Wind1,Wind2,Wind3,Wind4);
run;


data storm_new;
	set pg1.storm_summary;
	Basin=upcase(Basin);
	Name=propcase(Name);
	Hemisphere=cats(Hem_NS,Hem_EW);
	Ocean=substr(Basin,2,1);
run;
