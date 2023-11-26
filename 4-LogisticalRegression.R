library(recipes)
library(caret)
library(pROC)


ModeloRegressaoLinear <- glm(PARTO ~ ESCMAE + RACACORMAE + LOCNASC + FAIXAETARIA + UF + GRAVIDEZ + PARIDADE + JA_TEVE_PARTO_CESARIA + JA_TEVE_PARTO_VAGINAL, 
                             data = DadosGravidez2021Treinamento, family = "binomial", na.action = na.exclude)
summary(ModeloRegressaoLinear)


#Matriz de confusão - Treinamento
DadosGravidez2021Treinamento$PARTO_PREDITO_REGRESSAO_LOGISTICA <- ifelse(predict(ModeloRegressaoLinear, newdata = DadosGravidez2021Treinamento) > 0.55, 2, 1)
TabelaDadosTreinamento <- table(predicted = DadosGravidez2021Treinamento$PARTO_PREDITO_REGRESSAO_LOGISTICA, actual = DadosGravidez2021Treinamento$PARTO)
confusionMatrix(TabelaDadosTreinamento, positive = "2")


#Curva ROC - Treinamento

RocCurveTreinamento <- roc(DadosGravidez2021Treinamento$PARTO, DadosGravidez2021Treinamento$PARTO_PREDITO_REGRESSAO_LOGISTICA, plot = TRUE, print.auc = TRUE)
legend("bottomright", legend = c("ROC Curve", "Random"), col = c("black", "gray"), lwd = 2)


#Matriz de confusão - Teste
DadosGravidez2021Teste$PARTO_PREDITO_REGRESSAO_LOGISTICA <- ifelse(predict(ModeloRegressaoLinear, newdata = DadosGravidez2021Teste) > 0.5, 2, 1)
TabelaDadosTeste <- table(predicted = DadosGravidez2021Teste$PARTO_PREDITO_REGRESSAO_LOGISTICA, actual = DadosGravidez2021Teste$PARTO)
confusionMatrix(TabelaDadosTeste, positive = "2")


#Curva ROC - Teste
RocCurveTeste <- roc(DadosGravidez2021Teste$PARTO, DadosGravidez2021Teste$PARTO_PREDITO_REGRESSAO_LOGISTICA, plot = TRUE, print.auc = TRUE)
legend("bottomright", legend = c("ROC Curve", "Random"), col = c("black", "gray"), lwd = 2)
