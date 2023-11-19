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
  
  
  ifelse(is.null(valor1))
  {
    return (0)
  }
  
  ifelse(is.null(valor2))
  {
    return (1)
  }
  
  return (valor1 == valor2 ? 1 : 0)
    
  
}

isAdult <- function(idade)
{
  if(is.na(idade))
    return(-1)
  
  if(idade < 20)
    return (0)
  
  return (1)
}

separaFaixaEtariaInfantil <- function(idade)
{
  if(is.na(idade)){
    return(-1) # Valor numérico para dados de idade ausentes
  }
  
  if(idade < 1)
    return (0)
  
  if(idade >= 1 && idade <= 4)
  {
    return (1)
  }
  
  if(idade >= 5 && idade <= 9)
  {
    return (2)
  }
  
  if(idade >= 10 && idade <= 14)
  {
    return (3)
  }
  
  if(idade >= 15 && idade <= 19)
  {
    return (4)
  }
  
  return (-1)
  
}

separaFaixaEtariaAdultos <- function(idade) {
  if (is.na(idade)) {
    return(-1)  # Valor numérico para dados de idade ausentes
  }
  
  if (idade >= 20 && idade <= 24) {
    return(0)
  }
  
  if (idade >= 25 && idade <= 29) {
    return(1)
  }
  
  if (idade >= 30 && idade <= 34) {
    return(2)
  }
  
  if (idade >= 35 && idade <= 39) {
    return(3)
  }
  
  if (idade >= 40 && idade <= 44) {
    return(4)
  }
  
  if (idade >= 45 && idade <= 49) {
    return(5)
  }
  
  if (idade >= 50 && idade <= 54) {
    return(6)
  }
  
  if (idade >= 55 && idade <= 59) {
    return(7)
  }
  
  if (idade >= 60 && idade <= 64) {
    return(8)
  }
  
  if (idade >= 65 && idade <= 69) {
    return(9)
  }
  
  if (idade >= 70 && idade <= 74) {
    return(10)
  }
  
  if (idade >= 75 && idade <= 79) {
    return(11)
  }
  
  if (idade >= 80 && idade <= 84) {
    return(12)
  }
  
  if (idade >= 85 && idade <= 89) {
    return(13)
  }
  
  if (idade >= 90 && idade <= 94) {
    return(14)
  }
  
  if (idade >= 95 && idade <= 99) {
    return(15)
  }

  return(-1)
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

