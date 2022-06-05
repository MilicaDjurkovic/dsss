install.packages("tidyverse")
library(tidyverse)

install.packages("dplyr")
install.packages("tidyr")
install.packages("ggplot2")



# - where am i?
v <- getwd()
print(v)
# - note: always use RStudio projects!
list.files(getwd())
list.files()
# - pick a directory in your local filesystem, and then:
your_directory <- "/"
setwd(your_directory)
getwd()
# - you are now in "/"
# note: navigate back to the project directory and setwd() there

# - calculator
5 + 5
a <- 7
a + 3
ls()
a = 5
a + 3

# - note: use the assignment operator in R: '<-'
a <- 5
b <- 2
a^b
ls()

# - clear workspace:
rm(list = ls())
ls()

# - basic types and elementary built-in functions
print("Hello World!")
w1 <- "Hello"
w2 = "World"
print(c(w1, w2))
# - nope: print() is a function of one argument
print(w1, w2)
# - what is c():
c(1, 2, 3)
# - a vector:
a <- c(1, 2, 3)
class(a)
# - however:
a <- 5
class(a)
# - everything in R are vectors
v1 <- c(1, 2, 3)
print(v1)
v2 <- c("a", "b", "c")
print(v2)
v3 <- c("a", 3.14, "c")
print(v3)
# - implicit type conversion (coercion)
class(v3)
# - access elements of a vector
v3[1]
v3[2]
class(v3)
v3[3]
# - implicit type conversion (coercion):
class(v3)
# - character class
class(v2)
# - vectorization
v1
v1 + 1
# - recycling
v1
v1 + c(1, 2, 3, 4)
# note: mind the warning message!
# 
v3
# - 
v3 + 1
# - everything in R are functions
5 + 2
"+"(5, 2)
"+"(5, 2, 1)
# - look:
Reduce("+", c(5, 2, 1))
# - everything in R is (better: can be) functional programming

# - numbers
a <- 7
class(a)
a <- 3.14
class(a)
sqrt(a)

# - variance of a vector
v1 <- c(1, 7, 8, 2, 11, 14, 22)
# - length of v1
length(v1)
# - mean of v1
mean(v1)
# - iteration
sse <- numeric()
for (i in 1: length(v1)) {
  sse[i] <- v1[i] - mean(v1)
}
print(sse)
sse <- sse^2
sse <- sum(sse)
sse
# - degrees of freedom:
n <- length(v1) - 1
n
variance_v1 <- sse/n
variance_v1  
# - also:
var(v1)
# - standard deviation
sd_v1 <- sqrt(variance_v1)
sd_v1
sd(v1)
# - Ok, now without iteration:
sse <- sum((v1-mean(v1))^2)
sse
# - and thus:
var_v1 <- sum((v1-mean(v1))^2)/(length(v1)-1)
var_v1
var(v1)

# - missing values
v1 <- c(1, 7, 8, 2, 11, NA, 22)
var(v1)
var(v1, na.rm = TRUE)
# also:
sum(v1)
sum(v1, na.rm = TRUE)
mean(v1)
mean(v1, na.rm = TRUE)

# - finding things in vectors
v1 > 5
which(v1 > 5)
w <- which(v1 > 5)
v1[w] <- NA
v1
# - head and tail
head(v1)
head(v1, 2)
tail(v1)
tail(v1, 2)

# - boolean in R
a <- TRUE
class(a)
v1 <- c(1, 7, 8, 2, 11, 14, 22)
find5 <- v1 > 5
class(find5)
find5
# - explicit type conversion
as.numeric(find5)
# - how many elements of v1 are larger than five
sum(as.numeric(find5))
# - implicit type conversion
sum(find5)
b <- FALSE
# - implicit type conversion
a + b

# - character in R
a <- "Paris"
class(a)
b <- "Belgrade"
a + b
paste(a, b)
paste0(a, b)
paste(a, b, sep = "")
paste(a, b, sep = " ")

