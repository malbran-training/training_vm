#!/bin/bash
#
# Script to install the latest version of miniconda
# Author: Jacqui Keane
#
# Usage: install_miniconda.sh
#

set -x
set -eu

# Script assumes a user exists called software and that the script is run as user software

# Set up variables and add miniconda location to PATH
export MINICONDA="$HOME/miniconda"
export MINICONDA_BIN_LOCATION="$MINICONDA/bin"
export PATH="$MINICONDA_BIN_LOCATION:$PATH"

# Download and install miniconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
bash miniconda.sh -b -p $MINICONDA

# Set conda for autoinstalls and update conda
conda config --set always_yes yes
conda update -n base -c defaults conda

# Useful for debugging any issues with conda
conda info -a

# Set the conda channels
conda config --add channels default
conda config --add channels r
conda config --add channels bioconda
conda config --add channels conda-forge
conda config --set channel_priority strict

# Initialise conda
conda init bash

cd ~
mkdir course_data
cd course_data
git clone https://github.com/malbran-training/linux.git
git clone https://github.com/malbran-training/data_formats.git
git clone https://github.com/malbran-training/microbial_analysis_I.git
git clone https://github.com/malbran-training/pangenome.git
git clone https://github.com/malbran-training/bioinformatics_essentials.git
git clone https://github.com/malbran-training/long_read_assembly.git
git clone https://github.com/malbran-training/igv.git
git clone https://github.com/malbran-training/amr.git

echo "!!! Don't forget to set a permanent global variable on the server MINICONDA=$MINICONDA !!!"

set +eu
set +x
