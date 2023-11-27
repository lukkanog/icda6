install.packages("arules")
install.packages("arulesViz")

library(arules)
library(arulesViz)
library(corrplot)
library(ggplot2)

summary(DadosGravidez2021$PARTO)

ggplot(DadosGravidez2021, aes(x = LOCNASC, fill = PARTO)) +
  geom_bar() +
  labs(title = "Tipo de parto por local de nascimento",
       x = "Local de Nascimento",
       y = "Quantidade") +
  scale_fill_manual(values = c("blue", "red"), breaks = c(1, 2), labels = c("Vaginal", "Cesárea")) +
  scale_x_discrete(labels = c("Hospital", "Outros", "Domicílio", "Outros", "Aldeia Indígena"))

View(DadosGravidezPartoSemEscolaridade)


ggplot(DadosGravidez2021, aes(x = ESTCIVMAE, fill = PARTO)) +
  geom_bar() +
  labs(title = "Tipo de parto por situação conjugal da mãe",
       x = "Estado civil da mãe",
       y = "Quantidade") +
  scale_fill_manual(values = c("blue", "red"), breaks = c(1, 2), labels = c("Vaginal", "Cesarea")) +
  scale_x_discrete(labels = c("Solteira", "Casada", "Viúva", "Separada judicialmente/divorciada", "União Estável"))


ggplot(subset(DadosGravidez2021, ESCMAE != 9), aes(x = ESCMAE, fill = PARTO)) +
  geom_bar() +
  labs(title = "Tipo de parto por escolaridade da mãe",
       x = "Escolaridade da mãe (em anos)",
       y = "Quantidade") +
  scale_fill_manual(values = c("blue", "red"), breaks = c(1, 2), labels = c("Vaginal", "Cesarea")) +
  scale_x_discrete(labels = c("Nenhuma", "1 a 3", "4 a 7", "8 a 11", "12 e mais"))

ggplot(DadosGravidez2021, aes(x = JA_TEVE_PARTO_VAGINAL, fill = PARTO)) +
  geom_bar() +
  labs(title = "Tipo de parto se já teve parto vaginal",
       x = "Já teve parto vaginal?",
       y = "Quantidade") +
  scale_fill_manual(values = c("blue", "red"), breaks = c(1, 2), labels = c("Vaginal", "Cesarea")) +
  scale_x_discrete(labels = c("Não", "Sim"))

ggplot(DadosGravidez2021, aes(x = JA_TEVE_PARTO_CESARIA, fill = PARTO)) +
  geom_bar() +
  labs(title = "Tipo de parto se já teve parto cesárea",
       x = "Já teve parto cesárea?",
       y = "Quantidade") +
  scale_fill_manual(values = c("blue", "red"), breaks = c(1, 2), labels = c("Vaginal", "Cesarea")) +
  scale_x_discrete(labels = c("Não", "Sim"))

ggplot(DadosGravidez2021, aes(x = UF, fill = PARTO)) +
  geom_bar() +
  labs(title = "Tipo de parto por UF de nascimento",
       x = "UF",
       y = "Quantidade") +
  scale_fill_manual(values = c("blue", "red"), breaks = c(1, 2), labels = c("Vaginal", "Cesarea"))

ggplot(DadosGravidez2021, aes(x = PARTO, y = IDADEMAE)) +
  geom_boxplot(fill = c("blue", "red"), color = "black") +
  labs(title = "Boxplot da Idade da Mãe por Tipo de Parto",
       x = "Tipo de Parto",
       y = "Idade da Mãe") +
  scale_x_discrete(labels = c("Vaginal", "Cesárea"))


