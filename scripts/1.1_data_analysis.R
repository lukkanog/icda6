library(ggplot2)

# Crie um gráfico de barras para visualizar a contagem de cada grupo etário.
ggplot(data = subset(MORTALIDADE_2021_filtrado, RACACOR == 2, SEXO = 1), aes(x = factor(GRUPO_ETARIO))) +
  geom_bar() +
  labs(x = "Grupo Etário", y = "Contagem") +
  scale_x_discrete(labels = c(
    "0 - 10", "11 - 20", "21 - 30", "31 - 40", "41 - 50",
    "51 - 60", "61 - 70", "71 - 80", "81 - 90", "91+"
  )) +
  theme_minimal()

MORTALIDADE_2021_MULHERES <- MORTALIDADE_2021_filtrado[MORTALIDADE_2021_filtrado$SEXO == 2, ]
MORTALIDADE_2021_MULHERES_MUDARAM <- MORTALIDADE_2021_MULHERES[MORTALIDADE_2021_MULHERES$IGUAIS == FALSE, ]
MORTALIDADE_2021_MULHERES_NAOMUDARAM <- MORTALIDADE_2021_MULHERES[MORTALIDADE_2021_MULHERES$IGUAIS != FALSE, ]


ggplot(data = subset(MORTALIDADE_2021_MULHERES_NAOMUDARAM, OBITOFE1 == 2), aes(x = factor(GRUPO_ETARIO))) +
  geom_bar() +
  labs(x = "Grupo Etário", y = "Contagem") +
  scale_x_discrete(labels = c(
    "0 - 10", "11 - 20", "21 - 30", "31 - 40", "41 - 50",
    "51 - 60", "61 - 70", "71 - 80", "81 - 90", "91+"
  )) +
  theme_minimal()

ggplot(data = subset(MORTALIDADE_2021_filtrado, RACACOR == 5), aes(x = factor(GRUPO_ETARIO), fill = factor(SEXO))) +
  geom_bar(position = position_dodge(width = 0.7), width = 0.7) +
  scale_fill_manual(values = c("1" = "red", "2" = "blue")) +
  labs(x = "Grupo Etário", y = "Contagem") +
  scale_x_discrete(labels = c(
    "0 - 10", "11 - 20", "21 - 30", "31 - 40", "41 - 50",
    "51 - 60", "61 - 70", "71 - 80", "81 - 90", "91+"
  )) +
  theme_minimal()


GRUPO_ETARIO <- SEXO, RACACOR, ESTCIV


//Levantar dado se a pessoa morreu enquanto morava no mesmo municipio que nasceu