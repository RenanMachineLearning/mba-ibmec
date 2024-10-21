rm(list=ls())
gc()

### introductory part to R
age <- 30

name <- "Alice"

weight <- 1.5

true_or_false <- TRUE

#  object manipulation

age_in_one_year <- age + 1

greeting <- paste("Hi", name, "!")

legal_age <- age >= 18

# object visualization

print(age_in_one_year)
print(greeting)
print(legal_age)

# removing objects
rm(age_in_one_year)

# data type
age <- 28
height <- 1.75

# height in cm
height_in_cm <- height * 100

# change data into integer
quantity <- 10

print(height)

height <- as.integer(height)
print(height)

# logistics data
print(age)

true_or_false <- age > 18
print(true_or_false)

# if statement
if (true_or_false) {
  print("at legal age")
} else {
  print("it is not at legal age")
}

rm(list = ls())
gc()
### DATABASE

# making a working directory path
setwd("/home/renan/Documents/ibmec/1_extra/datasets")
getwd()

data <- read.csv("dataset_sample.csv", header = TRUE, sep = ",")

# adding row at the database

df1 <- data.frame(Nome=c("Roberta", "Giovanni"), Idade=c(33, 29), Cidade=c("Rio de Janeiro", "Rio Branco"))

data <- rbind(data, df1)

# adding column
print(data)
column <- data.frame(Nome = c("Renan", "Ingredi", "Pedro", "Roberta", "Giovanni"), Filhos = c(0, 1, 1, 0, 0))
data <- merge(data, column, by = "Nome")
print(data)


# install.packages("readxl")
# install.packages("readODS") It's been installed already 

# library(readxl)
library(readODS)

# register <- read_excel()
register <- read_ods("excel.ods", sheet = "cadastro")

### frequency distribution analysis