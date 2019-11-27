library(implyr)
library(odbc)
library(dplyr)

drv <- odbc::odbc()
impala_conn <- src_impala(
  drv = drv
  , driver = "Cloudera ODBC Driver for Impala"
  , host = "lcloudera-cl1.procempa.com.br"
  , port = 21050
  , database = "observamob"
  , uid = "eptc"
  , pwd = "eptc01"
)

(src_tbls(impala_conn))

#atend <- tbl(impala_conn, "atendimentos")
#t_teste <- tbl(impala_conn, "teste")
t_teste3 <- tbl(impala_conn, "teste3")
t_teste3
class(t_teste3)
tabela = as.data.frame(t_teste3)
View(tabela)
validUTF8(tabela)
aa = collect(t_teste3)
aa = as.data.frame(aa)
#aa$descricao <- iconv(aa$descricao, to = "latin1//TRANSLIT", from = "UTF-8")
aa$descricao <- iconv(aa$descricao, to = "UTF-8", from = "latin1//TRANSLIT")
aa




#t_teste4 <- tbl(impala_conn, "airlines")
#t_teste4
#class(t_teste4)
#tabela = as.data.frame(t_teste4)
#View(tabela)
#validUTF8(tabela)
#aa = collect(t_teste3)
#aa = as.data.frame(aa)
#aa$descricao <- iconv(aa$descricao, to = "latin1//TRANSLIT", from = "UTF-8")
#aa$descricao <- iconv(aa$descricao, to = "UTF-8", from = "latin1//TRANSLIT")
#aa



library(nycflights13)
dim(airlines)
head(airlines)
airlines_df = as.data.frame(airlines)
class(airlines_df)
copy_to(impala_conn, airlines_df, temporary = FALSE)




aereas <- tbl(impala_conn, "airlines_df")
aereas
class(t_teste3)
tabela = as.data.frame(aereas)
View(tabela)