# - function to work with character
substr(a, 1, 2)
substr(a, 4, 5)
a <- "This is a sentence in English"
strsplit(a, split = " ")
# This is a list in R
a_split <- strsplit(a, split = " ")
class(a_split)
# To access an element of a vector: "[" and "]"
text <- c("Paris", "Belgrade")
text[1]
text[2]
# # To access an element of a list: "[[" and "]]"
a_split <- strsplit(a, split = " ")
a_split
length(a_split)
a_split
a_split[[1]]
class(a_split)
class(a_split[[1]])
a_split[[1]][1]
a_split[[1]][6]
# - length of a string
a <- "Paris"
length(a)
nchar(a)
# - is something found in a string
grepl("P", a)
grepl("Z", a)
# - replace something in a string
gsub("P", "Z", a, fixed = TRUE)
a <- gsub("P", "Z", a, fixed = TRUE)
grepl("Z", a)

# - elementary functions in R
sum2 <- function(x, y) {
  s <- x + y
  return(s)
}

sum2(10, 4)
sum2(10, 1)

# - more functions 

a <- list(name = c("George", "Maria"),
          age = c(48, 42))
a$name
a$age


b <- list(name = c("Marko", "Nataša"),
          age = c(51, 41))
b
b$name
b$age

cmp_couples <- function(l1, l2) {
  if (l1$age[1] > l2$age[1]) {
    output1 <- paste0(l1$name[1], " is older than ", l2$name[1])
  } else {
    output1 <- paste0(l1$name[1], " is not older than ", l2$name[1])
  }
  if (l1$age[2] > l2$age[2]) {
    output2 <- paste0(l1$name[2], " is older than ", l2$name[2])
  } else {
    output2 <- paste0(l1$name[2], " is not older than ", l2$name[2])
  }
  return(list(output1, output2))
}
 cmp_couples(a, b)


 ### ----------------------------------------------------------------------------
 ### --- DataKolektiv DATA SCIENCE SUMMER SCHOOL 2022
 ### --- MACHINE LEARNING IN R
 ### --- Week 1. Introduction to R for ML
 ### --- author: Goran S. Milovanović, Phd
 ### --- DataKolektiv, Chief Scientist/Owner
 ### --- DataKolektiv, 2022.
 ### --- script: 04_IO_operations.R
 ### --- description: elementary I/O in R
 ### --- license: GPL-3.0 license
 ### --- https://www.gnu.org/licenses/gpl-3.0.html
 
 # - the data are found in the /_data directory
 # - relative to the project path:
 getwd()
 list.dirs()
 data_dir <- paste0(getwd(), "/_data/")
 # - now we have the _data directory path
 
 # - read.csv() to read in a .csv file format
 # - into an R data.frame
 air_quality_data <- read.csv(paste0(data_dir, "AirQualityUCI.csv"), 
                              header = TRUE,
                              sep = ";",
                              check.names = FALSE, 
                              stringsAsFactors = FALSE)
 # - sep = ";" - to be discussed in the classroom
 head(air_quality_data, 10)
 
 # let's load another one (a pure `.csv`)
 # - there is an in-built mtcars dataset, look:
 head(mtcars)
 # - write.csv mtcars to our data_dir
 write.csv(mtcars, 
           paste0(data_dir, "mtcars.csv"))
 # - load mtcars.csv into a data.frame
 mtcats_data <- read.csv(paste0(data_dir, "AirQualityUCI.csv"),
                         header = TRUE,
                         sep = ";",
                         check.names = FALSE,
                         stringsAsFactors = FALSE)
 # - sep = ";" - to be discussed in the classroom
 head(air_quality_data, 10)
 
 # - load several .csv files and put them together 
 # - in one data.frame
 # - first, let's produce the data
 data_sets <- list() 
 for (i in 1:4) {
   dat <- data.frame(measure_A = runif(100, 0, 100),
                     measure_B = runif(100, 0, 500), 
                     code = sample(letters, 100, replace = TRUE), 
                     month = sample(month.name, 100, replace = TRUE),
                     stringsAsFactors = FALSE)
   data_sets[[i]] <- dat
 }
 # - inspect
 data_sets[[1]]
 # - write all elements of data_sets as separate .csv files
 lapply(data_sets, function(x) {
   filename = paste0("data_chunk_", round(runif(1, 1, 100), 0), ".csv")
   write.csv(x, paste0(data_dir, "/", filename))
 })
 # read; first we need to recognize the files that we need
 lF <- list.files(data_dir)
 lF <- lF[grepl("data_chunk", lF)]
 print(lF)
 collect_set <- lapply(lF, function(x) {
   read.csv(paste0(data_dir, x), 
            header = TRUE, 
            check.names = FALSE,
            row.names = 1,
            stringsAsFactors = FALSE)
 })
 # - check
 length(collect_set)
 class(collect_set)
 collect_set[[1]]
 # - put them together
 final_data_set <- Reduce(rbind, collect_set)
 head(final_data_set, 50)




 
 ### ----------------------------------------------------------------------------
 ### --- DataKolektiv DATA SCIENCE SUMMER SCHOOL 2022
 ### --- MACHINE LEARNING IN R
 ### --- Week 1. Introduction to R for ML
 ### --- author: Goran S. Milovanović, Phd
 ### --- DataKolektiv, Chief Scientist/Owner
 ### --- DataKolektiv, 2022.
 ### --- script: 03_controlflow_functional.R
 ### --- description: control flow and functional programming in R
 ### --- license: GPL-3.0 license
 ### --- https://www.gnu.org/licenses/gpl-3.0.html
 
 # - data_dir
 data_dir <- paste0(getwd(), "/_data/")
 
 # - elementary, dear Watson:
 for (a in 1:10) print(a)
 # - code blocks
 for (i in 1:100) {
   print(sqrt(i))
 }
 # - function call in iterations
 cities <- c('NYC', 'Belgrade', 'Rome', 'Berlin')
 for (x in 1:length(cities)) {
   print(
     paste0("This is a large city: ", 
            cities[x])
   )
 }
 
 # - when to use for loops, and when not
 numbers <- numeric()
 for (i in 1:100) {
   numbers[i] <- i
 }
 
 # - it's a vectorized language, right?
 numbers <- 1:100
 
 # - look:
 lF <- list.files(data_dir)
 lF <- lF[grepl("data_chunk", lF)]
 data_set <- lapply(paste0(data_dir, lF),
                    read.csv, header = T, stringsAsFactors = F)
 data_set[[1]]
 data_set[[2]]
 
 # - slow with for loop:
 # - list files
 lF <- list.files(data_dir)
 lF <- lF[grepl("data_chunk", lF)]
 data_set <- list()
 # - iterate:
 for (i in 1:length(lF)) {
   data_set[[i]] <- read.csv(paste0(data_dir, lF[i]), 
                             header = T, 
                             stringsAsFactors = F)
 }
 data_set[[2]]
 
 # - faster, if you plan the size of your
 # - data structures:
 # - list files
 lF <- list.files(data_dir)
 lF <- lF[grepl("data_chunk", lF)]
 # - how many files?
 num_files <- length(lF)
 # - prepare a list to store the dataframes
 data_set <- vector(mode = "list", length = num_files)
 # - iterate:
 for (i in 1:num_files) {
   data_set[[i]] <- read.csv(paste0(data_dir, lF[i]), 
                             header = T, 
                             stringsAsFactors = F)
 }
 data_set[[1]]
 
 # - put them together w. functional Reduce()
 data_set <- Reduce(rbind, data_set)
 
 # - plan the size of your data structures
 emptyList <- vector(mode = "list", length = 4)
 emptyList
 
 # - more loops: while
 counter <- 0
 while (counter <= 100) {
   counter <- counter + 1
   if (counter %% 10 == 0) {
     print(counter)
   }
 }
 
 # - decisions
 num_rows <- dim(data_set)[1]
 if (num_rows >= 10000) {
   print("data_set have more than 10,000 rows!")
 } else {
   print("data_set is a very small dataset.")
 }
 
 # - nesting decisions
 num_rows <- dim(data_set)[1]
 num_cols <- dim(data_set)[2]
 if (num_rows >= 100) {
   print("data_set have more than 100 rows!")
   if (num_cols > 10) {
     print("And it has more than ten columns!")
   } else {
     print("But it has less than ten columns!")
   }
 } else {
   print("data_set is a very small dataset.")
   if (num_cols > 10) {
     print("And it has more than ten columns!")
   } else {
     print("But it has less than ten columns!")
   }
 }
 
 # - chain if... else
 this_number <- 11
 if (this_number > 10) {
   print("This number is less than ten...")
 } else if (this_number < 5) {
   print("This number is less than five.")
 }
 
 # - switch
 this_animal <- 'dog'
 switch(this_animal,
        "dog" = "It's a dog!",
        "elephant" = "It's an elephant!", 
        "cat" = "Meow!", 
        "tiger" = "A tiger? In Africa?")
 this_animal <- 'cat'
 switch(this_animal,
        dog = "It's a dog!",
        elephant = "It's an elephant!", 
        cat = "Meow!", 
        tiger = "A tiger? In Africa?")
 
 # - code blocks in switch
 some_expression = 'hey'
 switch(some_expression, 
        hey = { 
          print(2 + 2)
          print('Hey!') 
        },
        hi = { 
          print(5 + 5)
          print('Hi!')
        },
        {
          print(6 * 3)
          print('Default case!')
        }
 )
 
 # - vectorized ifelse
 ifelse(10 < 5, 
        "I do not understand basic arithmetics.", 
        "Ok I got at least that one right."
 )
 trues <- sample(c(TRUE, FALSE), 100, replace = TRUE)
 print(trues)
 ifelse(trues,
        print("Yes"),
        print("No")
 )
 
 ### --- functional programming
 # - functionals in R
 
 # - lapply()
 cities <- c("Paris", "Rome", "NYC", "Moscow", "Tokyo")
 lapply(cities, function(x) {
   return(
     paste0("A big city: ", x)
   )
 })
 big_cities <- lapply(cities, function(x) {
   return(
     paste0("A big city: ", x)
   )
 })
 class(big_cities)
 big_cities <- unlist(big_cities)
 big_cities
 
 # - or use sapply() instead:
 sapply(cities, function(x) {
   return(
     paste0("A big city: ", x)
   )
 })
 big_cities <- sapply(cities, function(x) {
   return(
     paste0("A big city: ", x)
   )
 })
 class(big_cities)
 big_cities
 names(big_cities)
 big_cities <- unname(big_cities)
 big_cities
 
 # - mapply
 a <- 1:10
 b <- 11:20
 mapply("+", a, b)
 
 v1 <- c(1, 2, 3, 4, 5)
 v2 <- c(2, 4, 1, 2, 10)
 mapply(max, v1, v2)
 
 # - mapply() is to Map() what sapply() is to lapply()
 Map(max, v1, v2)
 
 # - apply, for matrices
 mat <- matrix(1:9, nrow = 3)
 print(mat)
 apply(mat, 1, sum)
 apply(mat, 2, sum)
 
 # - Reduce
 Reduce("+", 1:6)
 Reduce("+", 1:6, accumulate = TRUE)
 
 # - lapply() + Reduce()
 data_dir <- paste0(getwd(), "/_data/")
 lF <- list.files(data_dir)
 lF <- lF[grepl("data_chunk", lF)]
 lF
 # - read all with lapply():
 data <- lapply(lF, function(x) {
   read.csv(paste0(data_dir, x), 
            header = TRUE,
            check.names = FALSE,
            row.names = 1,
            stringsAsFactors = FALSE)
 })
 data[[1]]
 data[[2]]
 dataset <- Reduce(rbind, data)
 
 





















