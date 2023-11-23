library(rpart)
library(rpart.plot)

ArvoreGravidezTreinamento <- rpart(formula =  PARTO ~ ESCMAE + RACACORMAE + LOCNASC + FAIXAETARIA + UF + GRAVIDEZ + PARIDADE + JA_FEZ_CESAREA + JA_FEZ_VAGINAL,
                   data = DadosGravidez2021Treinamento,
                   method = "class",  # classificação
                   xval = 10  # 10-fold cross-validation 
)

rpart.plot(ArvoreGravidezTreinamento)
printcp(ArvoreGravidezTreinamento)

ArvoreGravidezTreinamento.class <- prune(ArvoreGravidezTreinamento, 
                         cp = ArvoreGravidezTreinamento$cptable[which.min(ArvoreGravidezTreinamento$cptable[, "xerror"]), "CP"])

rpart.plot(ArvoreGravidezTreinamento.class)


#Prevendo com dados de treinamento
ArvoreGravidezTreinamento.class.pred <- predict(ArvoreGravidezTreinamento.class, DadosGravidez2021Treinamento, type = "class")

#Avaliação do modelo com dados de treinamento
ArvoreGravidezTreinamento.class.conf <- confusionMatrix(data = ArvoreGravidezTreinamento.class.pred,reference = DadosGravidez2021Treinamento$PARTO)
ArvoreGravidezTreinamento.class.conf

#Montando a curva ROC com dados de treinamento
ArvoreGravidezTreinamento.class.pred_1 <- predict(ArvoreGravidezTreinamento.class, DadosGravidez2021Treinamento, type = "prob")[, 2]
ArvoreGravidezTreinamento.class_roc<-roc(DadosGravidez2021Treinamento$PARTO ~ ArvoreGravidezTreinamento.class.pred_1, plot = TRUE, print.auc = TRUE)



#ARRUMAR VARIAVEIS DAQUI PRA BAIXO
#Prevendo com dados de teste
DadosGravidez2021Teste.PARTO_PREDITO <- predict(ArvoreGravidezTreinamento.class, DadosGravidez2021Teste, type = "class")

#Avaliação do modelo com dados de teste
ArvoreGravidezTreinamento.class.conf <- confusionMatrix(data = DadosGravidez2021Teste.PARTO_PREDITO ,reference = DadosGravidez2021Teste$PARTO)
ArvoreGravidezTreinamento.class.conf

#Montando a curva ROC com dados de teste
ArvoreGravidezTreinamento.class.pred_1 <- predict(ArvoreGravidezTreinamento.class, DadosGravidez2021Teste, type = "prob")[, 2]
ArvoreGravidezTreinamento.class_roc<-roc(DadosGravidez2021Teste$PARTO ~ ArvoreGravidezTreinamento.class.pred_1, plot = TRUE, print.auc = TRUE)
