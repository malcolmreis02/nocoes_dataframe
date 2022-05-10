df <- read.csv('data-frame-height.csv')

str(df) #nome das colunas e os tipos de dados contidos nelas
summary(df) #vendo algumas medidas do df: media, minima, maxima

df$Male.Height.in.Ft <- NULL #excluindo colunas desnecessarias
df$Female.Height.in.Ft <- NULL

names(df)[1] #consultando o nome da primeira coluna
names(df) = c('Rank', 'País', 'Altura Masculina', 'Altura Feminina')   #mudando o nome das colunas

head(is.na(df)) #vendo se tem algum dados que está em NA (faltando)
table(is.na(df)) #quantos NA tem nessa tabela, false=nao tem na

df$`Altura Masculina`[df$`Altura Masculina`==183.78] = 183.79 #substituindo o valor da tabela
#'o valor da altura masculina no dataframe df onde a altura masculina no dataframe df é igual a 183.78 será 183.79'

#--------------- MANIPULANDO A BASE DE DADOS -----------------------#

df.2 = edit(df)
df.2$Diferenca = df.2$`Altura Masculina`-df.2$`Altura Feminina`
str(df.2)

# CRIANDO UM PEQUENO BANCO DE DADOS NA MAO

Pessoas = c('Pai', 'Mãe', 'Filho')
Idade = c(41, 35, 19)
pessoas_da_casa = data.frame(Pessoas, Idade)
head(pessoas_da_casa)

Altura = c(184, 176, 183)
grupo_familiar = data.frame(Pessoas, Altura)

informacoes_familia = merge(pessoas_da_casa, grupo_familiar, by='Pessoas')

informacoes_familia$classificacao = c(ifelse(informacoes_familia$Altura>180, 'Alto', 'Normal')) #adicionando uma coluna com valores ja condicionais aos dados de outra coluna
str(informacoes_familia)