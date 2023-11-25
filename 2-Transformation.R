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
DadosGravidez2021 <- DadosGravidez2021[!is.na(DadosGravidez2021$QTDPARTCES), ]
DadosGravidez2021 <- DadosGravidez2021[!is.na(DadosGravidez2021$QTDPARTNOR), ]


#Criando novas colunas

DadosGravidez2021 <- DadosGravidez2021 %>% mutate(MAIORIDADE = ifelse(IDADEMAE > 19, 1, 0))
DadosGravidez2021 <- DadosGravidez2021 %>% mutate(JA_TEVE_PARTO_CESARIA = ifelse(QTDPARTCES == "00", 0, 1))
DadosGravidez2021 <- DadosGravidez2021 %>% mutate(JA_TEVE_PARTO_VAGINAL = ifelse(QTDPARTNOR == "00", 0, 1))
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
DadosGravidez2021$ESTCIVMAE = as.factor(DadosGravidez2021$ESTCIVMAE)
DadosGravidez2021$UF = as.factor(DadosGravidez2021$UF)
DadosGravidez2021$JA_TEVE_PARTO_CESARIA = as.factor(DadosGravidez2021$JA_TEVE_PARTO_CESARIA)
DadosGravidez2021$JA_TEVE_PARTO_VAGINAL = as.factor(DadosGravidez2021$JA_TEVE_PARTO_VAGINAL)

View(DadosGravidez2021)


#Separando valores de teste e treinamento
NumerosLinhasTeste <- sample(1:nrow(DadosGravidez2021), 0.7 * nrow(DadosGravidez2021))
DadosGravidez2021Treinamento <- DadosGravidez2021[NumerosLinhasTeste, ]
DadosGravidez2021Teste <- DadosGravidez2021[-NumerosLinhasTeste, ]
