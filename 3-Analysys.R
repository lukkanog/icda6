library(ggplot2)

summary(DadosGravidez2021$PARTO)

ggplot(DadosGravidez2021, aes(x = LOCNASC, fill = PARTO)) +
  geom_bar(position = "dodge") +
  labs(title = "PARTO value count for each LOCNASC value",
       x = "LOCNASC",
       y = "Count") +
  scale_fill_manual(values = c("1" = "blue", "2" = "red"))
View(DadosGravidezPartoSemEscolaridade)


ggplot(subset(DadosGravidez2021, GRAVIDEZ != 2), aes(x = GRAVIDEZ, fill = PARTO)) +
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


ggplot(DadosGravidez2021, aes(x = JA_FEZ_CESAREA, fill = PARTO)) +
  geom_bar(position = "dodge") +
  labs(title = "Tipo de parto se já fez vaginal",
       x = "LOCNASC",
       y = "Count") +
  scale_fill_manual(values = c("blue", "red"), breaks = c(1, 2), labels = c("Vaginal", "Cesarea"))

ggplot(DadosGravidez2021, aes(x = UF, fill = PARTO)) +
  geom_bar(position = "dodge") +
  labs(title = "Tipo de parto por escolaridade da mãe",
       x = "LOCNASC",
       y = "Count") +
  scale_fill_manual(values = c("blue", "red"), breaks = c(1, 2), labels = c("Vaginal", "Cesarea"))

ggplot(subset(DadosGravidez2021, QTDGESTANT < "08"), aes(x = QTDPARTCES, fill = PARTO)) +
  geom_bar(position = "dodge") +
  labs(title = "Tipo de parto por escolaridade da mãe",
       x = "LOCNASC",
       y = "Count") +
  scale_fill_manual(values = c("blue", "red"), breaks = c(1, 2), labels = c("Vaginal", "Cesarea"))
