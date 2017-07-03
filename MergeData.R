######################
## R make-like File
## Damarcus Thomas
## Created July 2 2017
## Case Study 1
######################


library(readr)
Beers <- read_csv("C:/Users/146st/R_Project_Repo/CaseStudy01/Data/Beers.csv")
View(Beers)
Brew_ID<-Beers$Brewery_id
colnames(Beers)[5]<-"Brew_ID"
View(Beers)
BrewBeers <- merge(x = Beers, y = Breweries, by = "Brew_ID", all = TRUE)
View(BrewBeers)