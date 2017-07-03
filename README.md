---
title: "README"
author: "D Thomas"
date: "July 2, 2017"
output: html_document
---
# Case Study : Sample Beer Study

## Author: D. Thomas, Section 405
> ##### Contents
> * Introduction
> * File Organization
> * Questions
> * Conclusion
***
### Introduction:

The Sample Beer Case Study is designed and developed to understand and shed light on the relationship or correlation, if any, of the two variables IBU vs. ABV, that is, International Bitterness Units of a certain Beer vs. Alcohol by Volume of the certain Beer. This Study samples from various Breweries throughout the United States. 

***

### File Organization:

Resembles the following Model:

![](https://github.com/WindDAnalytics/CaseStudy01/blob/master/Analysis/Img/FileOrganization.png)


* Images contained in a subdirectory of Data called Img
* Description of all known variables contained in the Data directory as a markdown file.

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
The table(Breweries$State) command gives the values of Breweries in each State:

AK AL AR AZ CA CO CT DC DE FL GA HI IA ID IL IN KS KY LA MA MD ME MI MN MO MS MT NC ND NE NH NJ NM NV NY OH OK OR PA RI SC 
 7  3  2 11 39 47  8  1  2 15  7  4  5  5 18 22  3  4  5 23  7  9 32 12  9  2  9 19  1  5  3  3  4  2 16 15  6 29 25  5  4 
SD TN TX UT VA VT WA WI WV WY 
 1  3 28  4 16 10 23 20  1  4 

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
Here's the head of the output of the merge data set, first 6 rows!

  Brew_ID        Name.x Beer_ID   ABV IBU                               Style Ounces            Name.y        City State
1       1  Get Together    2692 0.045  50                        American IPA     16 NorthGate Brewing Minneapolis    MN
2       1 Maggie's Leap    2691 0.049  26                  Milk / Sweet Stout     16 NorthGate Brewing Minneapolis    MN
3       1    Wall's End    2690 0.048  19                   English Brown Ale     16 NorthGate Brewing Minneapolis    MN
4       1       Pumpion    2689 0.060  38                         Pumpkin Ale     16 NorthGate Brewing Minneapolis    MN
5       1    Stronghold    2688 0.060  25                     American Porter     16 NorthGate Brewing Minneapolis    MN
6       1   Parapet ESB    2687 0.056  47 Extra Special / Strong Bitter (ESB)     16 NorthGate Brewing Minneapolis    MN

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
![](https://github.com/WindDAnalytics/CaseStudy01/blob/master/Analysis/Img/ibuplot.png)

![](https://github.com/WindDAnalytics/CaseStudy01/blob/master/Analysis/Img/abvplot.png)

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
> BrewBeers[which.max(BrewBeers$ABV), ]$State
[1] "CO"
> BrewBeers[which.max(BrewBeers$ABV), ]$ABV
[1] 0.128
> BrewBeers[which.max(BrewBeers$IBU), ]$State
[1] "OR"
> BrewBeers[which.max(BrewBeers$IBU), ]$IBU
[1] 138

***

#### 6. Summary statistics for ABV (Alcohol by volume) variable.
```{r echo=FALSE}
# Five point summary including # of NA's and the Mean.
summary(BrewBeers$ABV)
```
> summary(BrewBeers$ABV)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
0.00100 0.05000 0.05600 0.05977 0.06700 0.12800      62 

***

#### 7. Is there a relationship between the bitterness of the beer and its alcoholic content? Draw a scatter plot?
```{r echo=FALSE}
#Scattered Plot
ggplot(na.omit(BrewBeers), aes(x=ABV, y=IBU)) + geom_point()

# Pearson r correlation 
rcorr <- cor.test(BrewBeers$ABV, BrewBeers$IBU, method = "pearson")
rcorr
```
![](https://github.com/WindDAnalytics/CaseStudy01/blob/master/Analysis/Img/scatterplotabv.ibu.png)

This result shows a moderatly postive correlation between the two variables IBU and ABV.

>rcorr <- cor.test(BrewBeers$ABV, BrewBeers$IBU, method = "pearson")
>rcorr

	Pearson's product-moment correlation

data:  BrewBeers$ABV and BrewBeers$IBU
t = 33.863, df = 1403, p-value < 2.2e-16
alternative hypothesis: true correlation is not equal to 0
95 percent confidence interval:
 0.6407982 0.6984238
sample estimates:
      cor 
0.6706215 

***

### Conclusion

The Sample Brewery Beer Case Study is considered an Observational Study. Although there is evidence of a positive correlation between taste of bitterness and strength of alcohol beverage, we cannot use our study to infer anything about the broader scope of the relationship between IBU and ABV. Perhaps one can go out and try it for oneself, since people do have different tastes buds and tolerance to certain levels of Alcohol, and their own opinions on the matter.  
