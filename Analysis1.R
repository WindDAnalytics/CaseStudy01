######################
## Analysis1 File
## Damarcus Thomas
## Created July 2 2017
## Case Study 1
######################


library(readr)
Breweries <- read_csv("C:/Users/146st/R_Project_Repo/CaseStudy01/Data/Breweries.csv")
View(Breweries)
str(Breweries)
table(Breweries$State)  


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