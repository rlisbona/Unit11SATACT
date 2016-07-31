* Rlisbona MSDS 6306 Unit 11 ACTSAT data;
*;
* Create library ACTSAT;
libname ACTSAT "\\client\c$\Users\anobs\Documents\GitHub\Unit11SATACT\Analysis\SASdatasets";
run;
* Rename the input file;
Data Stats;
Set ACTSAT.dataset1;
run;

proc print data = Stats (obs=52);
run;
*******************************************************************************************************************************************;
* Open a file of state codes and state names, may not need this after all;
proc import datafile= "\\client\c$\Users\anobs\Documents\GitHub\Unit11SATACT\Analysis\Clean\StateCodesClean.csv" out = statecodes 
dbms=csv replace;
guessingrows = 59 ;
getnames = yes; 
run;

data statecodes (drop= var4);
set statecodes;
run;

proc print data = statecodes;
run;
*******************************************************************************************************************************************;
* Import the percentage of students in private schools file;
proc import datafile= "\\client\c$\\Users\anobs\Documents\GitHub\Unit11SATACT\Analysis\Clean\2014PublicPrivateSchoolsClean.xls" out = PrivateSchools
dbms=xls replace;
datarow=2;
guessingrows = 50 ;
getnames = yes; 
run;
* See what is in it
*proc print data = PrivateSchools;
*run;

* Keep only the fields we need;
data PrivateSchoolsPct;
set PrivateSchools;
keep State HS_Pct_Private;
run;
proc print data = PrivateSchoolsPct;
run;
*********************************************************************************************************************************************;
* sort the data so we can merge to two tables;
proc sort data = Stats;
by State;
proc sort data = PrivateSchoolsPct;
by state;
run;
***********************************************************************************************************************************************;
* Merge them;
data combined;
merge Stats PrivateSchoolsPct;
by state;
run;

proc print data = combined;
run;

