library(randomForest)
library(pROC)

set.seed(21)

head_df_treinamento <- head(DadosGravidez2021Treinamento, 10000)

head_df_teste <- head(DadosGravidez2021Teste, 10000)

rf <-
  randomForest(
    formula =  PARTO ~ ESCMAE + RACACORMAE + LOCNASC + FAIXAETARIA + UF + GRAVIDEZ + PARIDADE + JA_TEVE_PARTO_CESARIA + JA_TEVE_PARTO_VAGINAL,
    data = head_df_treinamento,
    importance = TRUE,
    # proximity = TRUE,
    maxnodes=1000
  )

prediction <- predict(rf, head_df_teste)

head_df_teste$CORRECT_PREDICTION <- prediction
head_df_teste$CORRECT_PREDICTION <- head_df_teste$PARTO == head_df_teste$CORRECT_PREDICTION

summary(head_df_teste$CORRECT_PREDICTION)

View(head(head_df_teste))

cm <- confusionMatrix(data=prediction, reference = head_df_teste$PARTO)
cm