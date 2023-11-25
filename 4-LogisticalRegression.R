library(recipes)
library(caret)
library(pROC)


ModeloRegressaoLinear <- glm(PARTO ~ ESCMAE + RACACORMAE + LOCNASC + FAIXAETARIA + UF + GRAVIDEZ + PARIDADE + JA_TEVE_PARTO_CESARIA + JA_TEVE_PARTO_VAGINAL, 
                             data = DadosGravidez2021Treinamento, family = "binomial", na.action = na.exclude)
summary(ModeloRegressaoLinear)


#Matriz de confusão - Treinamento
DadosGravidez2021Treinamento$PARTO_PREDITO_REGRESSAO_LOGISTICA <- ifelse(predict(ModeloRegressaoLinear, newdata = DadosGravidez2021Treinamento) > 0.5, 2, 1)
table(predicted = DadosGravidez2021Treinamento$PARTO_PREDITO_REGRESSAO_LOGISTICA, actual = DadosGravidez2021Treinamento$PARTO)


#Matriz de confusão - Teste
DadosGravidez2021Teste$PARTO_PREDITO_REGRESSAO_LOGISTICA <- ifelse(predict(ModeloRegressaoLinear, newdata = DadosGravidez2021Teste) > 0.5, 2, 1)
table(predicted = DadosGravidez2021Teste$PARTO_PREDITO_REGRESSAO_LOGISTICA, actual = DadosGravidez2021Teste$PARTO)


TabelaDadosTreinamento <- table(predicted = DadosGravidez2021Treinamento$PARTO_PREDITO_REGRESSAO_LOGISTICA, actual = DadosGravidez2021Treinamento$PARTO)
confusionMatrix(TabelaDadosTreinamento, positive = "2")

TabelaDadosTeste <- table(predicted = DadosGravidez2021Teste$PARTO_PREDITO_REGRESSAO_LOGISTICA, actual = DadosGravidez2021Teste$PARTO)
confusionMatrix(TabelaDadosTeste, positive = "2")


RocCurveTreinamento <- roc(DadosGravidez2021Treinamento$PARTO, DadosGravidez2021Treinamento$PARTO_PREDITO_REGRESSAO_LOGISTICA)
plot(RocCurveTreinamento, main = "ROC Curve", col = "blue", lwd = 2)
abline(a = 0, b = 1, col = "gray", lty = 2)
legend("bottomright", legend = c("ROC Curve", "Random"), col = c("blue", "gray"), lwd = 2)
ROCAUCTreinamento <- auc(RocCurveTreinamento)
cat("AUC:", ROCAUCTreinamento, "\n")


RocCurveTeste <- roc(DadosGravidez2021Teste$PARTO, DadosGravidez2021Teste$PARTO_PREDITO_REGRESSAO_LOGISTICA)
plot(RocCurveTeste, main = "ROC Curve", col = "blue", lwd = 2)
abline(a = 0, b = 1, col = "gray", lty = 2)
legend("bottomright", legend = c("ROC Curve", "Random"), col = c("blue", "gray"), lwd = 2)
ROCAUCTeste <- auc(RocCurveTeste)
cat("AUC:", ROCAUCTeste, "\n")
