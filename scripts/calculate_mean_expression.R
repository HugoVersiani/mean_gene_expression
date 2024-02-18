#!/usr/bin/env Rscript

# Carrega a biblioteca
library(tidyverse)

# Verifica os parametros
args <- commandArgs(trailingOnly = TRUE)
if (length(args) != 1) {
  stop("You must provide one command line argument: output directory")
}

# Obtem o diretório de saída dos argumentos da linha de comando
outdir <- args[1]

# Carrega os dados da expressão
expression_data <- read.csv(file = paste0(outdir, "/expression_data.csv"))

# Calcula a expressão média para cada gene
mean_expression <- rowMeans(expression_data[-1])

# Salva os valores médios da expressão
write.csv(data.frame(gene = rownames(expression_data), mean_expression = mean_expression),
          file = paste0(outdir, "/mean_expression.csv"))
