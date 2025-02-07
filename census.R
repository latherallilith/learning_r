library(ggplot2)

census <- read.csv('census.csv')


head(census)

apply(census, 2, range)

numericals <- sapply(census, is.numeric)
numericals_atts <- names(numericals[numericals==TRUE])

#range of numerical attributes

apply(census[, numericals_atts],2, range)
apply(census[, numericals_atts],2, sd)

ggplot(census)+geom_point(aes(x=TotalPop, y=Employed))+ggtitle("Population vs Employed")+ylab("Employment per Population")
#select only numerical columns
num_census <- census[, numericals_atts]
#define normalization function
normalise <- function(x) {(x-min(x))/(max(x)-min(x))}

census.norm <- as.data.frame(apply(num_census, 2, normalise))
apply(census.norm, 2, range)
#standardize data
census.stand <- as.data.frame(scale(num_census))
apply(census.stand, 2, mean)
