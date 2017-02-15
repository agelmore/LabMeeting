##Code Review 2_16_17

As an exercise in problem solving and using dplyr, we will split into groups to create a plot summarizing thetaYC distances from my project. 


###Outline

+ Go through data frames and functions
+ Work on creating plot in groups
+ If time, discuss solution to other plots

###Groups

1) Matt + Geof

2) Nick + Marc

3) Pat + Charlie + Kaitlin


###File summary

1) metadata 
	+ Each independent sample from colonization study
	+ Donors: 10 total; 6 human (2 are split into A and B experiments), 1 mouse, 1 soil
	+ Eartags/cages: 61 total, 3-5 per cage, 1-2 cages per donor
	+ Days: sampled 21-25 days. Day 1 is first day after xenobiota introduced
	+ Donor.id - sample id of the donor associated with that mouse

2) functions
	+ load_Libraries 
	+ get_day1 and get_endpoints - input metadata data frame and eartag names, return vector of sample id for that mouse's last sample

3) dist.col
	+ Column formatted distance matrix
	+ One line with thetaYC every sample comparison, no repeats
	+ "label" and "comparison" are column headers with id names compared
	+ 1372 * 1371 / 2 = 940506

4) dist_to_endpoint.R
	+ Bare R script to make plot


###Exercise:

1) Calculate the average distance from donor to endpoint in each donor

2) Calculate standard error  

3) Produce a plot (dotplot, barplot, boxplot) showing average thetaYC in each donor

4) If time, also calculate:

	+ average distance donor to day 1

	+ average distance day 1 to endpoint

	+ average distance within a donor on day 1 

	+ average distance within a donor at endpoint

	+ average distance from each donor to other donors

	+ average distance from each endpoint to endpoints in other cages









