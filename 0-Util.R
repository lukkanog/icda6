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
