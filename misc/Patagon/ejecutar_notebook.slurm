#!/bin/bash
#SBATCH -p L40
#SBATCH --gpus=1
#SBATCH -J DiffLogicCA
#SBATCH -o DiffLogicCA-%j.out
#SBATCH -e DiffLogicCA-%j.err
#SBATCH --time=08:00:00

# Ejecutar el notebook completo
srun --container-workdir=${PWD} --container-name=python-cuda \
     jupyter nbconvert --to notebook --execute diffLogic_CA.ipynb \
     --output diffLogic_CA_executed.ipynb
