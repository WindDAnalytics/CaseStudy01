######################
## R make-like File
## Damarcus Thomas
## Created July 2 2017
## Case Study 1
######################

### Note - this source code pretty much does everything, it puts the pieces together
### It's just an example of source code file structure

# Set working directory

setwd("/CaseStudy01/Analysis/Data")

# Gather and cleanup raw data files
# Each *.R file below gathers data from a different source
# and cleans the data

source("Analysis1.R")
source("Analysis2.R")

# Merge cleaned data frames into data frame object CleanedData
# Creates .csv file and a codebook in .md

source("MergeData.R")
