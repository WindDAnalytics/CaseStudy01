######################
## Merge File
## Damarcus Thomas
## Created July 2 2017
## Case Study 1
######################

# We have to make sure that the raw Beers file has the right column so that we can merge on it!
library(readr)
Beers <- read_csv("C:/Users/146st/R_Project_Repo/CaseStudy01/Data/Beers.csv")
View(Beers)
# It looks cleaner to change the Brewery_id to Brew_ID and now they both have the same variable name.
Brew_ID<-Beers$Brewery_id
colnames(Beers)[5]<-"Brew_ID"

View(Beers)
#Now its official time to utilize the merge function and name it BrewBeers!
BrewBeers <- merge(x = Beers, y = Breweries, by = "Brew_ID", all = TRUE)
#Making sure the merge was successful
View(BrewBeers)
#Printing the first and last six rows to make sure the merge was a success again!
head(BrewBeers)
tail(BrewBeers)

summary(BrewBeers)
#This handy function gives a summary of the data including # of NA's 
