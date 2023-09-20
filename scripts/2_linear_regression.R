library(ggplot2)
library(dplyr)

View(MORTALIDADE_2021)



lm_idade = lm(IDADE_EM_ANOS ~ SEXO+RACACOR, data = MORTALIDADE_2021, na.action=na.exclude)

summary(lm_idade)
