library(readr)
library(dplyr)


MORTALIDADE_2021 <- read_delim("data/Mortalidade_Geral_2021.csv", delim = ";", escape_double = FALSE, trim_ws = TRUE)rm(MORTALIDADE_2021)
MORTALIDADE_2021['IDADE_EM_ANOS'] <- apply(MORTALIDADE_2021['IDADE'], 1, calcularIdadeEmAnos)  
MORTALIDADE_2021$GRUPO_ETARIO <- sapply(MORTALIDADE_2021$IDADE_EM_ANOS, separaFaixaEtariaPorIdade)
MORTALIDADE_2021['GRUPO_ETARIO'] <- apply(MORTALIDADE_2021['IDADE_EM_ANOS'], 1, separaFaixaEtariaPorIdade)  
MORTALIDADE_2021['MORAVA_ONDE_NASCEU'] <- apply(MORTALIDADE_2021)
MORTALIDADE_2021_filtrado <- MORTALIDADE_2021[MORTALIDADE_2021$GRUPO_ETARIO != -1, ]

MORTALIDADE_2021 <- MORTALIDADE_2021 %>%
  mutate(IGUAIS = valoresSaoIguais(CODMUNRES, CODMUNNATU))
MORTALIDADE_2021
View(MORTALIDADE_2021_filtrado)
PRESIDENTE_PRUDENTE = MORTALIDADE_2021[MORTALIDADE_2021$CODMUNNATU == 3542206, ]

library(dplyr)


# Crie um novo dataframe que mantém apenas os registros com CODMUNNATU contendo "50308".
novo_dataframe <- MORTALIDADE_2021 %>%
  filter(grepl("35", CODMUNNATU))

# Visualize as primeiras linhas do novo dataframe.
View(PRESIDENTE_PRUDENTE)
