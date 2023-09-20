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
