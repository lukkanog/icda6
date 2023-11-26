library(ggplot2)

summary(DadosGravidez2021$PARTO)

ggplot(DadosGravidez2021, aes(x = LOCNASC, fill = PARTO)) +
  geom_bar(position = "dodge") +
  labs(title = "Tipo de parto por local de nascimento",
       x = "LOCNASC",
       y = "Count") +
  scale_fill_manual(values = c("blue", "red"), breaks = c(1, 2), labels = c("Vaginal", "Cesarea"))
View(DadosGravidezPartoSemEscolaridade)


ggplot(DadosGravidez2021, aes(x = ESTCIVMAE, fill = PARTO)) +
  geom_bar(position = "dodge") +
  labs(title = "Tipo de parto por situação conjugal da mãe",
       x = "LOCNASC",
       y = "Count") +
  scale_fill_manual(values = c("blue", "red"), breaks = c(1, 2), labels = c("Vaginal", "Cesarea"))

ggplot(subset(DadosGravidez2021, ESCMAE != 9), aes(x = ESCMAE, fill = PARTO)) +
  geom_bar(position = "dodge") +
  labs(title = "Tipo de parto por escolaridade da mãe",
       x = "LOCNASC",
       y = "Count") +
  scale_fill_manual(values = c("blue", "red"), breaks = c(1, 2), labels = c("Vaginal", "Cesarea"))


ggplot(DadosGravidez2021, aes(x = JA_TEVE_PARTO_VAGINAL, fill = PARTO)) +
  geom_bar(position = "dodge") +
  labs(title = "Tipo de parto se já teve parto vaginal",
       x = "LOCNASC",
       y = "Count") +
  scale_fill_manual(values = c("blue", "red"), breaks = c(1, 2), labels = c("Vaginal", "Cesarea"))

ggplot(DadosGravidez2021, aes(x = JA_TEVE_PARTO_CESARIA, fill = PARTO)) +
  geom_bar(position = "dodge") +
  labs(title = "Tipo de parto se já teve parto cesaria",
       x = "LOCNASC",
       y = "Count") +
  scale_fill_manual(values = c("blue", "red"), breaks = c(1, 2), labels = c("Vaginal", "Cesarea"))

ggplot(DadosGravidez2021, aes(x = UF, fill = PARTO)) +
  geom_bar(position = "dodge") +
  labs(title = "Tipo de parto por UF de nascimento",
       x = "LOCNASC",
       y = "Count") +
  scale_fill_manual(values = c("blue", "red"), breaks = c(1, 2), labels = c("Vaginal", "Cesarea"))


