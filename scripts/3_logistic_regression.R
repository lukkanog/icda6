
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


