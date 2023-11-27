install.packages('rpart')
install.packages('rpart.plot')
install.packages('corrplot')
install.packages('ggplot2')
install.packages('data.table')
install.packages('mltools')
install.packages('randomForest')
install.packages('readr')
install.packages('recipes')
install.packages('caret')
install.packages('pROC')

separaFaixaEtaria <- function(idade)
{
  if(is.na(idade)){
    return(-1) # Valor numérico para dados de idade ausentes
  }

  if(idade <= 19)
  {
    return (1)
  }
  
  if(idade >= 20 && idade <= 60)
  {
    return (2)
  }
  
  if(idade > 60)
  {
    return (3)
  }
  
  return (-1)
  
}
