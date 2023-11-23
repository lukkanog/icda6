library(dplyr)

#Integrando dados de municipios

DadosGravidez2021 <- DadosGravidez2021 %>%
  left_join(Municipios %>% select(CODMUNIC, uf_code), by = c("CODMUNNASC" = "CODMUNIC"), keep = TRUE) %>%
  select(-CODMUNIC) 
colnames(DadosGravidez2021)[colnames(DadosGravidez2021) == "uf_code"] <- "UF"

#Filtrando valores de parto não informados

DadosGravidez2021 <- DadosGravidez2021[DadosGravidez2021$PARTO != 9, ]
DadosGravidez2021 <- DadosGravidez2021[!is.na(DadosGravidez2021$PARTO), ]


#Filtrando valores nulos para colunas que serão utilizadas
DadosGravidez2021 <- DadosGravidez2021[!is.na(DadosGravidez2021$ESCMAE), ]
DadosGravidez2021 <- DadosGravidez2021[!is.na(DadosGravidez2021$RACACORMAE), ]
DadosGravidez2021 <- DadosGravidez2021[!is.na(DadosGravidez2021$IDADEMAE), ]
DadosGravidez2021 <- DadosGravidez2021[!is.na(DadosGravidez2021$GRAVIDEZ), ]
DadosGravidez2021 <- DadosGravidez2021[!is.na(DadosGravidez2021$UF), ]


#Criando novas colunas

DadosGravidez2021 <- DadosGravidez2021 %>% mutate(MAIORIDADE = ifelse(IDADEMAE > 19, 1, 0))
DadosGravidez2021 <- DadosGravidez2021 %>%
  mutate(FAIXAETARIA = sapply(IDADEMAE, separaFaixaEtaria))

#Variavel dependente
DadosGravidez2021$PARTO <- as.factor(DadosGravidez2021$PARTO)

#Variavel independente
DadosGravidez2021$ESCMAE = as.factor(DadosGravidez2021$ESCMAE)
DadosGravidez2021$RACACORMAE = as.factor(DadosGravidez2021$RACACORMAE)
DadosGravidez2021$LOCNASC = as.factor(DadosGravidez2021$LOCNASC)
DadosGravidez2021$FAIXAETARIA = as.factor(DadosGravidez2021$FAIXAETARIA)
DadosGravidez2021$GRAVIDEZ = as.factor(DadosGravidez2021$GRAVIDEZ)
DadosGravidez2021$PARIDADE = as.factor(DadosGravidez2021$PARIDADE)
DadosGravidez2021$UF = as.factor(DadosGravidez2021$UF)

View(DadosGravidez2021)


#Separando valores de teste e treinamento
NumerosLinhasTeste <- sample(1:nrow(DadosGravidez2021), 0.7 * nrow(DadosGravidez2021))
DadosGravidez2021Treinamento <- DadosGravidez2021[NumerosLinhasTeste, ]
DadosGravidez2021Teste <- DadosGravidez2021[-NumerosLinhasTeste, ]
