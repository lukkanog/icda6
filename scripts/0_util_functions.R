calcularIdadeEmAnos <- function(idade) {
  # Verifica se a idade é maior que 100 anos
  if (substr(idade, 1, 1) == "5") {
    return(as.numeric(substr(idade, 2, 3)))
  }
  
  # Verifica a unidade da idade
  unidade <- as.numeric(substr(idade, 1, 1))
  
  # Verifica a quantidade de unidades
  quantidade <- as.numeric(substr(idade, 2, 3))
  
  # Calcula a idade em anos
  if (unidade == 1) {
    # Idade em minutos
    return (as.numeric(format(quantidade / 525600, nsmall = 2)))
  } else if (unidade == 2) {
    # Idade em horas
    return (as.numeric(format(quantidade / 8760, nsmall = 2)))
  } else if (unidade == 3) {
    # Idade em meses
    return (as.numeric(format(quantidade / 12, nsmall = 2)))
  } else if (unidade == 4) {
    # Idade em anos
    return (as.numeric(format(quantidade, nsmall = 2)))
  } else {
    # Idade desconhecida ou ignorada
    return(0)
  }
}


valoresSaoIguais <- function(valor1, valor2){
  return (valor1 == valor2)
}


separaFaixaEtariaPorIdade <- function(idade){
  
  if (is.na(idade)) {
    return(-1)  # Valor numérico para dados de idade ausentes.
  }

  if (idade >= 0 & idade <= 10) 
  {
    return (0)
  } 
  else if (idade <= 20) {
    return (1)
  } 
  else if (idade <= 30) {
    return (2)  
  }
  else if(idade <= 40)
  {
    return (3)  
  }
  else if(idade <= 50)
  {
    return (4)
  }
  else if(idade <= 60)
  {
    return (5)  
  }
  else if(idade <= 70)
  {
    return (6)  
  }
  else if(idade <= 80)
  {
    return (7)
  }
  else if(idade <= 90)
  {
    return (8)  
  }
  else{
    return (9)
  }
}
