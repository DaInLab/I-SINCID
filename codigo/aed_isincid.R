### Análise exploratória de dados

# Fase 4
# Importando do arquivo Excel para o RStudio
if (!("readxl") %in% installed.packages()) install.packages("readxl")
library(readxl)
analise_isincid <- read_excel("dados/ead_isincid.xlsx")

# Visualizando o arquivo importado
View(analise_isincid)

# Fase 5
# Construnindo e exibindo os gráficos
# Carregando a biblioteca tidyverse
if (!("tidyverse") %in% installed.packages()) install.packages("tidyverse")
library(tidyverse)

# Utilizando gráficos definidos em "R para Ciência de Dados (2ª edição)" em portugues
# Versão inicial em português em: https://cienciadedatos.github.io/pt-r4ds/. Acesso em: 30 nov. 2023. 

# Gênero
sexo <- factor(analise_isincid$genero, labels = c("Feminino", "Masculino"))
ggplot(
  data = analise_isincid,
  aes (x = sexo)) +
    geom_bar(fill = "blue") +
    ggtitle("                      Gênero dos respondentes") +
    xlab( "Gênero") + 
    theme_classic()

# Faixa etária
# Descobrir as ocorrências
table(analise_isincid$faixa_etaria)
# 2  3  4  5  6  7 
#10 15  8  8  3  1
# Ocorrências, neste dataset "19 a 24 anos", "25 a 34 anos", "35 a 44 anos", 
#                            "45 a 54 anos", "55 a 64 anos" e "+ de 65  anos".
# Não ocorreram neste dataset "até 18 anos".
idade <- factor(analise_isincid$faixa_etaria, 
                labels = c("19 a 24 anos", "25 a 34 anos", "35 a 44 anos",
                           "45 a 54 anos", "55 a 64 anos", "+ de 65  anos"))
# Faixa etária
ggplot(
  data = analise_isincid,
  aes (x = idade)) +
  geom_bar(fill = "blue") +
  ggtitle("                      Faixa etária dos respondentes") +
  xlab( "Faixa Etária") + 
  theme_classic()

# Participantes no seminário
# Como desenhar um "gráfico de pizza" (muito utilizados no Brasil!) em ggplot2?
# Fonte utilizada: "R CHARTS by R CODER". https://r-charts.com/.
# Pie Chart in ggplot2: https://r-charts.com/part-whole/pie-chart-ggplot2/#:~:text=A%20pie%20chart%20in%20ggplot%20is%20a%20bar,or%20geom_col%20and%20theta%20%3D%20%22y%22%20inside%20coord_polar. Acesso em: 2- nov. 2023.

# Descobrir as ocorrências
table(analise_isincid$participou)
#  1  2
# 38  7 

participante <- factor(analise_isincid$participou, labels = c("Sim", "Não"))

#dfpart = data.frame(participa = participou, 
#                   grupo = (split(analise_isincid$participou, f = participou)))
#Basic pie chart
# A pie chart in ggplot is a bar plot plus a polar coordinate. 
# You can use geom_bar or geom_col and theta = "y" inside coord_polar.
# install.packages("ggplot2")

#ggplot(analise_isincid, aes(x = "", y = participou, fill = table(participou))) +
#  geom_col() +
#  coord_polar(theta = "y")

ggplot(
  data = analise_isincid,
  aes (x = participante)) +
  geom_bar(fill = "blue") +
  ggtitle("                      Participou do seminário") +
  xlab( "Participou") + 
  theme_classic()

# Avaliação do seminário
# Descobrir as ocorrências
table(analise_isincid$avalie_seminario)
# 3  4  5 
# 7 11 27
# Ocorrências, neste dataset  "3-Satisfatório", "4-Bom" e "5-Excelente/Satisfatório"".
# Não presentes no dataset: "1-Insatisfatório"e "2-Abaixo da média"                           
avaliacao <- factor(analise_isincid$avalie_seminario, 
                labels = c("Satisfatório","Bom","Excelente/Satisfatório"))
