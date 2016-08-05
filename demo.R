## Clear the work space
rm(list=ls())

## As a calculator
1+2
3^2

####################################################################################
# variables
###################################################################################
## Variable Assignment
a <- 5
a = 3
1 -> a
b <- 9
x <- 2

## Operation with variables
a*b
a*x + b

## What variables are present
ls()

## Deleting variables from the workspace
rm(x)
ls()
rm(list=ls())
ls()

#######################################################################################
## Data Type
#######################################################################################

# 1. Number
######################################################################################
abs(-3.4)
round(3.45678, digits=3)
sqrt(4)
sin(pi/2)
3/0
Inf/Inf


# 2. Vectors
############################################################################################
### Creating Vector using : operator
a <- 0:10
a <- 5:13
a <- 10:-4

### creating vector using c operator
x <- c(1,2,4)
y <- c(1,7:9)
z <- c("red", "green", "yellow")
m <- c(1:5, 10.5, "red")

### Creating vectors using seq
x <- seq(10)
x <- seq(3,20)
x <- seq(3,20,3)
x <- seq(1,9, by = 2)
x <- seq(from=1, to = 5, by = 0.5)
y <- seq(from=1, to = 10, length.out = 10)

#### An application of seq
x <- seq(0,3*pi, length.out = 100)
y <- sin(x)
plot(x,y, type="o", col = "blue", cex = 0.5)

### Creating vector using rep
x <- rep(4, times=4)
x <- rep(c(4,3), times=4)
x <- rep(c(4,3), each = 4)

### Creating a vector using a combination of above methods
x <- c(seq(0,5,by=0.5), 1:5, rep(2,3), c(1,1,1))


### Accessing vector element
y <- 1:10

y[1]   # first element of the vector y
y[c(1,3,5)]   # first, third, and fifth element of vector  y

ind <- c(4,2)   
y[ind]         # Using index that is  a variable
y[-ind]        # all elements excepts the elements corresponding to ind location


ind <- y > 5   # Logical indexing
y[ind]         # All elements where y > 5 condition is true
y[!ind]        # All elements where y > 5 condition is false

x <- c(3:6,13)
ind <- y %in% x
y[ind]         # Only those values of y that are in x


head(y, n = 3) # First three elements
tail(y, n = 3) # Last 3 elements

max(y)         # Maximum value contained in vector y
min(y)         # Minimum value contained in vector y
which.max(y)   # Location of the maximum y value
which.min(y)   # Location of the minimum y value


### Challenge 1: Find the sum of the positive elements of a (slide No: 37)
a <- c(2,3,-1,3,5,2,-3,1)

### Dropping NA values
a <- c(3, -2, 4, NA, -1, 8, -4, 9, NA, 11, 3, 8, NA)
ind <- is.na(a)
a[!ind]

### Manipulating vectors
x <- c(1,2,1)
y <- c(3,2,4)
v <- x + y
v <- x - y

y <- c(3,2)
x+y    # uses recycling rule for calculation

### Vector arithmetic
a <- c(2,3,4,2,5,6)
mean(a)
median(a)
sum(a)
prod(a)
min(a)
max(a)
cumsum(a)
diff(a)

### Sorting vector element
v <- c(3,8,4,5,0,11,-9,304)
sort(v)
sort(v, decreasing = TRUE)

### summing a vector that has NA
v <- c(3,6,2,NA,1)
sum(v)
sum(v, na.rm=TRUE)
sum(v[!is.na(v)])

### Information about vector
v <- c(3,8,4,5,0,11,-9,304)
str(v)
summary(v)
class(v)


## 3. Matrix
###########################################################################################
### Different ways to create a matrix
matrix(1:12, ncol=4)
matrix(1:12, nrow=4)
matrix(1:12, ncol = 4, byrow = TRUE)

x <- 1:4
y <- 4:7

rbind(x,y)
cbind(x,y)

dim(x) <- c(2,2)

### Accessing matrix element
M <- matrix(1:12, ncol=4, byrow = TRUE)
M[1,2]                    # First row, second column
M[2,]                     # Second row
M[,3]                     # Third column
M[1:2, 3:4]               # row 1 to 2, column 3 to 4

