libname PG1 base "/home/u63305039/EPG1V2/data";
libname out "/home/u63305039/EPG1V2/output"; 

data out.fox;
    set pg1.np_species;
    where Category='Mammal' and Common_Names contains "Fox" 
          and Common_Names not contains "Squirrel";    
    drop Category Record_Status Occurrence Nativeness;
run;

proc sort data=out.fox;
	by Common_Names;
run;

*value of the first row of Common_Names is Arctic Fox