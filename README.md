# ICDA6 - Projeto - Ciclo de Vida dos Dados

Repositório do projeto da disciplina de ICDA6 - Introdução à Ciência de Dados, realizado no curso de Análise de Desenvolvimento de Sistemas do Instituto Federal de São Paulo - Campus São Paulo.

## Integrantes
[@FelipeDominguesB](https://github.com/FelipeDominguesB) |
[@gabrieladutra](https://github.com/gabrieladutra) |
[@henriquesouza](https://github.com/henriquesouza) |
[@lukkanog](https://github.com/lukkanog)

## Dados utilizados
Foram utilizadas duas bases de dados: o [SINASC (Sistema de Informações sobre Nascidos Vivos (SINASC)](https://opendatasus.saude.gov.br/dataset/sistema-de-informacao-sobre-nascidos-vivos-sinasc/resource/16b72608-a6f0-45f6-8dee-75925ad195ce) referente ao ano de 2021; e uma base de dados contendo uma relação dos municípios do Brasil.

Dentro do diretório [/data](https://github.com/lukkanog/icda6/tree/main/data) encontram-se os arquivos:
- `Municipios.csv` - Base de daods dos municípios brasileiros
- `data/SINASC+-+Estrutura.pdf` - Dicionário de dados da base de dados do SINASC
- `data/SINASC_2021.csv.reduced.csv` - Base de dados do SINASC 2021 (arquivo com tamanho reduzido)
- `data/columns-picker.py` - Utilitário para reduzir o tamanho do arquivo original da base de dados do SINASC 2021

## Ordem de execução dos scripts
- `0-Util.R` - Importa funções utilitarias e instala todas as bibliotecas utilizadas  
- `1-Import.R` - Importa as bases utilizadas  
- `2-Transformation.R` - Transformação dos dados importados  
- `3-Analysys.R` - Análise exploratoria  
- `4-LogisticalRegression.R` - Regressão logistica  
- `5-DecisionTree.R` - Árvore de decisão  
- `6-RandomForestClassification.R` - random forest  
- `7-alt-Correlation.R` - Correlação de variáveis

## Relatório e anexos
O relatório se encontra no caminho [/documentation/Relatório - ICDA6.docx.pdf](https://github.com/lukkanog/icda6/blob/main/documentation/Relat%C3%B3rio%20-%20ICDA6.docx.pdf)

Além disso, nesse mesmo diretório [/documentation](https://github.com/lukkanog/icda6/blob/main/documentation), se encontram 2 anexos para melhor visualização:
- `ArvoreDecisaoSplits.png` -  Imagem ilustrando a arvore de decisão criada para classificação;
- `CoeficientesRegressaoLogistica.xlsx` - Tabela de coeficiente da regressão logistica.
