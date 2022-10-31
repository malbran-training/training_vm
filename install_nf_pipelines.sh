#!/bin/bash
#
# Script to install next flow nf-core and ghru pipelines
# Author: Jacqui Keane
#
# Usage: install_nf_pipelines.sh
#

set -x
set -eu

export MINICONDA="$HOME/miniconda"
export MINICONDA_BIN_LOCATION="$MINICONDA/bin"
export PATH="$MINICONDA_BIN_LOCATION:$PATH"

source $MINICONDA/etc/profile.d/conda.sh

# Create a nextflow-pipelines environment with nextflow and nf-core 
echo "Creating a nextflow-pipelines environment with nextflow and nf-core..."
conda create -n nextflow-pipelines nextflow=21.10.6
conda activate nextflow-pipelines
conda install nf-core

# Set up environment variables
cd ~
mkdir singularity
export NXF_SINGULARITY_CACHEDIR="$HOME/singularity"

# Install the pipelines
mkdir nf-pipelines
cd nf-pipelines

echo "Installing pipelines from nf core..."
nf-core download --compress none --container singularity --revision 1.5 fetchngs
nf-core download --compress none --container singularity --revision 1.0.0 bactmap

cd ..

# Install bespoke scripts for running nf pipelines
echo "Installing wrapper scripts for nextflow pipelines..."
git clone https://github.com/pgimer-training/nf_pipeline_scripts
cd nf_pipeline_scripts
cp run_fetch*.sh $MINICONDA/envs/nextflow-pipelines/bin
cp run_bactmap*.sh $MINICONDA/envs/nextflow-pipelines/bin

conda deactivate

set +eu
set +x
