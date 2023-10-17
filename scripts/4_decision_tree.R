install.packages('DAAG')
install.packages('rpart')
install.packages('rpart.plot')
install.packages('recipes')

install.packages('caret')
install.packages('pROC')


library(DAAG)
library(rpart)
library(rpart.plot)
library(recipes)
library(caret)
library(pROC)


str(spam7) 
spam <- spam7

#Etapa 1 - Pré processamento
set.seed(100)
train <- sample(1:nrow(spam), 0.8*nrow(spam))  # índice da linha dos dados de treinamento
train_spam <- spam[train, ]  # dados do modelo de treinamento
test_spam  <- spam[-train, ]

NumeroLinhasTeste <- sample(1:nrow(DEATHS), 0.7 * nrow(DEATHS))  # Index of training data rows

DadosDeTreinamento <- DEATHS[NumeroLinhasTeste, ]  # Training data
DadosDeTeste <- DEATHS[-NumeroLinhasTeste, ]  # Test data
DadosDeTreinamento
#Etapa 2 - Criando o modelo
#O primeiro passo é construir uma árvore completa, 
#parando apenas quando os nós atingem algum tamanho mínimo, 
#ou quando nenhuma melhoria pode ser feita. Então, usando 
#validação cruzada k-fold, avalie vários valores de cp para 
#minimizar a complexidade de custo CC(T). 
#A função rpart() faz as duas coisas. Ele retorna um objeto de 
#modelo com uma árvore completa e retorna uma tabela de taxas de 
#erro produzidas por várias configurações do parâmetro de complexidade. 


ARVORES_MORTES <- rpart(formula = CIRCOBITO ~ SEXO + RACACOR + IDADE_EM_ANOS,
      data = DadosDeTreinamento,
      method = "class",
      xval = 20)

ARVORES_MORTES
spam_tree <- rpart(formula = yesno ~ .,
                   data = train_spam,
                   method = "class",  # classificação
                   xval = 20  # 10-fold cross-validation 
)

#Etapa 2 - Mostrando a árvore
rpart.plot(spam_tree, yesno = TRUE)
rpart.plot(ARVORES_MORTES)
#Use a função printcp() para visualizar os detalhes do modelo.
printcp(ARVORES_MORTES)

#Etapa 3 - Criando o modelo com a poda
#O segundo passo é podar a árvore para o tamanho ideal 
#(para evitar overfitting). A tabela CP no resumo do modelo 
#mostra as estatísticas relevantes para escolher o parâmetro de 
#poda apropriado. A coluna de erro rel é a taxa de erro/erro do nó raiz 
#produzido ao podar a árvore usando o parâmetro de complexidade CP. 
#A coluna xerror mostra a taxa de erro. Um gráfico de xerror vs cp mostra a relação.

plotcp(ARVORES_MORTES)

#A linha tracejada é definida no mínimo xerror + xstd. 
#Qualquer valor abaixo da linha seria considerado estatisticamente
#significativo. Uma boa escolha para CP é geralmente o maior valor
#para o qual o erro está dentro de um desvio padrão do erro mínimo. 
#Neste caso, o menor cp está em 0,01. Uma boa maneira de detectar e 
#capturar o cp correto é com a função which.min(), mas se você quiser 
#escolher a menor árvore estatisticamente equivalente, especifique-
#a manualmente. Use a função prune() para podar a árvore especificando 
#o cp de complexidade de custo associado.

spam_tree.class <- prune(spam_tree, 
                         cp = spam_tree$cptable[which.min(spam_tree$cptable[, "xerror"]), "CP"])
rpart.plot(spam_tree.class, yesno = TRUE)

#Etapa 4 - Fazendo a predição na base de teste
spam_tree.class.pred <- predict(spam_tree.class, test_spam, type = "class")

#Etapa 5- Avaliação do modelo
spam_tree.class.conf <- confusionMatrix(data = spam_tree.class.pred,reference = test_spam$yesno)

#Montando a curva ROC
spam_tree.class.pred_1 <- predict(spam_tree.class, test_spam, type = "prob")[, 2]
spam_tree.class_roc<-roc(test_spam$yesno ~ spam_tree.class.pred_1, plot = TRUE, print.auc = TRUE)
