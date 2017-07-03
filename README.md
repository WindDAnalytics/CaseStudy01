---
title: "README"
author: "D Thomas"
date: "July 2, 2017"
output: html_document
---
# Case Study : Sample Beer Study

## Author: D. Thomas, Section 405

***
### Introduction:

The Sample Beer Case Study is designed and developed to understand and shed light on the relationship or correlation, if any, of the two variables IBU vs. ABV, that is, International Bitterness Units of a certain Beer vs. Alcohol by Volume of the certain Beer. This Study samples from various Breweries throughout the United States. 

* Below there will be answers to specific questions with sample code with explanation for every question written in R.

***

### File Organization:

Resembles the following Model:

![](https://github.com/WindDAnalytics/CaseStudy01/blob/master/Img/FileOrganization.png)


* Modifications
* Additional Docs

***
### Questions:

#### 1. How many Breweries are  present in each state?

```{r echo=FALSE}
library(readr)
Breweries <- read_csv("C:/Users/146st/R_Project_Repo/CaseStudy01/Data/Breweries.csv")
View(Breweries)
str(Breweries)
table(Breweries$State)  

```

The table(Breweries$State) command gives the values of Breweries in each State

***

#### 2. Merge beer data with breweries data by Brewery ID. Print first 6 observations and the last six observations to check the merged file.

```{r echo=FALSE}
library(readr)
Beers <- read_csv("C:/Users/146st/R_Project_Repo/CaseStudy01/Data/Beers.csv")
View(Beers)
Brew_ID<-Beers$Brewery_id
colnames(Beers)[5]<-"Brew_ID"
View(Beers)
BrewBeers <- merge(x = Beers, y = Breweries, by = "Brew_ID", all = TRUE)
View(BrewBeers)
head(BrewBeers)
tail(BrewBeers)
```

***

#### 3. Report the number of NA's in each column.

```{r echo=FALSE}
summary(BrewBeers)
```
We see that two columns have NA's ABV and IBU, which is 62 and 1005 respectively.

***

#### 4. Compute the median alcohol content and international bitterness unit for each state. Plot a bar graph to compare.

```{r echo=FALSE}
require(ggplot2)
MedIBU<-aggregate( IBU ~ State, data=BrewBeers, FUN=median)
IBU_PLOT<-ggplot(na.omit(MedIBU), aes(x=reorder(State, IBU), y=IBU)) + geom_bar(stat="identity") + coord_flip()
IBU_PLOT
#First the IBU and now the ABV conversion
MedABV<-aggregate( ABV ~ State, data=BrewBeers, FUN=median)
ABV_PLOT<-ggplot(na.omit(MedABV), aes(x=reorder(State, ABV), y=ABV)) + geom_bar(stat="identity")+ coord_flip()
ABV_PLOT
```
Here are the Charts:
![](https://github.com/WindDAnalytics/CaseStudy01/blob/master/Img/abvplot.png)
![](https://github.com/WindDAnalytics/CaseStudy01/blob/master/Img/abvplot.png)
<insert><insert>

***

#### 5. Which state has the maximum alcoholic beer? Which stae has the most bitter beer?

```{r echo=FALSE}
#First the Acohol by Volume State and Amount
BrewBeers[which.max(BrewBeers$ABV), ]$State
BrewBeers[which.max(BrewBeers$ABV), ]$ABV
#Next the International Bitterness Unit of Beer by State and Unit
BrewBeers[which.max(BrewBeers$IBU), ]$State
BrewBeers[which.max(BrewBeers$IBU), ]$IBU
```

***

#### 6. Summary statistics for ABV (Alcohol by volume) variable.
```{r echo=FALSE}
# Five point summary including # of NA's and the Mean.
summary(BrewBeers$ABV)
```

***

#### 7. Is there a relationship between the bitterness of the beer and its alcoholic content? Draw a scatter plot?
```{r echo=FALSE}
#Scattered Plot
ggplot(na.omit(BrewBeers), aes(x=ABV, y=IBU)) + geom_point()

# Pearson r correlation 
rcorr <- cor.test(BrewBeers$ABV, BrewBeers$IBU, method = "pearson")
rcorr
```
![](https://github.com/WindDAnalytics/CaseStudy01/blob/master/Img/scatterplotabv.ibu.png)

This result shows a moderatly postive correlation between the two variables IBU and ABV.
