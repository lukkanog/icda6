library(readr)
library(dplyr)


MORTALIDADE_2021 <- read_delim("data/Mortalidade_Geral_2021.csv", delim = ";", escape_double = FALSE, trim_ws = TRUE)rm(MORTALIDADE_2021)
MORTALIDADE_2021['IDADE_EM_ANOS'] <- apply(MORTALIDADE_2021['IDADE'], 1, calcularIdadeEmAnos)  

