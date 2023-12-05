# Fase 0
# Importando os dados originais da planilha Google para o RStudio
if (!("readxl") %in% installed.packages()) install.packages("readxl")
library(readxl)
sincid_avaliacao <- read_excel("/Users/joaopedroalbino/Downloads/GitHub/I-SINCID/dados/Respostas Questionário I SINCID /SINCID - pós evento (respostas) 2 - 47.xlsx", 
                                      col_types = c("date", "text", "text", 
                                                    "text", "text", "numeric", "numeric", 
                                                    "numeric", "numeric", "text", "text", 
                                                    "text", "text", "text", "text", "text", 
                                                    "text", "text", "text", "text", "text", 
                                                    "text", "text", "text"))
View(sincid_avaliacao)                   

# Acertando os nomes das variáveis

sincid_avaliacao$data = sincid_avaliacao$`Carimbo de data/hora`
sincid_avaliacao$email = sincid_avaliacao$`Endereço de e-mail`
sincid_avaliacao$genero = sincid_avaliacao$Gênero
sincid_avaliacao$faixa_etaria = sincid_avaliacao$Idade
sincid_avaliacao$participou = sincid_avaliacao$`Você conseguiu participar do evento?`
sincid_avaliacao$avalie_seminario = sincid_avaliacao$`Por favor, avalie o seminário em uma escala de 1 a 5, onde:`
sincid_avaliacao$conteudo_apresentacoes_avalie = sincid_avaliacao$`O que você achou do conteúdo das apresentações?`
sincid_avaliacao$qualidade_apresentacoes_avalie =sincid_avaliacao$`Como você avalia a qualidade das apresentações?`
sincid_avaliacao$organizacao_evento_avalie = sincid_avaliacao$`Como você avalia a organização do evento?`
sincid_avaliacao$formato_seminario_adequado = sincid_avaliacao$`O formato do seminário (palestras, workshops, painéis, etc.) foi adequado?`
sincid_avaliacao$duracao_seminario = sincid_avaliacao$`A duração do seminário foi?`
sincid_avaliacao$conteudo_seminario_expectativas = sincid_avaliacao$`O conteúdo do seminário atendeu às suas expectativas?`
sincid_avaliacao$conteudo_seminario_avalie = sincid_avaliacao$`Caso queira, explique o motivo`
sincid_avaliacao$apresentador_palestra_melhor = sincid_avaliacao$`Qual apresentador/palestra você mais gostou ou apreciou?`
sincid_avaliacao$apresentador_palestra_melhor_avalie = sincid_avaliacao$`Caso queira, explique o por quê`
sincid_avaliacao$mais_gostou_seminario = sincid_avaliacao$`Por favor, escreva o que você mais gostou no seminário?`
sincid_avaliacao$nao_gostou_seminario = sincid_avaliacao$`Por favor, nos informe o que você não gostou no seminário?`
sincid_avaliacao$melhorado_apresentacoes = sincid_avaliacao$`O que você gostaria de ver melhorado nas apresentações?`
sincid_avaliacao$nao_participou_motivo = sincid_avaliacao$`Qual foi o principal motivo para não ter participado?`
sincid_avaliacao$nao_participou_descricao = sincid_avaliacao$`Caso queira, descreva motivo`
sincid_avaliacao$topicos_futuros_seminarios = sincid_avaliacao$`Quais tópicos ou áreas você gostaria de ver abordados em futuros seminários em Ciência de Dados?`
sincid_avaliacao$recomendaria = sincid_avaliacao$`Você recomendaria este seminário a outras pessoas?`
sincid_avaliacao$recomedaria_explique = sincid_avaliacao$`Caso queira, explique.`
sincid_avaliacao$observacao_final = sincid_avaliacao$`Existe alguma outra observação ou comentário que você gostaria de compartilhar com os organizadores?`

# "Limpando" os campos duplicados
sincid_avaliacao$`Carimbo de data/hora` = NULL
sincid_avaliacao$`Endereço de e-mail` = NULL
sincid_avaliacao$`Gênero` = NULL
sincid_avaliacao$`Idade` = NULL
sincid_avaliacao$`Você conseguiu participar do evento?` = NULL
sincid_avaliacao$`Por favor, avalie o seminário em uma escala de 1 a 5, onde:` = NULL
sincid_avaliacao$`O que você achou do conteúdo das apresentações?` = NULL
sincid_avaliacao$`Como você avalia a qualidade das apresentações?` = NULL
sincid_avaliacao$`Como você avalia a organização do evento?` = NULL
sincid_avaliacao$`O formato do seminário (palestras, workshops, painéis, etc.) foi adequado?` = NULL
sincid_avaliacao$`A duração do seminário foi?` = NULL
sincid_avaliacao$`O conteúdo do seminário atendeu às suas expectativas?` = NULL
sincid_avaliacao$`Caso queira, explique o motivo` = NULL
sincid_avaliacao$`Qual apresentador/palestra você mais gostou ou apreciou?` = NULL
sincid_avaliacao$`Caso queira, explique o por quê` = NULL
sincid_avaliacao$`Por favor, escreva o que você mais gostou no seminário?` = NULL
sincid_avaliacao$`Por favor, nos informe o que você não gostou no seminário?` = NULL
sincid_avaliacao$`O que você gostaria de ver melhorado nas apresentações?` = NULL
sincid_avaliacao$`Qual foi o principal motivo para não ter participado?` = NULL
sincid_avaliacao$`Caso queira, descreva motivo` = NULL
sincid_avaliacao$`Quais tópicos ou áreas você gostaria de ver abordados em futuros seminários em Ciência de Dados?` = NULL
sincid_avaliacao$`Você recomendaria este seminário a outras pessoas?` = NULL
sincid_avaliacao$`Caso queira, explique.` = NULL
sincid_avaliacao$`Existe alguma outra observação ou comentário que você gostaria de compartilhar com os organizadores?` = NULL

# "Gravando" a planilha com as novas variáveis
if (!("writexl") %in% installed.packages()) install.packages("writexl")
library(writexl)
write_xlsx(sincid_avaliacao, './dados/avaliacao_isincid.xlsx')

