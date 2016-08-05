#############################################################################################
### Challenge 1: Find the sum of the positive elements of a (slide No: 35 )
##############################################################################################
a <- c(2,3,-1,3,5,2,-3,1)

sum(a[a>0])

##############################################################################################
### Challenge 2: Extract the elements in red (slide No: 48)
##############################################################################################
a <- matrix(1:20, ncol=4)

a[c(3,5),c(2,4)]

##############################################################################################
## Challenge 3: read a csv file add 1 line to it and write it to a csv file (slide 107)
#############################################################################################
data1 <- read.csv("data1.csv", nrows = -1, header = TRUE)

data2 <- rbind(data1, c(21,135,11.8,69,9,31))
nrow(data1)
nrow(data2)
write.csv(data2, file="data2.csv", quote=FALSE, row.names = FALSE)

#############################################################################################
## Challenge 4: Count the number of days  when Temp is more than 65 for the month of May
## and June (slide No: 145)
############################################################################################
data1 <- read.csv("data1.csv", nrows = -1, header = TRUE)

data.month <- subset(data1, Month<7)
data.month.temp <- data.month$Temp
a = 0
for (i in data.month.temp) {
  if (i >65) { a = a +1}
}
print(a)

## method 2
sum((data1$Month == 5 | data1$Month == 6) & data1$Temp > 65)

## method 3
nrow(subset(data1, (Month==5 | Month==6) & Temp > 65 ))


#############################################################################################
# challenge 5: simulate the sum of two die roll (slide No: 159)
###########################################################################################
dieSum <- function(){
  die1 <- sample(1:6, size = 1)
  die2 <- sample(1:6, size = 1)
  die1 + die2
}

dieSum()

######################################################################
# Challenge: Find the correlation among variables of quakes dataset 
# slide no (169)
####################################################################
cor(quakes)

######################################################################
# Challenge 6: Do a 2 sample t-test to compare the performance of 
# chickwts feed - casein vs horsebean (slide no: 188)
#####################################################################
chickwts1 <- subset(chickwts,feed == "casein" | feed == "horsebean")
t.test(weight ~ feed, data = chickwts1)


###############################################################################
# Challenge 7: Perform an ANOVA to determine any difference between the test scores 
# of 3 teaching methods (Slide No: 193)
################################################################################
A <- c(79,86,94,89)
B <- c(71,77,81,83)
C <- c(82,68,70,76)
scores = c(A,B,C)
groups <- factor(rep(letters[1:3],each=4))
D <- data.frame(scores,groups)
boxplot(scores~groups,data=D)
D.aov <- aov(scores~groups, data=D)
summary(D.aov)

TukeyHSD(D.aov)
tapply(D$scores, D$groups, mean)