rep(c(4,2), each=10)
rep(1:4, each = 3, times=4)

### Challenge 2: Extract the elements in red (slide No: 50)
a <- matrix(1:20, ncol=4)
a
a[c(3,5),c(2,4)]

### Manipulating matrix elements
M1 <- matrix(c(3,9,-1,4,2,6), nrow = 2)
M2 <- matrix(c(5,2,0,9,3,4), nrow = 2)
M1 + M2
M1 - M2

### Assigning row and column names
M <- matrix(c(3,9,-1,4,2,6), nrow=2)
rownames(M) <- c("row1", "row2")
colnames(M) <- c("col1", "col2", "col3")
M[1,]
M["row1",]
M[,"col1"]

### Matrix arithmetic
rowSums(M)
colSums(M)
colMeans(M)
t(M)

## 4. Array
#############################################################################################
### Creating an array
a <- array(c(11:14, 21:24, 31:34), dim=c(2,2,3))
a

### Accessing an array element
a[,,1]    # 1st matrix
a[1,,1]   # 1st row, 1st matrix

## 5. Data Frame
#############################################################################################
gender <- c("Female", "Female", "Male")
height <- c(162, 169, 170)
weight <- c(40,50,60)
age <- c(21,22, 23)
name <- c("Ally", "Belinda", "Alfred")

a <- data.frame(gender, height, weight, age, row.names = name)
a

### Compact way of creating a data frame
a <- data.frame(gender = c("Female", "Female", "Male"),
                height = c(162, 169, 170),
                weight = c(40,50,60),
                age = c(21,22, 23),
                row.names = c("Ally", "Belinda", "Alfred"))

### Converting a matrix into a dataframe and vice versa
a1 <- matrix(1:20, nrow=4)
b1 <- as.data.frame(a1)
c1 <- as.matrix(b1)

### Creating Dataframe from vector
gender <- c("Female", "Male","Female")
height <- c(155, 171.5, 155)
weight <- c(71,93, 68)
df <- cbind(gender,height,weight)
df

### row and column names
colnames(df)
rownames(df)	
rownames(df) <- c("a", "b", "c")
df

### row and column number
nrow(df)
ncol(df)

### subsetting data frame
a$gender         # gender column
a$height

a[["gender"]]    # column named gender
a[["height"]]
a[[1]]

a[,1]
a[1,1]           # first row first column
a[-1,-1]         # all rows except first and all columns except first       
a[c(1,2),c(2,3)] # 1 and 2 column & 2 and 3 colummn    
a["gender"]    # column named gender

subset(a, select = c("gender", "age"))
subset(a, subset = height > 10, select = c("gender", "height"))

### adding column to a data frame
a$name =c('Ally','Belinda','Jane')

### accessing the class of columns
sapply(a,class)

### 6. Factor
#########################################################################################
data <- factor(c("male","female","female","male"))
is.factor(data)
is.factor(sleep$group)
is.factor(sleep$extra)

## 7. List
###########################################################################################
### Defining a list
a <- list(c(1,2,3,5,6), y = c("n1", "n2", "n3"), 
          z = c("p1", "p2"), m = matrix(1:4, nrow=2))
a


### Accessing list element using name
a$y

### Accessing list element using [[ ]] operator, a vector is returned 
a[[1]]
sum(a[[1]])

### Accessing list element using [ ] operator, a list is returned
a[1]
sum(a[1])

### Modifying list
a[[1]] <- c(7,8,9)
a
a[[1]]

a$newMem <- c("x1", "x2", "x3")
a$nn <- c(1,2,3,4)

### Merging List
list1 <- list(1,2,3)
list2 <- list("Sun","Mon","Tue")
merged.list <- c(list1,list2)
merged.list

# 8. Text
###########################################################################################

### Splitting text
a <- "Today is a very good day"
b <- strsplit(a, split = " ")   # strsplit produces a list
b <- strsplit(a, split = "is")
c <- unlist(b)   
c[1]

### Joining Text
a <- "angch"
b <- "tertiaryinfotech.com"
paste(a,b, sep = "@")

