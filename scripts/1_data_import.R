library(readr)
library(dplyr)


#IMPORTACAO DOS DADOS DE MORTALIDADE
Mortalidade <- read_delim("data/Mortalidade_Geral_2021.csv", delim = ";", escape_double = FALSE, trim_ws = TRUE)
View(Mortalidade)
#IMPORTACAO DOS DADOS DE MUNICIPIO
Municipios <- read_csv("data/Municipios.csv")
View(Municipios)


#CONVERSÂO DE DADOS, ADICIONANDO PROPRIEDADES IDADE EM ANOS, GRUPO ETARIO
Mortalidade['IDADE_EM_ANOS'] <- apply(Mortalidade['IDADE'], 1, calcularIdadeEmAnos)  
Mortalidade['GRUPO_ETARIO'] <- apply(Mortalidade['IDADE_EM_ANOS'], 1, separaFaixaEtariaPorIdade) 
Mortalidade['MAIOR_DE_IDADE'] <- apply(Mortalidade['IDADE_EM_ANOS'], 1, isAdult) 

#BUSCANDO DADOS DA UF


Mortalidade <- Mortalidade %>%
  left_join(Municipios %>% select(CODMUNIC, uf_code), by = c("CODMUNRES" = "CODMUNIC"), keep = TRUE) %>%
  select(-CODMUNIC) 

colnames(Mortalidade)[colnames(Mortalidade) == "uf_code"] <- "UF"

#Separando por mortalidade infantil e adulta
MortalidadeInfantil <- Mortalidade[Mortalidade$MAIOR_DE_IDADE == 0, ]
MortalidadeInfantil['GRUPO_ETARIO'] <- apply(MortalidadeInfantil['IDADE_EM_ANOS'], 1, separaFaixaEtariaInfantil)
View(MortalidadeInfantil)

MortalidadeAdulta <- Mortalidade[Mortalidade$MAIOR_DE_IDADE == 1, ]
MortalidadeAdulta['GRUPO_ETARIO'] <- apply(MortalidadeAdulta['IDADE_EM_ANOS'], 1, separaFaixaEtariaAdultos)
View(MortalidadeAdulta)


#Gerando dados de teste e treinamento
MortalidadeInfantilNumeroLinhasTeste <- sample(1:nrow(MortalidadeInfantil), 0.7 * nrow(MortalidadeInfantil))  
MortalidadeAdultaNumeroLinhasTeste <- sample(1:nrow(MortalidadeAdulta), 0.7 * nrow(MortalidadeAdulta))


MortalidadeInfantilTreinamento <- MortalidadeInfantil[MortalidadeInfantilNumeroLinhasTeste, ]
MortalidadeInfantilTeste <- MortalidadeInfantil[-MortalidadeInfantilNumeroLinhasTeste, ]

MortalidadeAdultaTreinamento <- MortalidadeAdulta[MortalidadeAdultaNumeroLinhasTeste, ]
MortalidadeAdultaTeste <- MortalidadeAdulta[-MortalidadeAdultaNumeroLinhasTeste, ]


