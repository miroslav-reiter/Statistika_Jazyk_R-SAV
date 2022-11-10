# -*- coding: utf-8 -*-

# -- UI_Controls --

# # Kurz Jazyka R - Základ




ckb_vop <- FALSE

print(paste("Dal si suhlas: ", ckb_vop))



dp_mesta <- "Košice"

print(paste("Vybral si ",dp_mesta))



txt_krstne_meno <- "   Monika   "

print(paste("Volas sa:", txt_krstne_meno))



dtp_prebratie <- as.Date("2022-11-18")

print(paste("Vybral si datum: ", dtp_prebratie))

# -- Data_Generovanie_Koercia --

# # Kurz Jazyka R - Základ


# ## Atomickosť


is.atomic(9)
is.atomic(data.frame())
is.atomic(data())


is.numeric(158)
is.numeric(110L)
is.numeric(Inf)
is.numeric(pi)
is.numeric(3.5e3)
is.numeric(158)

is.numeric(T)
is.numeric("158")
is.numeric("Karol")
is.numeric(5+2i)

is.integer(158)
is.integer(158L)
is.character("Karol")
is.complex(5+3i)



# ## Dátová koercie (explicitné pretypovania)


a <- 5
typeof(a)

a <- as.integer(a)
typeof(a)

b <- FALSE
b <- as.numeric(b)
typeof(b)
b

c <- TRUE
c <- as.character(c)
typeof(c)
c

d <- "   158   "
d <- as.numeric(d)
d

# ## Generovanie dát (seq, rep, sample)


vektor = 5:10
vektor

seq(10)
seq(1,10,2)
seq(as.Date("2020/1/1"), as.Date("2022/1/1"), by="year")
seq(as.Date("2020/1/1"), by="month", length.out = 5)

# Replikacia
rep(1:4, 2)
rep(1:4, each=2)
rep(1:4, each=3)

sample(1:20, 9)

# ## Datasety


#data()
#print(Orange)
?Orange

require(stats); require(graphics)
coplot(circumference ~ age | Tree, data = Orange, show.given = FALSE)
fm1 <- nls(circumference ~ SSlogis(age, Asym, xmid, scal),
           data = Orange, subset = Tree == 3)
plot(circumference ~ age, data = Orange, subset = Tree == 3,
     xlab = "Tree age (days since 1968/12/31)",
     ylab = "Tree circumference (mm)", las = 1,
     main = "Orange tree data and fitted model (Tree 3 only)")
age <- seq(0, 1600, length.out = 101)
lines(age, predict(fm1, list(age = age)))

help(CO2)

require(stats); require(graphics)

coplot(uptake ~ conc | Plant, data = CO2, show.given = FALSE, type = "b")
## fit the data for the first plant
fm1 <- nls(uptake ~ SSasymp(conc, Asym, lrc, c0),
   data = CO2, subset = Plant == "Qn1")
summary(fm1)
## fit each plant separately
fmlist <- list()
for (pp in levels(CO2$Plant)) {
  fmlist[[pp]] <- nls(uptake ~ SSasymp(conc, Asym, lrc, c0),
      data = CO2, subset = Plant == pp)
}
## check the coefficients by plant
print(sapply(fmlist, coef), digits = 3)



# -- Vektory --

# # Kurz Jazyka R - Základ


# ## Vektor


a <- c(24, 11, 82)
b <- c(27, 36)

mesta <- c("Bratislava", "Košice", "Poprad")
mesta

mix <- c(1289.99, "Bratislava", TRUE, 32L)
mix

vektor_studenti <- c(muzi = 4, zeny = 6)
vektor_studenti

vektor_zamestnanci <- c(10, 8)
vektor_zamestnanci <- setNames(vektor_zamestnanci, c("Programatori", "Analytici"))
vektor_zamestnanci

vektor_cisla <- c(10, -5, 0, 3, 81, -9, 153, 26, -3, 1850, 63)
vektor_cisla
sort(vektor_cisla)
sort(vektor_cisla, decreasing = TRUE)

vektor_cisla[1]
vektor_cisla[order(vektor_cisla)]
vektor_cisla[order(-vektor_cisla)]

rev(vektor_cisla)

vektor1 <- c(1,2,3,4)
vektor2 <- c(5,6,7,8)
# Vektor/List
vektor3 <- c(vektor1, vektor2)
vektor3

append(vektor1, c(5,6,7,8))
vektor_prazdny = c()
vektor_prazdny

# Riadiace strukture (control flows) if, else, for, while, 
# break, continue

for(i in 1:4) {
    vektor_prazdny[i] <- i
}
vektor_prazdny


# DataFrame
tab = cbind(vektor1, vektor2)
tab

vektor_prazdny2 = c()
vektor_prazdny2

vektor_prazdny2 <- rep(NA, 4)
vektor_prazdny2
vektor_prazdny2 <- vector(length = 4)
vektor_prazdny2

# ## DataFrame (Tabuľky)


