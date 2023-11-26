install.packages("corrplot")

library(corrplot)
library(ggplot2)

data_for_cor<-DadosGravidez2021
data_for_cor$PARTO_numeric <- as.numeric(DadosGravidez2021$PARTO)

factor_columns <- sapply(data_for_cor, is.factor)
data_for_cor[factor_columns] <- lapply(data_for_cor[factor_columns], function(x) as.numeric(as.character(x)))

char_columns <- sapply(data_for_cor, is.character)
data_for_cor[char_columns] <- lapply(data_for_cor[char_columns], as.numeric)

data_for_cor$PARTO_numeric <- as.numeric(as.character(data_for_cor$PARTO))

vars_for_correlation <- c("ESCMAE", "RACACORMAE", "LOCNASC", "CODMUNNASC", "PARIDADE",
                          "GRAVIDEZ", "QTDPARTCES", "IDADEMAE", "ESTCIVMAE",
                          "MAIORIDADE", "JA_TEVE_PARTO_CESARIA", "JA_TEVE_PARTO_VAGINAL",
                          "FAIXAETARIA")

cor_matrix <- cor(data_for_cor[, c("PARTO_numeric", vars_for_correlation)])

cor_with_PARTO <- cor_matrix["PARTO_numeric", ]


ggplot(data.frame(variable = names(cor_with_PARTO)[-1], correlation = cor_with_PARTO[-1]),
       aes(x = variable, y = correlation)) +
  geom_bar(stat = "identity", fill = "skyblue", color = "black") +
  labs(title = "Correlation with PARTO",
       x = "Variable",
       y = "Correlation") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


heatmap(cor_matrix,
        Rowv = NULL, Colv = NULL,
        col = colorRampPalette(c("blue", "white", "red"))(20),
        margins = c(5, 10))

corrplot(cor_matrix, method = "circle")