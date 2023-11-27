

library(corrplot)
library(ggplot2)
library(data.table)
library(mltools)

View(head(DadosGravidez2021))

data_for_cor<-DadosGravidez2021[c(
  "ESCMAE", "RACACORMAE", "LOCNASC", "FAIXAETARIA", "UF", "GRAVIDEZ", "PARIDADE", "JA_TEVE_PARTO_CESARIA", "JA_TEVE_PARTO_VAGINAL", "PARTO"
  
)]
# data_for_cor$PARTO_numeric <- as.numeric(DadosGravidez2021$PARTO)

data_for_cor <- one_hot(as.data.table(data_for_cor))

head(data_for_cor)

str(data_for_cor)

# data_for_cor$QTDPARTNOR <- as.numeric(data_for_cor$QTDPARTNOR )
# 
# data_for_cor$QTDPARTCES <- as.numeric(data_for_cor$QTDPARTCES)

cor_matrix <- cor(data_for_cor)

cor_with_PARTO_1 <- cor_matrix["PARTO_1",]

str(data_for_cor)

ggplot(data.frame(variable = names(cor_with_PARTO_1)[-1], correlation = cor_with_PARTO_1[-1]),
       aes(x = variable, y = correlation)) +
  geom_bar(stat = "identity", fill = "skyblue", color = "black") +
  labs(title = "Correlation with PARTO 1",
       x = "Variable",
       y = "Correlation") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
# 
# cor_with_PARTO_2 <- cor_matrix["PARTO_2",]
# 
# ggplot(data.frame(variable = names(cor_with_PARTO_2)[-1], correlation = cor_with_PARTO_2[-1]),
#        aes(x = variable, y = correlation)) +
#   geom_bar(stat = "identity", fill = "skyblue", color = "black") +
#   labs(title = "Correlation with PARTO 2",
#        x = "Variable",
#        y = "Correlation") +
#   theme(axis.text.x = element_text(angle = 45, hjust = 1))


# heatmap(cor_matrix,
#         Rowv = NULL, Colv = NULL,
#         col = colorRampPalette(c("blue", "white", "red"))(20),
#         margins = c(5, 10))
# 
# corrplot(cor_matrix, method = "circle")