# Matrix
# tab = cbind(vektor1, vektor2)
# tab

hodnotenie <- 1:4
zvieratka <- c('Koala', 'Ježko', 'Leňochod', 'Panda')
krajiny <- c('Austrália', 'Talianska', 'Peru', 'Čína')
priemer_cas_spanku <- c(21, 18, 17, 10)

zvieratka_spaci <- data.frame(hodnotenie, zvieratka, krajiny, priemer_cas_spanku)
#zvieratka_spaci

zvieratka_spaci2 <- data.frame(1:4, 
c('Koala', 'Ježko', 'Leňochod', 'Panda'),
c('Austrália', 'Talianska', 'Peru', 'Čína'),
priemer_cas_spanku <- c(21, 18, 17, 10),
row.names=c("A", "B", "C", "D"))

#print(zvieratka_spaci2)
zvieratka_spaci2

colnames(zvieratka_spaci2) <- c("S1", "S2", "S3", "S4")
zvieratka_spaci2

colnames(zvieratka_spaci2)[1] <- "Rating"
zvieratka_spaci2

zvieratka_spaci


print(str(zvieratka_spaci))
zvieratka_spaci$hodnotenie        

# -- Balicky --

#install.packages("openxlsx")
library("openxlsx")

data_excel <- read.xlsx("Data.xlsx", sheet = "Klienti")
#data_excel

#summary(data_excel)
sapply(data_excel, mean)

#install.packages("readxl")
library("readxl")
# n_max = 5
dataset <- read_excel("Data.xlsx",range = "A1:C5")
dataset

write.csv(dataset, "export.csv")
write.xlsx(dataset, "export.xlsx")

install.packages("caTools")

library(caTools) # Externý balík obsahujúci funkciu write.gif
jet.colors <- colorRampPalette(c("#00007F", "blue", "#007FFF", "cyan", "#7FFF7F",
                                 "yellow", "#FF7F00", "red", "#7F0000"))
m <- 1200 # definuje veľkosť
C <- complex( real=rep(seq(-1.8,0.6, length.out=m), each=m ),
              imag=rep(seq(-1.2,1.2, length.out=m), m ) )
C <- matrix(C,m,m) # # prevedie na štvorcovú maticu komplexných čísel
Z <- 0 # inicializuje Z ako 0
X <- array(0, c(m,m,20)) # inicializuje výstupné 3D pole
for (k in 1:20) { # cyklus s dvadsiatimi priebehmi
  Z <- Z^2+C             # kľúčová rovnica meniaca hodnotu Z
  X[,,k] <- exp(-abs(Z)) # záznam výsledku
}
write.gif(X, "Mandelbrot.gif", col=jet.colors, delay=1000)

# -- Riadiace_Struktury --

# if, else, else if
a <- 21
b <- 21

if (a > b){
    cat("a je vacsie b...")
} else if (a == b) {
    cat("a b su rovnake")
} else {
    cat("b je vacsie a...")
}

# for, while
# break, continue/next

i <- 1
while(i < 10) {
    cat(paste(i, "\n"))
    i <- i + 1
}

i <- 1
while(i < 10) {
    if (i == 5) {
        cat("Koncime ideme na obed")
        break
    }
    cat(paste(i, "\n"))
    i <- i + 1
}

i <- 1
while(i < 10) {
    cat(paste(i, "\n"))
    i <- i + 1

    if (i == 5) {
        cat("Koncime ideme na obed")
        # continue
        next
    }
    # ...
    cat("Nieco...")
    
}

produkty <- list("notebook ASUS", "tlaciaren HP", "myska Logitech")
for(produkt in produkty) {
    cat(paste(produkt, "\n"))
}

x <- 1
repeat {

    if (x > 4) {
        cat("Koncime...")
        break
    }

    cat("Chcem zit nonstop \n")

    x <- x + 1
}

# -- Funkcie --

# ## Funkcie (Podprogramy)


vypis_ahoj <- function() {
    print("Ahoj svet")
}

vypis_ahoj()

vypis_cele_meno_klient <- function(meno, priezvisko) {
    paste(meno, priezvisko)
}

vypis_cele_meno_klient("Adam", "Sangala")

# Globalny priestor/scope
a = 2
meno = "Karol"
cat(paste("Globalny priestor, pred funkciou: ", a, "\n"))

vypis_cele_meno_klient <- function(meno="Adam", priezvisko="Sangala") {
  # Lokalny priestor
  b = 3
  a <<- 7
  cat(paste("Lokalny priestor, vo funkcii: ", a , "\n"))
  # paste(meno, priezvisko, a, b )
}
cat(paste("Globalny priestor, pred funkciou: ", a, "\n"))

vypis_cele_meno_klient()

eye_color <- c(2,2,4,1,5,5,5,6,1,3,6,3,1,4)
feye_color <- factor(eye_color)
# levels(feye_color) <- c("amber","blue", "brown","gray","green","hazel")
feye_color