# Avaliação do seminário
ggplot(
  data = analise_isincid,
  aes (x = avaliacao)) +
  geom_bar(fill = "blue") +
  ggtitle("                     Avaliação do seminário") +
  xlab( "Escala de avaliação") + 
  theme_classic()

# Avaliação conteúdo das apresentações
# Descobrir as ocorrências
table(analise_isincid$conteudo_apresentacoes_avalie)
# 3  4  5 
# 9  9 27
# Ocorrências, neste dataset  "3-Satisfatório", "4-Bom" e "5-Excelente/Satisfatório".
# Não presentes no dataset: "1-Insatisfatório"e "2-Abaixo da média"                           
avalie_conteudo <- factor(analise_isincid$conteudo_apresentacoes_avalie, 
                    labels = c("Satisfatório","Bom","Excelente"))
# Avaliação do conteúdo do seminário
ggplot(
  data = analise_isincid,
  aes (x = avalie_conteudo)) +
  geom_bar(fill = "blue") +
  ggtitle("                     Avaliação do conteúdo do seminário") +
  xlab( "Escala de avaliação") + 
  theme_classic()

# Avaliação da qualidade das apresentações
# Descobrir as ocorrências
table(analise_isincid$qualidade_apresentacoes_avalie)
# 2  3  4  5  
# 1 10 16 18
# Ocorrências, neste dataset "2-Abaixo da média", "3-Satisfatório", "4-Bom" e "5-Excelente/Satisfatório".
# Não presentes no dataset: "1-Insatisfatório"                           
avalie_qualidade_apresentacoes <- factor(analise_isincid$qualidade_apresentacoes_avalie, 
                          labels = c("Abaixo da média","Satisfatório","Bom","Excelente"))
# Avaliação a qualidade das apresentações
ggplot(
  data = analise_isincid,
  aes (x = avalie_qualidade_apresentacoes)) +
  geom_bar(fill = "blue") +
  ggtitle("                     Avaliação da qualidade das apresentções") +
  xlab( "Escala de avaliação") + 
  theme_classic()

# Avaliação da organização do seminário
# Descobrir as ocorrências
table(analise_isincid$organizacao_evento_avalie)
# 3  4  5  
# 8 10 27
# Ocorrências, neste dataset "3-Satisfatório", "4-Bom" e "5-Excelente/Satisfatório".
# Não presentes no dataset: "1-Insatisfatório" e "2-Abaixo da média".                           
avalie_organizacao_evento <- factor(analise_isincid$organizacao_evento_avalie, 
                                         labels = c("Satisfatório","Bom","Excelente"))
# Avaliação da organização do seminário
ggplot(
  data = analise_isincid,
  aes (x = avalie_organizacao_evento)) +
  geom_bar(fill = "blue") +
  ggtitle("                     Avaliação da organização do seminário") +
  xlab( "Escala de avaliação") + 
  theme_classic()

# Avaliação do formato do seminário
# Descobrir as ocorrências
table(analise_isincid$formato_seminario_adequado)
# 3  4  5  
# 8 15 22 
# Ocorrências, neste dataset "3-Neutro/Não sei dizer", "4-Bom" e "5-Concordo totalmente/Excelente".
# Não presentes no dataset: "1-Discordo totalmente" e "2-Discordo".                           
avalie_formato_evento <- factor(analise_isincid$formato_seminario_adequado, 
                                    labels = c("Neutro/Não sei dizer","Bom","Concordo totalmente/Excelente"))
# Avaliação do formato do seminário
ggplot(
  data = analise_isincid,
  aes (x = avalie_formato_evento)) +
  geom_bar(fill = "blue") +
  ggtitle("                     Avaliação da formato do seminário") +
  xlab( "Escala de avaliação") + 
  theme_classic()

