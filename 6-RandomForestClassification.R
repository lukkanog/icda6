install.packages('randomForest')

library(randomForest)
library(pROC)
library(caret)
library(ggplot2)

set.seed(21)

rf <-
  randomForest(
    formula =  PARTO ~ ESCMAE + RACACORMAE + LOCNASC + FAIXAETARIA + UF + GRAVIDEZ + PARIDADE + JA_TEVE_PARTO_CESARIA + JA_TEVE_PARTO_VAGINAL,
    data = DadosGravidez2021Treinamento,
    importance = FALSE,
    ntree=1000,
    maxnodes=10
  )


#Prevendo com dados de treinamento
DadosGravidez2021Treinamento$PARTO_PREDITO_RANDOM_FOREST <- predict(rf, DadosGravidez2021Treinamento, type = "class")

#Avaliação do modelo com dados de treinamento
MatrizDeConfusaoTreinamentoForest <- confusionMatrix(
  data = DadosGravidez2021Treinamento$PARTO_PREDITO_RANDOM_FOREST,
  reference = DadosGravidez2021Treinamento$PARTO)
MatrizDeConfusaoTreinamentoForest

#Montando a curva ROC com dados de treinamento
PredicaoTreinamentoForestCurvaROC <- predict(rf, DadosGravidez2021Treinamento, type = "prob")[, 1]
RocCurveTreinamentoForest<-roc(DadosGravidez2021Treinamento$PARTO ~ PredicaoTreinamentoForestCurvaROC, plot = TRUE, print.auc = TRUE)


#Prevendo com dados de teste
DadosGravidez2021Teste$PARTO_PREDITO_RANDOM_FOREST <- predict(rf, DadosGravidez2021Teste, type = "class")

#Avaliação do modelo com dados de treinamento
MatrizDeConfusaoTesteForest <- confusionMatrix(
  data = DadosGravidez2021Teste$PARTO_PREDITO_RANDOM_FOREST,
  reference = DadosGravidez2021Teste$PARTO)
MatrizDeConfusaoTesteForest

#Montando a curva ROC com dados de treinamento
PredicaoTesteForestCurvaROC <- predict(rf, DadosGravidez2021Teste, type = "prob")[, 1]
RocCurveTesteForest<-roc(DadosGravidez2021Teste$PARTO ~ PredicaoTesteForestCurvaROC, plot = TRUE, print.auc = TRUE)

