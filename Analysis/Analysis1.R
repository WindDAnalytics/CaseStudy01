######################
## Analysis1 File
## Damarcus Thomas
## Created July 2 2017
## Case Study 1
######################

#Import Function from R Studio Default code, this is the raw Breweries csv
library(readr)
Breweries <- read_csv("C:/Users/146st/R_Project_Repo/CaseStudy01/Data/Breweries.csv")
View(Breweries)
#Handy function that gives the details of the data
str(Breweries)
#List the # of Breweries by States
table(Breweries$State)  

#Import Function from R Studio Default code, this is the raw Beer csv
Beers <- read_csv("C:/Users/146st/R_Project_Repo/CaseStudy01/Data/Beers.csv")
View(Beers)

Brew_ID<-Beers$Brewery_id
colnames(Beers)[5]<-"Brew_ID"
View(Beers)
BrewBeers <- merge(x = Beers, y = Breweries, by = "Brew_ID", all = TRUE)
View(BrewBeers)
head(BrewBeers)
tail(BrewBeers)
summary(BrewBeers)
