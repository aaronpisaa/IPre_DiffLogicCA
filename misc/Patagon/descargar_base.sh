#!/bin/bash
#SBATCH --job-name=DescargarBase
#SBATCH --partition=L40
#SBATCH --gpus=1
#SBATCH --output=descarga-%j.out
#SBATCH --error=descarga-%j.err

# Comando para descargar la imagen base de NGC y ejecutar nvidia-smi -L para probar
# La imagen se guarda localmente con el nombre "cuda-12.9"
srun --container-name=cuda-12.9 --container-image='nvcr.io/nvidia/cuda:12.9.1-base-ubuntu24.04' nvidia-smi -L