### Sorting Text
v <- c("Red", "Blue", "yellow", "violet")
sort(v)
sort(v, decreasing = TRUE)

v <- c("Red", "Blue", "Yellow", "Violet")
str(v)
summary(v)
class(v)

### 9. Date
#########################################################################################
x <- as.Date("2016-03-13")
x <- as.Date("5/Aug/16", format= "%d/%b/%y")
x
weekdays(x)
x+30
months(x)


########################################################################################
# Packages
#######################################################################################
browseURL("https://cran.r-project.org/web/views/")
install.packages("ggplot2")
library("ggplot2")
#update.packages()
#detach("package:ggplot2", unload = TRUE)
#remove.packages("ggplot2") 

######################################################################################
# Datasets
#######################################################################################
browseURL("http://stat.ethz.ch/R-manual/R-devel/library/datasets/html/00Index.html")
head(sleep)
str(sleep)
browseURL("http://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data")
read.table("http://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data",
           nrows=10, header = FALSE, sep = ",")

#######################################################################################
# Working with directory
#######################################################################################
getwd()                      # working directory
setwd("../")
getwd()
setwd("rEssential/")
getwd()

#######################################################################################
# Writing to and reading from a file
########################################################################################
### csv file
read.csv("data1.csv", header = TRUE)
data1 <- read.csv("data1.csv", header = TRUE)
head(data1)
View(data1)

### challenge 3: add a row at the end of a csv file and store it under some other name 
### (slide No: 104)

### text file
read.table("wine.txt", header = FALSE, sep = ",", nrows = 5)
write.table(sleep, file = "sleep.csv", sep = "       ", quote = FALSE)

##########################################################################################
# Charts
#########################################################################################

### Barplot
par(mar = c(4, 8, 2.5, 2.5))
barplot(mtcars$mpg[1:5], names.arg = row.names(mtcars)[1:5], 
        col = c("red", "green"),
        las=2, horiz = TRUE, xlim=c(0,30), xlab = "mpg")
text(25,2, labels = "my label")

### Boxplot
head(sleep)
par()$mar
par(mar = c(4, 4, 2.5, 2.5))
boxplot(extra ~ group, data = sleep, col = "blue", 
        ylab="Increase in hours of sleep", xlab = "group",
        cex.lab=2.5, cex.axis=2.5)


### Pie Chart
x <- c(21, 62, 10, 53)
labels <- c("A", "B", "C", "D")
M <- c("Mar", "Apr", "May", "Jun")
pie(x, labels)

### Histogram
hist(mtcars$mpg, breaks = 10, col="blue", main = "mpg histogram")
hist(mtcars$mpg, breaks = c(5,10,20,30,45), col = "red", 
     border = "black", main = "mpg histogram")

### Line Plot
plot(mtcars$mpg, type = "o", col = "red", xlab = "Index", pch = 12,
     ylab="mpg")

### Multiple lines in a line chart
plot(mtcars$mpg, type = "o", col = "red", xlab = "x")
lines(mtcars$qsec, type = "o", col = "blue", lty = 2)

### Scatter Plot
plot(mtcars$wt, mtcars$mpg, col = "blue", pch=19, xlab="weight", ylab="mpg",
     cex.lab=1.2)
points(mtcars$wt, mtcars$qsec, col = "red", pch = 17)
legend(x=4.6,y=34, legend=c("wt", "qsec"), pch = c(19,17), col = c('blue', 'red'),
       bty="n")

### Multiple plot in one go
plot(mtcars[,c(1,6,7)], col = "blue", pch=19)


########################################################################################
# control structure
#########################################################################################

### if condition
########################################################################################
x <- 2
y <- 4

if(x >y){
  print("x is greater than y")
}


### if else condition
x <- 2
y <- 4

if(x >y){
  print("x is greater than y")
}else {
  print("y is greater than x")
}

## switch
###########################################################################################
x <- "four"
switch(x,
       zero = print(0),
       one =   print(1),
       two =   print(2),
       three = print(3),
       print("i understand only upto 3 :(")) 


## while loop
###########################################################################################
x <- 0
while(x < 10){
  print(x)
  x = x + 1
}



## for loop
###########################################################################################
## simple for loop
for (i in 1:10){
  print(i)
}