# Duração do seminário
# Descobrir as ocorrências
table(analise_isincid$duracao_seminario)
# 1  2  3  4 
# 5 30  3  7
# Ocorrências, neste dataset "1-Muito longo", "2-Adequado", "3-Muito curto" e "4-Não sei dizer".
# Não presentes no dataset:                            
avalie_duracao_seminario <- factor(analise_isincid$duracao_seminario, 
                                labels = c("Muito longo", "Adequado", "Muito curto", "Não sei dizer"))
# Avaliação da duração do seminário
ggplot(
  data = analise_isincid,
  aes (x = avalie_duracao_seminario)) +
  geom_bar(fill = "blue") +
  ggtitle("                     Avaliação da duração do seminário") +
  xlab( "Escala de avaliação") + 
  theme_classic()

# Conteúdo do seminário atendeu as suas expectativas
# Descobrir as ocorrências
table(analise_isincid$conteudo_seminario_expectativas)
#  1  3
# 34 11
# Ocorrências, neste dataset "1-Sim" e "3-Talvez/Parcialmente".
# Não presentes no dataset: "2-Não"                           
avalie_conteudo_expectativa <- factor(analise_isincid$conteudo_seminario_expectativas, 
                                   labels = c("Sim","Talvez/Parcialmente"))
# Conteúdo do seminário atendeu as suas expectativa
ggplot(
  data = analise_isincid,
  aes (x = avalie_conteudo_expectativa)) +
  geom_bar(fill = "blue") +
  ggtitle("                     Conteúdo atendeu as expectativa") +
  xlab( "Escala de avaliação") + 
  theme_classic()

# Descreva o motivo do seminário ter atendido as suas expectativas
# Núvem de palavras

# Carregando as bibliotecas referentes
if(!"wordcloud" %in% installed.packages()) install.packages("wordcloud")
library(wordcloud)
if(!"wordcloud2" %in% installed.packages()) install.packages("wordcloud2")
library(wordcloud2)
if(!"RColorBrewer" %in% installed.packages()) install.packages("RColorBrewer")
library(RColorBrewer)
if(!"tm" %in% installed.packages()) install.packages("tm")
library(tm)

#Carregando o texto e eliminando os NA (missing data)
texto <- na.omit(analise_isincid$conteudo_seminario_avalie)

# Criando um corpus  
docs <- Corpus(VectorSource(texto))

# Limpando o texto
# Para utilizar o comando "pipe" (%>%) ou operador "tee pipe" (%T>%) , pode-se "carregar" o pacote magrittr
if(!"magrittr" %in% installed.packages()) install.packages("magrittr")
library(magrittr)
docs <- docs %>%
  tm_map(removeNumbers) %>%
  tm_map(removePunctuation) %>%
  tm_map(stripWhitespace)
docs <- tm_map(docs, content_transformer(tolower))
docs <- tm_map(docs, removeWords, stopwords("portuguese"))

# Criar uma matriz de termos de documento
# Uma matriz de termos de documento é uma matriz matemática que descreve a frequência 
# dos termos que ocorrem em uma coleção de documentos.
dtm <- TermDocumentMatrix(docs) 
matrix <- as.matrix(dtm) 
words <- sort(rowSums(matrix),decreasing=TRUE) 
df <- data.frame(word = names(words),freq=words)

# Gerar a núvem de palavras
set.seed(1234) # para reprodutibilidade 
wordcloud(words = df$word, freq = df$freq, min.freq = 1, # menor "min.freq", maior/precisão, menor número/palavras     
          max.words=200, random.order=FALSE, rot.per=0.35,       
          colors=brewer.pal(8, "Dark2"))
mtext("Manifestação se o seminário atendeu as expectativas", side=3, line = 3)
print("Principais ocorrências do seminário ter atendido as expectativas")
for (k in 1:length (which(pmax(df$freq) > 2))) {
  print(paste(df$word[k], df$freq[k],sep = " = " ))
}

# Melhor apresentador ou palestrante
# Descobrir as ocorrências

