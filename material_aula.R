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
data <- read.csv("insurance.csv", header = TRUE, sep = ",")

observation_rows <- nrow(data)

class_limit <- 11

classes_num <- min(ceiling(sqrt(observation_rows)), class_limit)

# creating classes
classes <- cut(data$charges, breaks = classes_num, include.lowest = TRUE)

# creating frequency table
frequency_table <- table(classes)

# changing into a dataset
df_frequency_table <- as.data.frame(frequency_table)

# relative frequency
df_frequency_table$relative_frequency <- df_frequency_table$Freq / sum(df_frequency_table$Freq)

# adding %  column
df_frequency_table$relative_frequency_percent <- df_frequency_table$relative_frequency * 100

print(df_frequency_table)

### DESCRIPTVE STATISTICS ANALYSIS

rm(list=ls())
gc()

data <- c(10, 15, 20, 25, 30, 15)
mean(data)
median(data)

# install.packages(c("curl", "openssl", "httr", "DescTools")) helping with a issue


install.packages("DescTools")

library(DescTools)

data <- c(10, 15, 20, 25, 30, 15)
Mode(data)

quantile(data, 0.25)
quantile(data, 0.50)
quantile(data, 0.75)
quantile(data, 0.10)

max(data) - min(data)

# variancia
var(data)

# desvio padrao
sd(data)

### GRAPHIC ANALYSES

# grafico de dispersão
x <- c(1, 2, 3, 4, 5, 6, 7)
y <- c(3, 6, 5, 9, 12, 15, 20)

plot(x, y, main = "Gráfico de dispersão com linha de tendência",
     xlab = "eixo x", ylab = "eixo y", ylim = c(0, 30), xlim = c(0, 10))  # lim is the scale

# adicionar linha de tendência
tendencia <- lm(y ~ x)
abline(tendencia, col="red")


# grafico de barras simples

catprod <- c("A", "B", "C", "D")
values <- c(10, 20, 15, 25)

barplot(values, names.arg = catprod, col="skyblue",
        main = "Gráfico de Barras Somples",
        xlab = "categorias", ylab = "valores")

# histograma simples
data <- c(22, 25, 28, 30, 35, 38, 40, 42, 45, 50, 55, 60)
hist(data, main = "Histograma simples",
     col = "skyblue", border = "black")

# histograma com média e mediana
hist(data, main = "histograma commpleto",
     col = "skyblue", border = "black")
abline(v = mean(data), col="red", lwd=2)
abline(v = median(data), col="blue", lwd=2)

# boxplot simples
data <- c(22, 25, 28, 30, 35)
boxplot(data, main="Boxplot Simples",
        xlab="valores", ylab="escala")

# boxplot com grupos
grupo1 <- c(22, 25, 28, 30, 35)
grupo2 <- c(38, 40, 42, 45, 50, 55, 60)

boxplot(grupo1, grupo2, names = c("grupo1", "grupo2"),
        main = "Boxplot com grupos",
        xlab="Grupos", ylab="valores")

# grafico de setores
proporcoes <- c(20, 30, 40)
categorias <- c("categoria_1", 'categoria_2', "categoria_3")
pie(proporcoes, labels = categorias,
    main = "Gráfico de Setores Simples")

# Exemplo de dados customizados
tempo <- c(0, 1, 2, 3, 4, 5)
data1 <- c(0, 10, 15, 8, 20, 12)
data2 <- c(0, 5, 8, 12, 18, 25)

par(mar=c(5, 4, 4, 2) + 0.1) # ajuste das margens

plot(tempo, data1, type = "l", col = "blue", lwd=2,
     main = "Gráfico de linhas",
     xlab="Tempo", ylab="Dados",
     xlim = c(0, max(tempo)), ylim =c(0, max(data1, data2)))
lines(tempo, data2, col = "red", lwd=2, lty=2)
legend("topright", legend = c("série 1", "série 2"),
       col = c("blue", "red"), lty = c(1, 2), lwd = 2)