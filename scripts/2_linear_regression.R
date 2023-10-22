library(ggplot2)
library(dplyr)


View(MORTALIDADE_2021)

MORTALIDADE_2021$GRUPO_ETARIO = as.factor(MORTALIDADE_2021$GRUPO_ETARIO)
MORTALIDADE_2021$SEXO = as.factor(MORTALIDADE_2021$SEXO)
MORTALIDADE_2021$MORAVA_ONDE_NASCEU = as.factor(MORTALIDADE_2021$MORAVA_ONDE_NASCEU)
MORTALIDADE_2021$RACACOR = as.factor(MORTALIDADE_2021$RACACOR)
MORTALIDADE_2021$ESTCIV= as.factor(MORTALIDADE_2021$ESTCIV)
MORTALIDADE_2021$ESC = as.factor(MORTALIDADE_2021$ESC)
MORTALIDADE_2021$ESCMAE = as.factor(MORTALIDADE_2021$ESCMAE)

NumeroLinhasTeste <- sample(1:nrow(MORTALIDADE_2021), 0.7 * nrow(MORTALIDADE_2021))  # Index of training data rows
DadosDeTreinamento <- MORTALIDADE_2021[NumeroLinhasTeste, ]  # Training data
DadosDeTeste <- MORTALIDADE_2021[-NumeroLinhasTeste, ]  # Test data

modelo_regressao_mortes  = lm(GRUPO_ETARIO ~ SEXO+MORAVA_ONDE_NASCEU+RACACOR+ESTCIV+ESC, data = DadosDeTreinamento)
dist_train_mortes <- predict(modelo_regressao_mortes, DadosDeTreinamento)
dist_pred_mortes <- predict(modelo_regressao_mortes, DadosDeTeste)

pred_real_mortes <- data.frame(cbind(real_mortes=DadosDeTeste$GRUPO_ETARIO, predicao_mortes=dist_pred_mortes))

pred_real_mortes <- na.omit(pred_real_mortes)
pred_real_mortes$predicao_mortes <- round(pred_real_mortes$predicao_mortes)


min_max_acuracia_mortes <- mean(apply(pred_real_mortes, 1, min) / apply(pred_real_mortes, 1, max))  
mape_mortes <- mean(ifelse(pred_real_mortes$real == 0, 0, abs((pred_real_mortes$predicao - pred_real_mortes$real) / pred_real_mortes$real)))
                    

min_max_acuracia_mortes
mape_mortes
summary(modelo_regressao_mortes)$r.squared 
summary(modelo_regressao_mortes)$sigma
summary(modelo_regressao_mortes)$sigma/mean(DadosDeTeste$GRUPO_ETARIO)

View(pred_real_mortes)


pred_real_mortes$close_predictions <- ifelse(abs(pred_real_mortes$real_mortes - pred_real_mortes$predicao_mortes) <= 1, "Close", "Not Close")
close_count <- sum(pred_real_mortes$close_predictions == "Close")
total_count <- nrow(pred_real_mortes)

summary(pred_real_mortes$real_mortes)
summary(pred_real_mortes$predicao_mortes)
percentage_close <- (close_count / total_count) * 100
percentage_close