melhor_palestra <- analise_isincid$apresentador_palestra_melhor
nenhum <- length(na.omit(str_match(melhor_palestra, "Nenhum")))
beatriz <- length(na.omit(str_match(melhor_palestra, "Beatriz Milz")))
juliano <- length(na.omit(str_match(melhor_palestra, "Juliano Maurício de Carvalho")))
alan <- length(na.omit(str_match(melhor_palestra, "Alan Angeluci")))
jefferson <- length(na.omit(str_match(melhor_palestra, "Jefferson Mariano"))) 
apresentador_gt <- length(na.omit(str_match(melhor_palestra, "artigo do GT")))
apresentador_linda <- length(na.omit(str_match(melhor_palestra, "Grupo de estudos LInDa")))
elaine <- length(na.omit(str_match(melhor_palestra, "Elaine Gatto")))
carlos <- length(na.omit(str_match(melhor_palestra, "Carlos Rozaboni")))
casos_melhor_palestra <- c(nenhum, beatriz, juliano, alan, jefferson, apresentador_gt, apresentador_linda, elaine, carlos)
names(casos_melhor_palestra) <- c("Nenhum(a)", "Beatriz Milz (R-ladies)", "Juliano de Carvalho (UNESP)", 
                                  "Alan Angeluci (USP)", "Jefferson Mariano (IBGE)", "Apres./autor(a) de artigo", 
                                  "Apres. Grupo LInDa", "Elaine Gatto", "Carlos Rozaboni (Data Guvi)")
sort(casos_melhor_palestra)

df_melhores <- data.frame( melhores = c("Nenhum(a)", "Beatriz Milz (R-ladies)", "Juliano de Carvalho (UNESP)", 
                                        "Alan Angeluci (USP)", "Jefferson Mariano (IBGE)", 
                                        "Apres./autor(a) de artigo", 
                                        "Apres. Grupo LInDa", "Elaine Gatto", "Carlos Rozaboni (Data Guvi)"),
                           grupo = casos_melhor_palestra
  
)
  
ggplot(df_melhores, aes(x=melhores, y=grupo)) +
  geom_col(width=.6, fill=alpha('blue',3), col='black')+
#  geom_text(aes(label=paste(perc,"%")),nudge_y=1.4)+
  labs(x='Apresentador(a)', y='Votação')+
  ggtitle('Melhor apresentador(a) ou palestrante')+
  theme_minimal()+
  coord_flip()  

# Analisando as respostas discursivas sobre qual melhor apresentador ou palestrante
#Carregando o texto e eliminando os NA (missing data)
texto <- na.omit(analise_isincid$apresentador_palestra_melhor_avalie)

# Criando um corpus  
docs <- Corpus(VectorSource(texto))

# Limpando o texto
# Para utilizar o comando "pipe" (%>%) ou operador "tee pipe" (%T>%) , pode-se "carregar" o pacote magrittr
docs <- docs %>%
  tm_map(removeNumbers) %>%
  tm_map(removePunctuation) %>%
  tm_map(stripWhitespace)
docs <- tm_map(docs, content_transformer(tolower))
docs <- tm_map(docs, removeWords, stopwords("portuguese"))

# Criar uma matriz de termos de documento
# Uma matriz de termos de documento é uma matriz matemática que descreve a frequência 
# dos termos que ocorrem em uma coleção de documentos.
dtm <- TermDocumentMatrix(docs) 
matrix <- as.matrix(dtm) 
words <- sort(rowSums(matrix),decreasing=TRUE) 
df <- data.frame(word = names(words),freq=words)

# Gerar a núvem de palavras
set.seed(1234) # para reprodutibilidade 
wordcloud(words = df$word, freq = df$freq, min.freq = 1, # menor "min.freq", maior/precisão, menor número/palavras     
          max.words=200, random.order=FALSE, rot.per=0.35,       
          colors=brewer.pal(8, "Dark2"))
mtext("Manifestação sobre o(a) melhor palestrante/apresentador(a)", side=3, line = 3)
print("Principais ocorrências o(a) melhor palestrante/apresentador(a)")
for (k in 1:length (which(pmax(df$freq) > 1))) {
  print(paste(df$word[k], df$freq[k],sep = " = " ))
}  
  
