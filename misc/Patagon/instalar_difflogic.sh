#!/bin/bash
#SBATCH --job-name=InstalarML
#SBATCH --partition=L40
#SBATCH --output=instalar-%j.out
#SBATCH --error=instalar-%j.err

# Este comando usa la imagen remota, la descarga de nuevo, y ejecuta todos los comandos de instalación
srun --container-name=cuda-12.9 --container-image='nvcr.io/nvidia/cuda:12.9.1-base-ubuntu24.04' \
     --container-remap-root /bin/bash -c " \
        # Evita interacciones (como la de tzdata) y actualiza el sistema
        DEBIAN_FRONTEND=noninteractive apt update && \
        # Instala Python/PIP
        DEBIAN_FRONTEND=noninteractive apt install python3 python3-pip -y && \
        # Instala las dependencias de Machine Learning (ej. PyTorch)
        python3 -m pip install torch torchvision torchaudio && \
        # Instala tu software (DiffLogic CA)
        pip install difflogic-ca \
     "
