library(rpart)
library(rpart.plot)

ArvoreGravidezTreinamento <- rpart(formula =  PARTO ~ ESCMAE + RACACORMAE + LOCNASC + FAIXAETARIA + UF + GRAVIDEZ + PARIDADE + JA_TEVE_PARTO_CESARIA + JA_TEVE_PARTO_VAGINAL,
                   data = DadosGravidez2021Treinamento,
                   method = "class",
                   xval = 10,
                   control = rpart.control(cp = 0.0001) 
)

rpart.plot(ArvoreGravidezTreinamento)
printcp(ArvoreGravidezTreinamento)
plotcp(ArvoreGravidezTreinamento)

ArvoreGravidezTreinamento.class <- prune(ArvoreGravidezTreinamento, 
                         cp = ArvoreGravidezTreinamento$cptable[which.min(ArvoreGravidezTreinamento$cptable[, "xerror"]), "CP"])

rpart.plot(ArvoreGravidezTreinamento.class)
printcp(ArvoreGravidezTreinamento.class)
plotcp(ArvoreGravidezTreinamento.class)

#Prevendo com dados de treinamento
DadosGravidez2021Treinamento$PARTO_PREDITO_ARVORE_DECISAO <- predict(ArvoreGravidezTreinamento.class, DadosGravidez2021Treinamento, type = "class")

#Avaliação do modelo com dados de treinamento
MatrizDeConfusaoTreinamentoArvore <- confusionMatrix(
  data = DadosGravidez2021Treinamento$PARTO_PREDITO_ARVORE_DECISAO,
  reference = DadosGravidez2021Treinamento$PARTO)
MatrizDeConfusaoTreinamentoArvore

#Montando a curva ROC com dados de treinamento
PredicaoTreinamentoArvoreCurvaROC <- predict(ArvoreGravidezTreinamento.class, DadosGravidez2021Treinamento, type = "prob")[, 1]
RocCurveTreinamentoArvore<-roc(DadosGravidez2021Treinamento$PARTO ~ PredicaoTreinamentoArvoreCurvaROC, plot = TRUE, print.auc = TRUE)
legend("bottomright", legend = c("Curva ROC", "Aleatório"), col = c("black", "gray"), lwd = 2)



#Prevendo com dados de teste
DadosGravidez2021Teste$PARTO_PREDITO_ARVORE_DECISAO <- predict(ArvoreGravidezTreinamento.class, DadosGravidez2021Teste, type = "class")

#Avaliação do modelo com dados de teste
MatrizDeConfusaoTesteArvore <- confusionMatrix(
  data = DadosGravidez2021Teste$PARTO_PREDITO_ARVORE_DECISAO,
  reference = DadosGravidez2021Teste$PARTO)
MatrizDeConfusaoTesteArvore

#Montando a curva ROC com dados de teste
PredicaoTesteArvoreCurvaROC <- predict(ArvoreGravidezTreinamento.class, DadosGravidez2021Teste, type = "prob")[, 1]
RocCurveTesteArvore<-roc(DadosGravidez2021Teste$PARTO ~ PredicaoTesteArvoreCurvaROC, plot = TRUE, print.auc = TRUE)
legend("bottomright", legend = c("Curva ROC", "Aleatório"), col = c("black", "gray"), lwd = 2)