# Analisando as respostas discursivas o que mais gostou não seminário
#Carregando o texto e eliminando os NA (missing data)
texto <- na.omit(analise_isincid$mais_gostou_seminario)

# Criando um corpus  
docs <- Corpus(VectorSource(texto))

# Limpando o texto
# Para utilizar o comando "pipe" (%>%) ou operador "tee pipe" (%T>%) , pode-se "carregar" o pacote magrittr
docs <- docs %>%
  tm_map(removeNumbers) %>%
  tm_map(removePunctuation) %>%
  tm_map(stripWhitespace)
docs <- tm_map(docs, content_transformer(tolower))
docs <- tm_map(docs, removeWords, stopwords("portuguese"))

# Criar uma matriz de termos de documento
# Uma matriz de termos de documento é uma matriz matemática que descreve a frequência 
# dos termos que ocorrem em uma coleção de documentos.
dtm <- TermDocumentMatrix(docs) 
matrix <- as.matrix(dtm) 
words <- sort(rowSums(matrix),decreasing=TRUE) 
df <- data.frame(word = names(words),freq=words)

# Gerar a núvem de palavras
set.seed(1234) # para reprodutibilidade 
wordcloud(words = df$word, freq = df$freq, min.freq = 1, # menor "min.freq", maior/precisão, menor número/palavras     
          max.words=200, random.order=FALSE, rot.per=0.35,       
          colors=brewer.pal(8, "Dark2"))
mtext("Manifestação sobre o que mais gostou noo seminário", side=3, line = 3)
print("Principais ocorrências sobre o que mais gostou no seminário")
for (k in 1:length (which(pmax(df$freq) > 1))) {
  print(paste(df$word[k], df$freq[k],sep = " = " ))
}    
  
# Analisando as respostas discursivas sobre o que NÃO gostou no seminário
#Carregando o texto e eliminando os NA (missing data)
texto <- na.omit(analise_isincid$nao_gostou_seminario)

# Criando um corpus  
docs <- Corpus(VectorSource(texto))

# Limpando o texto
# Para utilizar o comando "pipe" (%>%) ou operador "tee pipe" (%T>%) , pode-se "carregar" o pacote magrittr
docs <- docs %>%
  tm_map(removeNumbers) %>%
  tm_map(removePunctuation) %>%
  tm_map(stripWhitespace)
docs <- tm_map(docs, content_transformer(tolower))
docs <- tm_map(docs, removeWords, stopwords("portuguese"))

# Criar uma matriz de termos de documento
# Uma matriz de termos de documento é uma matriz matemática que descreve a frequência 
# dos termos que ocorrem em uma coleção de documentos.
dtm <- TermDocumentMatrix(docs) 
matrix <- as.matrix(dtm) 
words <- sort(rowSums(matrix),decreasing=TRUE) 
df <- data.frame(word = names(words),freq=words)

# Gerar a núvem de palavras
set.seed(1234) # para reprodutibilidade 
wordcloud(words = df$word, freq = df$freq, min.freq = 1, # menor "min.freq", maior/precisão, menor número/palavras     
          max.words=200, random.order=FALSE, rot.per=0.35,       
          colors=brewer.pal(8, "Dark2"))
mtext("Manifestação sobre o que não gostou no seminário", side=3, line = 3)
print("Principais ocorrências sobre o que não gostou no seminário")
for (k in 1:length (which(pmax(df$freq) > 1))) {
  print(paste(df$word[k], df$freq[k],sep = " = " ))
}      

# Analisando as respostas discursivas sobre o que poderia ser melhorado no seminário
#Carregando o texto e eliminando os NA (missing data)
texto <- na.omit(analise_isincid$melhorado_apresentacoes)

# Criando um corpus  
docs <- Corpus(VectorSource(texto))