## looping through the values 
v <- c(10,5,7,8)
for (i in v){
  print(i)
}

## for loop: skipping an iteration
for (i in 1:10){
  if (i==5) next
  print(i)
}

## for loop: terminating execution 
for (i in 1:10){
  if (i==5) break
  print(i)
}

## Challenge
### read data1.csv

data1$Month == 5 | data1$Month == 6 | 
data1$Temp > 65
(data1$Month == 5 | data1$Month == 6) & data1$Temp > 65

sum((data1$Month == 5 | data1$Month == 6) & data1$Temp > 65)
nrow(subset(data1, subset= (data1$Month == 5 | data1$Month == 6) & data1$Temp > 65))

Month
data1$Month

attach(data1)
detach(data1)

plot(Month)
with(data1, plot(Month))

##########################################################################################
## Function
##########################################################################################

## Built-in function
#########################################################################################
factorial(3)
mean(1:6)
set.seed(20)
sample(1:6,size = 2)

## User defined function
###########################################################################################
f <- function(x, y){
  y - x
}

f(3,3)

f(1,2)
f(x=1, y=2)   # Named arguments
f(y=1, x=2)   
f(x=2, y=1)

filter <- function(x){
  x[x>0]
}

filter(c(-4,-5,1,2,3,4))

## Functions with default arguments
##########################################################################################
above10 <- function(x, n=10) {
  ind <- x > n
  x[ind]
}

above10(1:15)
above10(1:15, n=5)

## Functional with optional arguments
########################################################################################
f <- function(a,b=1,c=2,d=NULL){
  if(is.null(d)) {
    total <- a+b+c
  } else {
  total <- a+b+c+d
  }
  total
}

f(1,1,2)
f(1,1,2,3)

## Function that return another function
##########################################################################################
make.power <- function(n){
  pow <- function(x){
    x^n
  }
  pow
}

cube = make.power(3)
cube(4)
cube(5)
cube(6)

## passing arguments on to another function
###########################################################################################
f <- function(x, y, ...){
  plot(x, y, ...)
}

x <- seq(from = -3*pi, to = 3*pi, length.out = 100)
y <- sin(x)
f(x,y, col = "red", main = "sine", type = "o")

## Challenge 5: Simulate the sum of two die rolls (slide no: 164)
##############################################################################################
## Hint: Use sample function. 


head(mtcars)
nrow(mtcars)
sample(1:6, 5, replace=FALSE)
ind <- sample(c(TRUE, FALSE), size=32, replace= TRUE, prob=c(0.1,0.9))
mtcars[ind,]
which(ind==TRUE)
mtcars[c(6,11,12),]

############################################################################################
# Advanced functions
###########################################################################################
max(mtcars$mpg)

f <- function(x){
  x*x
}


var <- apply(mtcars, 2, mean)
write.table(var, file="myFile.csv", sep = "\t", quote=FALSE)
apply(mtcars, 1, mean)
names(mtcars)

lapply(mtcars, max)
lapply(mtcars, min)
lapply(mtcars, mean)
lapply(mtcars, min)

str(mtcars)
table(mtcars$cyl)
tapply(mtcars$mpg, mtcars$cyl, mean)
tapply(mtcars$mpg, mtcars$gear, mean)


#########################################################################################
# Basic Statistics
#########################################################################################
x <- 1:100
mean(x)
median(x)
summary(x)
sample(x, size=10)
sample(c(TRUE, FALSE), size = 10, replace=TRUE, prob = c(0.2,0.8)) # randomly select 20%
# of observation


##########################################################################################
## Correlation
##########################################################################################
head(mtcars)
corMat <- cor(mtcars[,c(1,6,7)])
corMat
corMat[2,1]
plot(mtcars[,c(1,6,7)], col = "blue")

############################################################################################
## Linear Regression
#########################################################################################
##install.packages("shiny")
library(shiny)
runApp("lm")


head(mtcars)

lmModel <- lm(mpg ~ wt, data = mtcars)
plot(mtcars$wt, mtcars$mpg, col = "blue", pch = 19, xlab = "wt", ylab = "mpg")
abline(lmModel)
coef(lmModel)
predict(lmModel, newdata = mtcars)



