# Fase 1
# Importando o arquivo para o RStudio
if (!("readxl") %in% installed.packages()) install.packages("readxl")
library(readxl)
analise_isincid <- read_excel("dados/avaliacao_isincid.xlsx")

# Visualizando o arquivo importado
View(analise_isincid)

# "Limpando" (eliminando) colunas que não serão utilizadas (sigilo)
analise_isincid$data  = NULL
analise_isincid$email = NULL

# Fase 2
# Transformando/preparando/padronizando os campos em formato numérico para facilitar a análise e as futuras (possíveis) correlações

# Loop geral
indice = 1
while (indice <= nrow(analise_isincid)) {
  
# Gênero
  if (analise_isincid$genero[indice] == "Feminino") analise_isincid$genero[indice] <- 1 else
    if (analise_isincid$genero[indice] == "Masculino") analise_isincid$genero[indice] <- 2 else
      if (analise_isincid$genero[indice] == "Não binário") analise_isincid$genero[indice] <- 3 else
          if (analise_isincid$genero[indice] == "Não quero responder/Não definido") analise_isincid$genero[indice] <- 4 else
            analise_isincid$genero[indice] <- 5
          
# Faixa etária
  if (analise_isincid$faixa_etaria[indice] <= "18") analise_isincid$faixa_etaria[indice] <- 1 else
    if (analise_isincid$faixa_etaria[indice] == "19 a 24 anos") analise_isincid$faixa_etaria[indice] <- 2 else
      if (analise_isincid$faixa_etaria[indice] == "25 a 34 anos") analise_isincid$faixa_etaria[indice] <- 3 else
        if (analise_isincid$faixa_etaria[indice] == "35 a 44 anos") analise_isincid$faixa_etaria[indice] <- 4 else
          if (analise_isincid$faixa_etaria[indice] == "45 a 54 anos") analise_isincid$faixa_etaria[indice] <- 5 else
            if (analise_isincid$faixa_etaria[indice] == "55 a 64 anos") analise_isincid$faixa_etaria[indice] <- 6 else
              if (analise_isincid$faixa_etaria[indice] == "65 ou mais.") analise_isincid$faixa_etaria[indice] <- 7 else
                analise_isincid$faixa_etaria[indice] <- 8
              
# Participou do seminário ?
  if (analise_isincid$participou[indice] == "Sim") analise_isincid$participou[indice] <- 1 else
    if (analise_isincid$participou[indice] == "Não") analise_isincid$participou[indice] <- 2 else
      analise_isincid$participou[indice] <- 3      
  
# Avalie o seminário: avalie_seminario  
# Opções: 1 = insatisfatório; 2 = abaixo da média; 3 = satisfatório; 4 = bom; 5 = excelente/satisfatório    

# Avalie o conteúdo das apresentações: conteudo_apresentacoes_avalie
# Opções: 1 = insatisfatório; 2 = abaixo da média; 3 = satisfatório; 4 = bom; 5 = excelente         

# Avalie a qualidade das apresentações: qualidade_apresentacoes_avalie
# Opções: 1 = insatisfatório; 2 = abaixo da média; 3 = satisfatório; 4 = bom; 5 = excelente  
    
# Avalie a organização do seminário: organizacao_evento_avalie
# Opções: 1 = insatisfatório; 2 = abaixo da média; 3 = satisfatório; 4 = bom; 5 = excelente         
    
# Avalie o formato do seminário: formato_seminario_adequado
# Opções: 1 = discordo totalmente; 2 = discordo; 3 = neutro/não sei dizer; 4 = bom; 5 = concordo totalmente/excelente         
  if (analise_isincid$formato_seminario_adequado[indice] == "Discordo Totalmente") analise_isincid$formato_seminario_adequado[indice] <- 1 else
    if (analise_isincid$formato_seminario_adequado[indice] == "Discordo") analise_isincid$formato_seminario_adequado[indice] <- 2 else
      if (analise_isincid$formato_seminario_adequado[indice] == "Neutro/Não sei dizer") analise_isincid$formato_seminario_adequado[indice] <- 3 else
         if (analise_isincid$formato_seminario_adequado[indice] == "Bom") analise_isincid$formato_seminario_adequado[indice] <- 4 else
          if (analise_isincid$formato_seminario_adequado[indice] == "Concordo Totalmente / Excelente") analise_isincid$formato_seminario_adequado[indice] <- 5 else 
            analise_isincid$formato_seminario_adequado[indice] = 3
          
# Avalie a duração do seminário: duracao_seminario
# Opções: 1 = muito longo; 2 = adequada; 3 = muito curto; 4 = não sei dizer;    
    if (analise_isincid$duracao_seminario[indice] == "Muito longo") analise_isincid$duracao_seminario[indice] <- 1 else
      if (analise_isincid$duracao_seminario[indice] == "Adequada") analise_isincid$duracao_seminario[indice] <- 2 else
        if (analise_isincid$duracao_seminario[indice] == "Muito curto") analise_isincid$duracao_seminario[indice] <- 3 else
          if (analise_isincid$duracao_seminario[indice] == "Não sei dizer") analise_isincid$duracao_seminario[indice] <- 4 else
            analise_isincid$duracao_seminario[indice] = 4
            
# Opine se o conteúdo do seminário atendeu suas expectativas: conteudo_seminario_expectativas
# Opções: 1 = muito longo; 2 = adequada; 3 = muito curto; 4 = não sei dizer;     
    if (analise_isincid$conteudo_seminario_expectativas[indice] == "Sim") analise_isincid$conteudo_seminario_expectativas[indice] <- 1 else
      if (analise_isincid$conteudo_seminario_expectativas[indice] == "Não") analise_isincid$conteudo_seminario_expectativas[indice] <- 2 else
        if (analise_isincid$conteudo_seminario_expectativas[indice] == "Talvez/Parcialmente") analise_isincid$conteudo_seminario_expectativas[indice] <- 3 else
        analise_isincid$conteudo_seminario_expectativas[indice] <- 3      

# Descreva o motivo do conteúdo do seminário atender as suas expectativas: conteudo_seminario_avalie
# Campo texto: analisar com núvem de palavras / análise de conteúdo;             

# Escolha qual apresentador você mais gostou: apresentador_palestra_melhor
# Campo texto com múltiplas respostas;        
        
# Descreva o motivo da escolha de qual apresentador você mais gostou: apresentador_palestra_melhor_avalie
# Campo texto: analisar com núvem de palavras / análise de conteúdo;             
        
# Escreva o que você mais gostou no seminário: mais_gostou_seminario
# Campo texto: analisar com núvem de palavras / análise de conteúdo;
        
# Escreva o que você Não gostou no seminário: nao_gostou_seminario
# Campo texto: analisar com núvem de palavras / análise de conteúdo;        
        
# Escreva o que pode ser melhorado nas apresentações: melhorado_apresentacoes
# Campo texto: analisar com núvem de palavras / análise de conteúdo;    
        
# Escolha/selecione o motivo de não ter participado do seminário: nao_participou_motivo
# Campo texto com múltiplas respostas;;         
   
# Escreva sobre o motivo de não ter participado do seminário: nao_participou_descricao
# Campo texto: analisar com núvem de palavras / análise de conteúdo;          
        
# Escreva quais tópicos devem ser abordados nos próximos seminários: topicos_futuros_seminarios
# Campo texto: analisar com núvem de palavras / análise de conteúdo;  
        
# Recomendaria  o seminário?: recomendaria
  if (analise_isincid$recomendaria[indice] == "Sim") analise_isincid$recomendaria[indice] <- 1 else
    if (analise_isincid$recomendaria[indice] == "Não") analise_isincid$recomendaria[indice] <- 2 else
      if (analise_isincid$recomendaria[indice] == "Talvez") analise_isincid$recomendaria[indice] <- 3 else
        analise_isincid$recomendaria[indice] = 3

# Escreva o porquê recomendaria o seminário: recomedaria_explique
# Campo texto: analisar com núvem de palavras / análise de conteúdo;               

# Escreva observação/comentário final: observacao_final
# Campo texto: analisar com núvem de palavras / análise de conteúdo;              
                                   
    indice = indice + 1
}

# Mais uma transformação: mudando variáveis tipo caracter e com conteúdo numérico,para tipo numérico!

analise_isincid$genero <- as.numeric(analise_isincid$genero)
analise_isincid$faixa_etaria <- as.numeric(analise_isincid$faixa_etaria)
analise_isincid$participou <- as.numeric(analise_isincid$participou)
analise_isincid$formato_seminario_adequado <- as.numeric(analise_isincid$formato_seminario_adequado)
analise_isincid$duracao_seminario <- as.numeric(analise_isincid$duracao_seminario)
analise_isincid$conteudo_seminario_expectativas <- as.numeric(analise_isincid$conteudo_seminario_expectativas)
analise_isincid$recomendaria <- as.numeric(analise_isincid$recomendaria)


# "Salvando" a nova planilha com as variáveis
if (!("writexl") %in% installed.packages()) install.packages("writexl")
library(writexl)
write_xlsx(analise_isincid, './dados/ead_isincid.xlsx')

