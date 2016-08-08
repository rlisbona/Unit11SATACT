# Unit11SATACT
Repository for Unit 11 - Messy data import and merge

Assignment step 1, create a dataset scavanged from web sources for the pre-assigned variables.  Variable assignments by student are located in https://github.com/rlisbona/Unit11SATACT/tree/master/Analysis/Clean 00EducationAssignments.xlsx 
This file also includes some descriptive data about each dataset such as fieldnames, and SAS code to import.

16 datasets were available to immport as of 2016/08/07

Assignment step 2, combine the scavanged data with the assignment dataset dataset1.sas7bdat
Note: for the most part, no two import datasets could use the same code, causing lots of extra SAS code to clean it up and format before merging.  It is somewhat suspicious to find so many differences in just our small sample of 17 datasets, almost like someone planned for this to be a challenging assignment :)

Import issues: Merge is case sensative, incoming data in varying capitilization modes, mix of statenames and state abbreviations in the data, extra locations found in the datasets that were not in dataset1 (anything not matching were excluded). Different interpretations on how to represent a percent, is it (34.5%   34.5  .345) Some datasets had comments before the header row or after the data rows, or missing headers, or wrong variable names, States had spaces as a prefix.  Superscript included in header row (SAS doesn't care for this).  It was an interesting assignment, but more time consuming than expected.

Directories:
  
  \Analysis = SAS code to import and merge the ACTSAT data with the percent of HS students in private schools
  
      \Source = Data downloaded from http://factfinder.census.gov/bkmk/table/1.0/en/ACS/14_1YR/C14002/0100000US.04000
  
      \Clean = Subset of source data for my variable "Percent Private Schools"
              Files provided in .CSV, .XLSM, .XLS for compatiblity purposes.
              Include overall count and percentage of Total students, public students, private students for 
              Secondary (grades 9-12) and undergraduate college
  
      \SASdatasets = SAT ACT data given with the assignment
  
      \Stage4Import = The 16 datasets imported.  The numeric Prefix for each dataset corresponds to the row number of the variable in the 00EducationAssignment file.
      
      \Output\RLISBONA_SATACT_WEEK11.csv = combined output dataset.