# Limpando o texto
# Para utilizar o comando "pipe" (%>%) ou operador "tee pipe" (%T>%) , pode-se "carregar" o pacote magrittr
docs <- docs %>%
  tm_map(removeNumbers) %>%
  tm_map(removePunctuation) %>%
  tm_map(stripWhitespace)
docs <- tm_map(docs, content_transformer(tolower))
docs <- tm_map(docs, removeWords, stopwords("portuguese"))

# Criar uma matriz de termos de documento
# Uma matriz de termos de documento é uma matriz matemática que descreve a frequência 
# dos termos que ocorrem em uma coleção de documentos.
dtm <- TermDocumentMatrix(docs) 
matrix <- as.matrix(dtm) 
words <- sort(rowSums(matrix),decreasing=TRUE) 
df <- data.frame(word = names(words),freq=words)

# Gerar a núvem de palavras
set.seed(1234) # para reprodutibilidade 
wordcloud(words = df$word, freq = df$freq, min.freq = 1, # menor "min.freq", maior/precisão, menor número/palavras     
          max.words=200, random.order=FALSE, rot.per=0.35,       
          colors=brewer.pal(8, "Dark2"))
mtext("Manifestação sobre o que poderia ser melhorado no seminário", side=3, line = 3)
print("Principais ocorrênciaso que poderia ser melhorado no seminário")
for (k in 1:length (which(pmax(df$freq) > 1))) {
  print(paste(df$word[k], df$freq[k],sep = " = " ))
}      

# Dos que não participaram:
# Qual a razão/motivo de não ter participado?
# Descobrir as ocorrências

nao_participou <- analise_isincid$nao_participou_motivo
data_hora <- length(na.omit(str_match(nao_participou, "Indisponibilidade na data  ou horário")))
dia_semana <- length(na.omit(str_match(nao_participou, "Indisponibilidade no dia da semana")))
duracao <- length(na.omit(str_match(nao_participou, "Duração")))
aviso_evento <- length(na.omit(str_match(nao_participou, "Não recebi o aviso do evento")))
acesso_evento <- length(na.omit(str_match(nao_participou, "Não recebi o acesso pro evento"))) 
dificuldade_plataforma <- length(na.omit(str_match(nao_participou, "Dificuldade com a plataforma")))
nao_acesso_plataforma <- length(na.omit(str_match(nao_participou, "Não consegui/tentei acessar a plataforma/site")))
dificuldade_deslocamento <- length(na.omit(str_match(nao_participou, "Dificuldade de deslocamento")))
esqueci_evento <- length(na.omit(str_match(nao_participou, "Esqueci do evento")))
nao_me_inscrevi <- length(na.omit(str_match(nao_participou, "Não me inscrevi")))
nao_soube_evento <- length(na.omit(str_match(nao_participou, "Não soube do evento antes/a tempo")))
casos_nao_participou <- c(data_hora, dia_semana, duracao, aviso_evento, acesso_evento, 
                          dificuldade_plataforma, nao_acesso_plataforma, dificuldade_deslocamento, 
                          esqueci_evento, nao_me_inscrevi, nao_soube_evento)
names(casos_nao_participou) <- c("Indisponibilidade na data  ou horário", "Indisponibilidade no dia da semana", "Duração",
                                 "Não recebi o aviso do evento", "Não recebi o acesso pro evento", "Dificuldade com a plataforma",
                                 "Não consegui/tentei acessar a plataforma/site", "Dificuldade de deslocamento", "Esqueci do evento",
                                 "Não me inscrevi", "Não soube do evento antes/a tempo")
sort(casos_nao_participou)

df_casos_nao_participou <- data.frame(motivos = c("Indisponibilidade na data  ou horário", "Indisponibilidade no dia da semana", "Duração",
                                                 "Não recebi o aviso do evento", "Não recebi o acesso pro evento", "Dificuldade com a plataforma",
                                                 "Não consegui/tentei acessar a plataforma/site", "Dificuldade de deslocamento", "Esqueci do evento",
                                                 "Não me inscrevi", "Não soube do evento antes/a tempo"),
                           grupo = casos_nao_participou
                           
)

