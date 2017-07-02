medcalc<-function(x){
  median<-median(x,na.rm = TRUE)
}
tapply(BrewBeers$State, BrewBeers$ABV,medcalc)
tapply(na.omit(BrewBeers$State), na.omit(BrewBeers$IBU),medcalc)
