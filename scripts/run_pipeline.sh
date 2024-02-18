#!/bin/bash

# O primeiro parametro é o diretorio de saida
outdir=$1
mkdir -p $outdir

# O segundo parametro é o ID do dataset no GEO
dataset_id=$2

# Passe o diretório de saída e o ID do conjunto de dados para cada estágio do pipeline
Rscript download_data.R $outdir $dataset_id
Rscript calculate_mean_expression.R $outdir
python plot_mean_expression.py $outdir
