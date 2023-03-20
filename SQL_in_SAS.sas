libname PG1 base "/home/u63305039/EPG1V2/data";

title "Most Costly Storms";
proc sql;
	select Event, cost format=dollar16., year(Date) as Season
	from pg1.storm_damage
	where Cost>25000000000
	order by Cost desc;
quit;
