
library(dplyr)

DEATHS <- MORTALIDADE_2021 %>% filter(!is.na(CIRCOBITO), CIRCOBITO %in% c(2, 3))


str(DEATHS)

DEATHS$CIRCOBITO <- as.factor(DEATHS$CIRCOBITO)
DEATHS$SEXO <- as.factor(DEATHS$SEXO)
DEATHS$RACACOR <- as.factor(DEATHS$RACACOR)

set.seed(42)

NumeroLinhasTeste <- sample(1:nrow(DEATHS), 0.7 * nrow(DEATHS))  # Index of training data rows
DadosDeTreinamento <- DEATHS[NumeroLinhasTeste, ]  # Training data
DadosDeTeste <- DEATHS[-NumeroLinhasTeste, ]  # Test data


modelo <- glm(CIRCOBITO ~ SEXO + RACACOR + IDADE_EM_ANOS, data = DadosDeTreinamento, family = "binomial", na.action = na.exclude)
summary(modelo)
(predict(modelo, type = "response"))


PredicaoMortesTreinamento <- ifelse(predict(modelo, type = "response") < 0.5, "SUICIDIO", "HOMICIDIO")
head(trn_pred_death)


DadosDeTreinamento<-DadosDeTreinamento%>%
  mutate(CIRCOBITO_2 = ifelse(CIRCOBITO==2,"SUICIDIO","HOMICIDIO"))

TabelaContigenciaTreinamento <- table(predicted = PredicaoMortesTreinamento, actual = DadosDeTreinamento$CIRCOBITO_2)
TabelaContigenciaTreinamento

DadosDeTeste<-DadosDeTeste%>%
  mutate(CIRCOBITO_2 = ifelse(CIRCOBITO==2,"SUICIDIO","HOMICIDIO"))


PredicaoMortesTeste <- ifelse(predict(modelo, newdata = DadosDeTeste, type = "response") < 0.5, "SUICIDIO", "HOMICIDIO")
TabelaContigenciaTeste <- table(predicted = PredicaoMortesTreinamento, actual = DadosDeTreinamento$CIRCOBITO_2)
TabelaContigenciaTeste


# Treinamento com informações adicionais



NumeroLinhasTeste <- sample(1:nrow(MORTALIDADE_2021), 0.7 * nrow(MORTALIDADE_2021))  # Index of training data rows
DadosDeTreinamento <- MORTALIDADE_2021[NumeroLinhasTeste, ]  # Training data
DadosDeTeste <- MORTALIDADE_2021[-NumeroLinhasTeste, ]  # Test data

MORTALIDADE_2021$GRUPO_ETARIO = as.factor(MORTALIDADE_2021$GRUPO_ETARIO)
MORTALIDADE_2021$SEXO = as.factor(MORTALIDADE_2021$SEXO)
MORTALIDADE_2021$RACACOR = as.factor(MORTALIDADE_2021$RACACOR)
MORTALIDADE_2021$MORREU_ONDE_NASCEU = as.factor(MORTALIDADE_2021$MORREU_ONDE_NASCEU)

modelo <- glm(GRUPO_ETARIO ~ SEXO + RACACOR + MORREU_ONDE_NASCEU, data = DadosDeTreinamento, family = "binomial", na.action = na.exclude)
summary(modelo)
(predict(modelo, type = "response"))

