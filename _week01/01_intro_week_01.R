# - where am I?
getwd()

# - note: always use RStudio projects!
list.files(getwd())
list.files()

# - pick a directory in your loval filesystem, and then:

your_directory <- "/"
setwd(your_directory)
getwd()

# - you are now in "/"
# note: navigate back to the project directory and setwd() and there:

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
w2 <- "World!"
print(c(w1, w2))


# - nope: print() is a function of one argument
print(w1, w2)

# - what is c():
c(1, 2, 3)

# - a vector:
a <- 5
class(a)

# -everything in R are vectors
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
# - non-numeric argument to binary operator
v3 + 1

# - everything in R are functions
5 + 2
"+"(5, 2)
"+"(5, 2 ,1)

# - look:
Reduce("+", c(5, 2 , 1))
# - everything in R is (better: can be) functional programming

# - numbers
a <- 7
class(a)

a <- 3.14
class(a)
sqrt(a)

# - variance of a vector
v1 <- c(1, 7, 8, 2, 11, 14, 22)
v1
# - lenght of v1
length(v1)

# - mean(v1)
mean(v1)

# - iteration
sse <- numeric()
sse
for (i in 1: length(v1)){sse[i] <- v1[i] - mean(v1)}
sse
sse <- sse^2
sse
sse <- sum(sse)
sse

# - degrees of freedom:
n <- length(v1) - 1
n
variance_v1 <- sse / n
variance_v1

# - also:
var(v1)

# - standard deviation:
sd_1 <- sqrt(variance_v1)
sd_1
sd(v1)

# - Ok, now without iteration:
sse <- sum(v1 - mean(v1)^2)
sse

# - and thus:
var_v1 <- sum(v1 - mean(v1)^2) / (length(v1) - 1)
var_v1
var(v1)

# - missing values
v1 <- c(1, 7, 8, 2, 11, NA, 22)
var(v1)

var(v1, na.rm = TRUE)
# - also:
sum(v1)
sum(v1, na.rm = TRUE)
mean(v1)
mean(v1, na.rm = TRUE)

# - finding things in vectors

v1 > 5
v1
which(v1 > 5)

w <- which(v1 > 5)
v1[w] <- NA
v1

# head and tail

head(v1)
head(v1, 2)
tail(v1)
tail(v1, 2)


# - boolean in R
a <- TRUE
class(a)
v1 <- c(1, 7, 8, 2, 11, 14, 22)
find5 <- v1 > 5
find5
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
a
b <- list(name = c("Marko", "Nataša"),
          age = c(51, 41))
b
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




