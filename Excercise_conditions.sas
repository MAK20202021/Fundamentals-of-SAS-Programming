libname PG1 base "/home/u63305039/EPG1V2/data";

data parks monuments;
	set pg1.np_summary;
	where Type='NP' or Type='NM';
	Campers = sum(TentCampers,RVCampers,BackcountryCampers);
	format Campers comma7.;
	length ParkType $ 8;
	if Type='NM' then do;
		ParkType='Monument';
		output monuments;
	end;

	else if Type='NP' then do;
		ParkType='Park';
		output parks;
	end;
	keep Reg ParkName DayVisits OtherLodging Campers ParkType;
run;