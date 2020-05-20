# removes anything already in the global environment
rm(list=ls()) 

# Set the working directory
setwd("~/module5/github_folder")

# load necessary package 
library(ggplot2) 


mers <- read.csv('cases.csv')

## Formatting some dates

head(mers)
class(mers$onset)

mers$hospitalized[890] <- c('2015-02-20')
mers <- mers[-471,]
library(lubridate)
mers$onset2 <- ymd(mers$onset)
mers$hospitalized2 <- ymd(mers$hospitalized)
class(mers$onset2)

day0 <- min(na.omit(mers$onset2))

day0_na_included <- min(mers$onset2) # get first day of epidemic
mers$epi.day <- as.numeric(mers$onset2 - day0) # create a column to associate with day since epi began



# create a plot of some of the data
ggplot(data=mers) + 
  geom_bar(mapping=aes(x=epi.day)) +
  labs(x='Epidemic day', y='Case count', title='Global count of MERS cases by date of symptom onset',
       caption="Data from: https://github.com/rambaut/MERS-Cases/blob/gh-pages/data/cases.csv")






