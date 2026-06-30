install.packages("COVIDIBGE")
library(COVIDIBGE)
library(tidyverse)
library(survey)

dadosPNADCOVID19 <- get_covid(year=2020, month=9)



dados_variaveis <- dadosPNADCOVID19$variables


df_colunas <- dados_variaveis |>
  filter(
    V1022 == "Urbana" | V1022 == "Rural", 
    B0043 == "Sim"   | B0043 == "Não"           
  ) |> mutate (
    zonas_rurais_urbanas = as.caracter(V1022),
    sus_sim_nao = as.character(B0043)
  ) |> group_by(zonas_rurais_urbanas, sus_sim_nao) |>
  summarise(total = n(), .groups = "drop")