lmModel <- lm(mpg ~ ., data = mtcars)
coef(lmModel)
predict(lmModel, newdata = mtcars)

### Model Accuracy
#### Model of mpg with wt as predictor variable
sumModel <- summary(lmModel)
sumModel$r.squared
corMat[2,1]^2   # r.squared is literally the square of r (correlation coefficient)

#### Model of mpg with qsec as predictor variable
lmModel <- lm(mpg ~ qsec, data = mtcars)
plot(mtcars$qsec, mtcars$mpg, pch = 19, col = "red")
abline(lmModel)
sumModel <- summary(lmModel)
sumModel$r.squared
corMat[3,1]^2   # r.squared is literally the square of r (correlation coefficient)


lmModel <- lm(mpg ~ qsec, data = mtcars)
plot(mtcars$qsec, mtcars$mpg, pch = 19, col = "red")
abline(lmModel)


##########################################################################################
## Distribution
###########################################################################################
### Normally distributed number generation
n <- rnorm(10000, mean = 0, sd = 1)  # generates 1000 normally distributed numbers

par(mfrow=c(1,1))
hist(n, breaks=100, col = "blue", xlim = c(-4,4), 
     main = "Histogram of 10000 randomly \n generated normally distributed number", 
     cex.axis=1.3, cex.lab = 1.3)

runApp("hypothesisTesting/")


### Code to generate quantities related to normal distribution. All the results 
# are for distribution mean 0 and standard deviation (sd) 1
rnorm(n=10, mean = 4, sd = 4)    # Generates 10 numbers
dnorm(x=1.644, mean = 0, sd = 1) # Find the probability density when x = 1.644
pnorm(q=1.644, mean = 0, sd = 1) # Find the probability associate with q 
qnorm(p=0.95, mean = 0, sd = 1)  # Find the quantile associated with p

############################################################################################
## t-test
############################################################################################

### Carry out t-test for Unpaired observation
t.test(extra~group, data = sleep)

### Carry out t-test for Unpaired observation
t.test(extra~group, data = sleep, alternative = "less")

### Carry out t-test for paired observation
t.test(extra ~ group, sleep, paired=TRUE)

###########################################################################################
## ANOVA
###########################################################################################

#### Look at the data
head(chickwts)
table(chickwts$feed)
summary(chickwts)

### Anova

m <- aov(weight ~ feed, data=chickwts)  
summary(m)
TukeyHSD(m)
tapply(chickwts$weight, chickwts$feed, mean)


# Challenge: Perform an ANOVA to determine any difference between the test scores 
# of 3 teaching methods
A <- c(79,86,94,89)
B <- c(71,77,81,83)
C <- c(82,68,70,76)


#########################################################################################  
## Hierarchichal clustering
#########################################################################################
### data preprocessing for hierarchichal clustering. 
### Only 5% of the data have been used  for clustering. More data is not a problem for
### clustering algorithm but the visualization becomes extremely dense.
set.seed(4)
index <- sample(c(TRUE, FALSE), nrow(iris), p = c(0.05, 0.95), replace = TRUE)
myIris <- iris[index,3:4]
myIris

### Clustering done on a subset of iris data which is  named myIris
disM <- dist(myIris)
irisClust <- hclust(disM)
clusters <- cutree(irisClust, k = 3)
clusters
iris[index,5]

##########################################################################################
## kmeans clustering
##########################################################################################
### data preprocessing for hierarchichal clustering. 
### Only 5% of the data have been used  for clustering. More data is not a problem for
### clustering algorithm but the visualization becomes extremely dense.
set.seed(100)
index <- sample(c(TRUE, FALSE), nrow(iris), p = c(0.2, 0.8), replace = TRUE)
myIris <- iris[index,3:4]
group <- iris$Species[index]


set.seed(100)
predGroup <- kmeans(myIris, centers = 3, nstart = 10)
predGroupC <- ifelse(predGroup$cluster==2, "setosa", 
                     ifelse(predGroup$cluster==1, "versicolor", "virginnica"))
predGroupC <- factor(predGroupC)
table(predGroupC, group)