ggplot(df_casos_nao_participou, aes(x=motivos, y=grupo)) +
  geom_col(width=.6, fill=alpha('blue',3), col='black')+
  #  geom_text(aes(label=paste(perc,"%")),nudge_y=1.4)+
  labs(x='Motivo', y='Número de ocorrências')+
  ggtitle('Principais motivos de não participação')+
  theme_minimal()+
  coord_flip()  

# Analisando as respostas discursivas sobre motivos de não participação no seminário
#Carregando o texto e eliminando os NA (missing data)
texto <- na.omit(analise_isincid$nao_participou_descricao)

# Criando um corpus  
docs <- Corpus(VectorSource(texto))

# Limpando o texto
# Para utilizar o comando "pipe" (%>%) ou operador "tee pipe" (%T>%) , pode-se "carregar" o pacote magrittr
docs <- docs %>%
  tm_map(removeNumbers) %>%
  tm_map(removePunctuation) %>%
  tm_map(stripWhitespace)
docs <- tm_map(docs, content_transformer(tolower))
docs <- tm_map(docs, removeWords, stopwords("portuguese"))

# Criar uma matriz de termos de documento
# Uma matriz de termos de documento é uma matriz matemática que descreve a frequência 
# dos termos que ocorrem em uma coleção de documentos.
dtm <- TermDocumentMatrix(docs) 
matrix <- as.matrix(dtm) 
words <- sort(rowSums(matrix),decreasing=TRUE) 
df <- data.frame(word = names(words),freq=words)

# Gerar a núvem de palavras
set.seed(1234) # para reprodutibilidade 
wordcloud(words = df$word, freq = df$freq, min.freq = 1, # menor "min.freq", maior/precisão, menor número/palavras     
          max.words=200, random.order=FALSE, rot.per=0.35,       
          colors=brewer.pal(8, "Dark2"))
mtext("Manifestação sobre motivos de não participação no seminário", side=3, line = 3)
print("Principais motivos de não participação no seminário")
for (k in 1:length (which(pmax(df$freq) > 1))) {
  print(paste(df$word[k], df$freq[k],sep = " = " ))
}      

# Analisando respostas discursivas sobre tópicos para futuros seminários
#Carregando o texto e eliminando os NA (missing data)
texto <- na.omit(analise_isincid$topicos_futuros_seminarios)

# Criando um corpus  
docs <- Corpus(VectorSource(texto))

# Limpando o texto
# Para utilizar o comando "pipe" (%>%) ou operador "tee pipe" (%T>%) , pode-se "carregar" o pacote magrittr
docs <- docs %>%
  tm_map(removeNumbers) %>%
  tm_map(removePunctuation) %>%
  tm_map(stripWhitespace)
docs <- tm_map(docs, content_transformer(tolower))
docs <- tm_map(docs, removeWords, stopwords("portuguese"))

# Criar uma matriz de termos de documento
# Uma matriz de termos de documento é uma matriz matemática que descreve a frequência 
# dos termos que ocorrem em uma coleção de documentos.
dtm <- TermDocumentMatrix(docs) 
matrix <- as.matrix(dtm) 
words <- sort(rowSums(matrix),decreasing=TRUE) 
df <- data.frame(word = names(words),freq=words)

# Gerar a núvem de palavras
set.seed(1234) # para reprodutibilidade 
wordcloud(words = df$word, freq = df$freq, min.freq = 1, # menor "min.freq", maior/precisão, menor número/palavras     
          max.words=200, random.order=FALSE, rot.per=0.35,       
          colors=brewer.pal(8, "Dark2"))
mtext("Sugestão de tópicos para os próximos seminários", side=3, line = 3)
print("Principais sugestõers de tópicos para os próximos seminários")
for (k in 1:length (which(pmax(df$freq) > 1))) {
  print(paste(df$word[k], df$freq[k],sep = " = " ))
}      

