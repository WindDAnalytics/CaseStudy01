######################
## Analysis2 File
## Damarcus Thomas
## Created July 2 2017
## Case Study 1
######################


#First the Acohol by Volume State and Amount
BrewBeers[which.max(BrewBeers$ABV), ]$State
BrewBeers[which.max(BrewBeers$ABV), ]$ABV



#Scattered Plot
ggplot(na.omit(BrewBeers), aes(x=ABV, y=IBU)) + geom_point()

# Pearson r correlation 
rcorr <- cor.test(BrewBeers$ABV, BrewBeers$IBU, method = "pearson")
rcorr
