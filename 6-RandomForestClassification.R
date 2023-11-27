library(randomForest)
library(pROC)
library(caret)
library(ggplot2)

set.seed(21)

#head_df_treinamento <- head(DadosGravidez2021Treinamento, 500000)

# head_df_treinamento <- DadosGravidez2021Treinamento

# head_df_teste <- head(DadosGravidez2021Teste, 500000)

glimpse(DadosGravidez2021Treinamento)

glimpse(DadosGravidez2021Teste)

rf <-
  randomForest(
    formula =  PARTO ~ ESCMAE + RACACORMAE + LOCNASC + FAIXAETARIA + UF + GRAVIDEZ + PARIDADE + JA_TEVE_PARTO_CESARIA + JA_TEVE_PARTO_VAGINAL,
    data = DadosGravidez2021Treinamento,
    importance = FALSE,
    # proximity = TRUE,
    ntree=1000,
    maxnodes=10
  )

prediction <- predict(rf, DadosGravidez2021Teste)

# DadosGravidez2021Teste$CORRECT_PREDICTION <- prediction
# DadosGravidez2021Teste$CORRECT_PREDICTION <- head_df_teste$PARTO == DadosGravidez2021Teste$CORRECT_PREDICTION
# 
# summary(DadosGravidez2021Teste$CORRECT_PREDICTION)

# DadosGravidez2021Teste$CORRECT_PREDICTION <- NULL

View(head(DadosGravidez2021Teste))

str(DadosGravidez2021Teste)

str(DadosGravidez2021Teste$PARTO)

cm <- confusionMatrix(data=prediction, reference = DadosGravidez2021Teste$PARTO)
cm


ArvoreGravidezTreinamento.class.pred_6 <- predict(rf, DadosGravidez2021Teste, type = "prob")[, 2]
ArvoreGravidezTreinamento.class_roc_6<-roc(DadosGravidez2021Teste$PARTO ~ ArvoreGravidezTreinamento.class.pred_6, plot = TRUE, print.auc = TRUE)


# df_1000 = head(DadosGravidez2021Teste, 1000)

# features <- setdiff(names(DadosGravidez2021Treinamento), "PARTO")
# m2 <- tuneRF(
#   x          = DadosGravidez2021Treinamento[features],
#   y          = DadosGravidez2021Treinamento$PARTO,
#   ntreeTry   = 500,
#   mtryStart  = 5,
#   stepFactor = 1.5,
#   improve    = 0.01,
#   trace      = TRUE     
# )
