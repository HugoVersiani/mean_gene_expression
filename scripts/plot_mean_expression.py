#!/usr/bin/env python

import pandas as pd
import matplotlib.pyplot as plt
import sys

# Verifica os argumentos da linha de comando
if len(sys.argv) != 2:
    sys.exit("You must provide one command line argument: output directory")

# Obtém o diretório de saída dos argumentos da linha de comando
outdir = sys.argv[1]

# Carrega os dados da expressão média
df = pd.read_csv(f'{outdir}/mean_expression.csv')

# Cria o grafico
plt.hist(df['mean_expression'], bins=50)

# Nomeia os eixos
plt.xlabel('Mean Expression')
plt.ylabel('Frequency')

# Salva os graficos
plt.savefig(f'{outdir}/mean_expression_histogram.png')
