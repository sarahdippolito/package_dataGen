

#install.packages("pryr")
require(pryr)
require(ISLR)
require(boot)
library(data.table)
#install.packages("plyr")
library(plyr)
Students <- read.table('/Users/sarahdippolito/Documents/Assignment 6 Dataset.txt', header=TRUE, sep=",")
Students

Students_Table = ddply(Students,"Sex",transform, Grade.Average=mean(Grade))
Students_Table

write.table(Students_Table, "Sorted_Average")

write.table(Students_Table, "Sorted_Average", sep=",")

new_Students = subset(Students, grepl("[iI]", Students$Name))

write.table(new_Students, "DataSubset", sep=",")