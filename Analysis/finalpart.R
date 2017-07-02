




# 4. Compute the median alcohol content and international bitterness unit for each state. Plot
# a bar chart to compare.


MedABV<-aggregate( ABV ~ State, data=BrewBeers, FUN=median)
MedABV
ABV_PLOT<-ggplot(na.omit(MedABV), aes(x=reorder(State, ABV), y=ABV)) + geom_bar(stat="identity")+ coord_flip()
ABV_PLOT

# The bar chart above for median alcohol content by state indicates that most of the stated are abve 0.05
# with Kentucky, Washington DC, New Mexico and West Virginia crossing 0.06

MedIBU<-aggregate( IBU ~ State, data=BrewBeers, FUN=median)
MedIBU
IBU_PLOT<-ggplot(na.omit(MedIBU), aes(x=reorder(State, IBU), y=IBU)) + geom_bar(stat="identity") + coord_flip()
IBU_PLOT

# The bar chart above for median international bitterness unit by state indicates that Maine and West Virginia 
# are the top 2 states having the highest median bitterness unit beers, with Floria and Georgia next in line

#5.Which state has the maximum alcoholic beer? Which state has the most bitter beer?

# State that has maximum alcoholic beer
BrewBeers[which.max(BrewBeers$ABV), ]$State
BrewBeers[which.max(BrewBeers$ABV), ]$ABV

# Colorado seems to be having the highest alcoholic beer with an ABV rating of 0.128

# State that has most bitter beer
BrewBeers[which.max(BrewBeers$IBU), ]$State
BrewBeers[which.max(BrewBeers$IBU), ]$IBU


# 7. Is there a relationship between the bitterness of the beer and its alcoholic content? 
# Draw a scatter plot.

ggplot(na.omit(BrewBeers), aes(x=ABV, y=IBU)) + geom_point() 

pr <- cor.test(BrewBeers$ABV, BrewBeers$IBU, method = "pearson")
pr