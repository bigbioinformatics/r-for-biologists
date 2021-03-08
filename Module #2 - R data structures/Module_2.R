#Lets say we have two sequences
#Real world example of basic R skills

library(readr)
seq1=read_file("SEQ1.txt")
seq2=read_file("SEQ2.txt")

# Sequence 1
print(seq1)

#Sequence 2

print(seq2)

# And you want to know whether the first sequencing file is the same as the second. 

seq1==seq2
  
  
#Comments
  
#An important tool for writing R code is comments. These are preceded by # and are ignored by R 

#This code will say "Hello World!"

"Hello world!"

#Comments are a helpful tool for conveying information about your code to others.
#5 basic data structures in R
# * Character
# * Numeric
# * Integer
# * Logical
# * Complex

## Character
# Holds "string" data. For example: 
  
"Hello World"

# You can ask R to tell you what type of data you have:
  
class("Hello World")

## Numbers
  
# Numbers can be integers or numerics (i.e., floats) in R. For example: 
  
1

2.2

3E100

# The default for R is to make every number a numeric

class(1)

# Which means that we have hidden decimal points behind the 1 (1.00 for example)
#But what if we wanted specifically an integer?
  
1L

class(1L)


### Challenge Question 1
# Is this a numeric or a character? 
  
"2"

class("2")

## Logicals
# Logicals are either True of False. For example

TRUE

FALSE

class(TRUE)

class(FALSE)

### Challenge question 2
# R is *case sensitive*. 
# With that knowledge, what do you think the below would give us? 
  
class(true)

## Data Structure Classes cont..
# So far we have only been using class()
# But we can also use a function to see the structure of any R object: 
  
str(1)

str("Hello World!")

str(TRUE)

### Challenge Question 3
# R is an object oriented language, and it tends to put everything in some sort of class. 
# What would the below tell us? 
  
str(class)

# Simple Data Structures Methods
## Arithmetic Methods
# * Addition

1+1

# * Subraction

1-1

# * Multiplication

2*2

# * Division

10/2
## Equivalence Comparisons
# Equivalence comparisons are a way to check if any two objects are the same
#Does 1 equal 1?

1==1

#Does "Hello" equal "World?"
#Hello" == "World"
#We can also invert an equivalancy comparison to check if two objects are *not* equal
#Does 1 not equal 1?

1!=1

## Mathematical Comparisons
#For numeric data types, mathematical comparisons can also be made
#Is 1 less than 100?
1<100

#Is 2+2 greater than 2^2

2+2>2^2

### Challenge Question 4
# Arithmetic in R follows PEMDAS

4+5*3

# vs 

(4+5)*3

# What would we get with the following? 
  
4+5*3>(4+5)*3

4+5*3>(4+5)*3

  
# Variables
# Variables hold objects that are assigned to them. 

a <- 1

# They can be identical to the object assigned to them

a <- 1
b <- a

#does b equal 1?

b==1

# Variables enable complex operations on data

h <- 2^100
i <- h/3E100
j <- 1E5
k <- j^(-1*i)

#is k greater than 1?

k < 1

# Complex Data Structures
## Vectors
# A Vector is an ordered collection of either numerics, characters, or logicals

c(1, 2, 3)
c(TRUE, FALSE, TRUE)
c("hello", "world")

### Challenge Question 5
# A vector in R has a limitation: they can only allow one type of class in each vector.

# If you add more than one type of class, it will default to a character. 

# With that said, what would the following give you? 
  
class(c("puppies", 2))

class(c("puppies", 2))

### Challenge Question 6
# I can change the following vector in my variable to all numbers

my_num <- as.numeric(c("2", 2))

class(my_num)

# But what would happen if I tried to do the following? 
  
as.numeric(c("salt", "2"))

print(as.numeric(c("salt", "2")))

print(as.numeric(c("salt", "2")))

class(as.numeric(c("salt", "2")))

# Vectors Continued
# Vectors can also have a vector of names which describe each element

grades <- c(98, 95, 82)
names(grades) <- c("Jimmy", "Alice", "Susan")

grades

# Elements from a vector can be accessed using the index of the desired data. Lets say I wanted to know what Alice's grade was.

grades[2]

# But lets say that I didn't know Alice was the second index

grades["Alice"]

# If you want to add a series of numbers to a vector of integers, you can do the following: 
  
my_ints <- 1:10
my_ints

# Lists
# A list is an ordered collection of any objects. This differs from vectors, because vectors can only be one type of object class

my_list <- list(1, "b", TRUE, c(1,2,3))

# Lists can also have names

names(my_list)=c("My #", "My Letter", "My logical", "My_num_Set")

my_list

# The elements within a list can be accessed by using numeric indexes or by the element name

my_list[[2]]

my_list[["My_num_Set"]]

my_list$My_num_Set

#If I did the following, I would get the whole vector within the list

my_list[2]

#Data Frames
# Data frames are similar to excel sheets. They are 2D arrays which can hold numeric, character, and boolean data. They also have column names. 

my_df <- data.frame("students"=c("Jimmy", "Alice", "Susan"), 
                    "Grades"=c(98, 95, 82))

my_df

#Data frames can be accessed numerically by expressing the row and column of interest. 
#What grade did Susan get? 

my_df[3,2] #row, column

# They can also be accessed with the $ sign

my_df$Grades

#What grade did Alice get?

my_df$Grades[2]

#End of the workshop. Thank you! Questions?
  

  
  
  
  
  
  
  
  
  
  