# Recomendaria o seminário
# Descobrir as ocorrências
table(analise_isincid$recomendaria)
#  1  3
# 43  2
# Ocorrências, neste dataset "1-Sim" e "3-Talvez".
# Não presentes no dataset: "2-Não"                           
recomendar <- factor(analise_isincid$recomendaria, 
                                      labels = c("Sim","Talvez"))
# Recomendaria o seminário
ggplot(
  data = analise_isincid,
  aes (x = recomendar)) +
  geom_bar(fill = "blue") +
  ggtitle("                     Recomendaria o seminário a outras pessoas") +
  ylab( "Respostas") + xlab("Recomendaria") +
  theme_classic()

# Analisando respostas discursivas sobre se recomendaria o seminário a outras pessoas
#Carregando o texto e eliminando os NA (missing data)
texto <- na.omit(analise_isincid$recomedaria_explique)

# Criando um corpus  
docs <- Corpus(VectorSource(texto))

# Limpando o texto
# Para utilizar o comando "pipe" (%>%) ou operador "tee pipe" (%T>%) , pode-se "carregar" o pacote magrittr
docs <- docs %>%
  tm_map(removeNumbers) %>%
  tm_map(removePunctuation) %>%
  tm_map(stripWhitespace)
docs <- tm_map(docs, content_transformer(tolower))
docs <- tm_map(docs, removeWords, stopwords("portuguese"))

# Criar uma matriz de termos de documento
# Uma matriz de termos de documento é uma matriz matemática que descreve a frequência 
# dos termos que ocorrem em uma coleção de documentos.
dtm <- TermDocumentMatrix(docs) 
matrix <- as.matrix(dtm) 
words <- sort(rowSums(matrix),decreasing=TRUE) 
df <- data.frame(word = names(words),freq=words)

# Gerar a núvem de palavras
set.seed(1234) # para reprodutibilidade 
wordcloud(words = df$word, freq = df$freq, min.freq = 1, # menor "min.freq", maior/precisão, menor número/palavras     
          max.words=200, random.order=FALSE, rot.per=0.35,       
          colors=brewer.pal(8, "Dark2"))
mtext("Recomendaria o seminário a outras pessoas", side=3, line = 3)
print("Principais respostas sobre se recomendaria o seminário a outras pessoas")
for (k in 1:length (which(pmax(df$freq) > 1))) {
  print(paste(df$word[k], df$freq[k],sep = " = " ))
}      

# Analisando observações finais
#Carregando o texto e eliminando os NA (missing data)
texto <- na.omit(analise_isincid$observacao_final)

# Criando um corpus  
docs <- Corpus(VectorSource(texto))

# Limpando o texto
# Para utilizar o comando "pipe" (%>%) ou operador "tee pipe" (%T>%) , pode-se "carregar" o pacote magrittr
docs <- docs %>%
  tm_map(removeNumbers) %>%
  tm_map(removePunctuation) %>%
  tm_map(stripWhitespace)
docs <- tm_map(docs, content_transformer(tolower))
docs <- tm_map(docs, removeWords, stopwords("portuguese"))

# Criar uma matriz de termos de documento
# Uma matriz de termos de documento é uma matriz matemática que descreve a frequência 
# dos termos que ocorrem em uma coleção de documentos.
dtm <- TermDocumentMatrix(docs) 
matrix <- as.matrix(dtm) 
words <- sort(rowSums(matrix),decreasing=TRUE) 
df <- data.frame(word = names(words),freq=words)

# Gerar a núvem de palavras
set.seed(1234) # para reprodutibilidade 
wordcloud(words = df$word, freq = df$freq, min.freq = 1, # menor "min.freq", maior/precisão, menor número/palavras     
          max.words=200, random.order=FALSE, rot.per=0.35,       
          colors=brewer.pal(8, "Dark2"))
mtext("Observações finais", side=3, line = 3)
print("Principais observações finais")
for (k in 1:length (which(pmax(df$freq) > 1))) {
  print(paste(df$word[k], df$freq[k],sep = " = " ))
}      



