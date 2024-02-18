#!/usr/bin/env Rscript

# Carrega as bibliotecas necessárias
library(Biobase)
library(GEOquery)

# Verifica os argumentos da linha de comando
args <- commandArgs(trailingOnly = TRUE)
if (length(args) != 2) {
  stop("You must provide two command line arguments: output directory and dataset ID")
}

# Obtem o diretório da saída e o GEO ID dos parametros da linha de comando
outdir <- args[1]
geo_id <- args[2]

# Busca os dados do banco de dados GEO
gset <- getGEO(geo_id, GSEMatrix =TRUE, getGPL=FALSE)

# Verifica se o download dos dados foi bem-sucedido
if (is.null(gset)) {
  stop("Failed to download data from GEO database")
}

# Se houver vários conjuntos de dados, use o primeiro
if (is.list(gset)) {
  gset <- gset[[1]]
}

# Obtem os dados da expressão e arredonde para números inteiros
expression_data <- round(exprs(gset))

# Salva os dados
write.csv(expression_data, file = paste0(outdir, "/expression_data.csv"))
