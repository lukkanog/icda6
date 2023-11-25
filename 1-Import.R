library(readr)
DadosGravidez2021 <- read_delim("data/SINASC_2021.csv", 
                                delim = ";", escape_double = FALSE, trim_ws = TRUE)

Municipios <- read_csv("data/Municipios.csv")



View(DadosGravidez2021)
View(Municipios)
