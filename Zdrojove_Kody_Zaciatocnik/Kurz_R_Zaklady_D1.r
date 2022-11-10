# -*- coding: utf-8 -*-

# -- Operacie --

# # 📊 Kurz Jazyka R - Základy
# Lektor: Miroslav Reiter


# ## 🖨 Používateľský výstup, tlač


# alt + 35 Komentar (poznamky)
print("Ahoj svet")
# cat("Hello World \n")
# writeLines("Vitaj na kurze R")
# print("R je super")

# ## 🎲 Aritmetické Operácie


8+3
7-2
(5+4)*9

# Mocnina
2**5
2^5

# Realne delenie
5/2

# Delenie so zvyskom (modulo)
5 %% 2

# Celociselne delenie
5 %/% 2

# Backticks
`+`(8, 3)
`*`(5, 9)
`>`(7, 6)

# ## Zabudované funkcie a konštanty


print(log(10))
print(exp(10))
print(sqrt(91))
print(pi)
month.abb
month.name
letters
LETTERS
print(sin(4 * pi))
plot(sin(4 * pi))

# ## Premenné/objekty a dátové typy


# Nazov premennej priradenie hodnota
a = 5
aa <- 5
b = 5L
c = T
d = TRUE
e <- F
f <- FALSE
g = 5i
h = 10 + 5i
i = "Adam Sangala"
j = NULL
k = NA
l = NaN
m = Inf
n = 99.99

identical(a, aa)
b <- a
identical(a, b)

# ?NULL
# ?NA
# ?NaN
# ?Inf

0/0

# ## Formátovanie, typy, triedy


# Ukoncovacie sekvencie, escaped sequences
# \n new line novy riadok/odriadkuj
# \t tab tab
# \\ \
# \" "
# \' '
cat("typeof a class: \n")
cat(typeof(a), "\n")
cat(typeof(c), "\n")
cat(class(a), "\n")
cat(class(c), "\n")
writeLines("\nClassy \t triedy:")
cat("C:\\temp\\datasety \n")

# ## 📊 Generovanie dát + grafy


test <- rnorm(n = 200, mean = 100, sd = 2)
head(test)
summary(test)
par(mfcol = c(1,2))
plot(test)
hist(test)
boxplot(test, horizontal = TRUE)

data <-  c(10, 20, 30, 90, 1500)
data[-2]

zoznam_zamestnacov <- c("Adam", "Ivan", "Maria", "Monika")
zoznam_zamestnacov[-2]


stavy_zariadenia <-  c(T, F, F, T, T, F)
stavy_zariadenia[-2]

# Inkluzivne
sekvencia1 = seq(10, 20)
sekvencia1

sekvencia2 = seq(1, 10, 2)
sekvencia2

sekvencia3 = seq(10, 1000, 10)
sekvencia3

# ## Workspace


premenne = ls()
premenne
hlavne_mesto = "Bratislava"
hlavne_mesto
rm(hlavne_mesto)
data = c(5,8,6,9,10)

save.image(file = "Premenne.RData")
save(a, b, c, file = "Moje3Premenne.RData")

load("Moje3Premenne.RData")

history()

set.seed(1)
x = rnorm(1000)
y = x + rnorm(1000)

# plot(x,y)

vektor = cbind(x, y)
# plot(vektor)

typeof(mtcars$cyl)

casove_rady = ts(matrix(rnorm(500), nrow = 500, ncol = 1), start = c(1950, 1), frequency = 12)
datumy = seq(as.Date("2022/1/1"), by="month", length = 10)
casove_rady


R.home()
R.version
R.Version()$version.string

max(1,5,-5,0,6,9,10)
min(1,5,-5,0,6,9,10)

# Zaokruhlenie
round(99.99853, 3)
ceiling(99.99853)
ceiling(99.00001)

floor(99.99853)
floor(99.00001)

meno = "Adam"
priezvisko = "Sangala"
cele_priezvisko = paste(meno, priezvisko, sep=" - - ")
cele_priezvisko
length(cele_priezvisko)
nchar(cele_priezvisko)

