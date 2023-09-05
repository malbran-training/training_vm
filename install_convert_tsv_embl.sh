set -x
set -eu

export MINICONDA="$HOME/miniconda"
export MINICONDA_BIN_LOCATION="$MINICONDA/bin"
export PATH="$MINICONDA_BIN_LOCATION:$PATH"

source $MINICONDA/etc/profile.d/conda.sh

# Take a copy of the software repository
cd ~/src
git clone https://github.com/zadyson/convert_tsv_to_embl.git

# Create convert_tsv_embl conda profile
conda create -n convert_tsv_embl python=2
conda activate convert_tsv_embl 

# Install convert_tsv_embl
cd convert_tsv_to_embl 
chmod 777 convert_csv_embl.py
cp convert_csv_embl.py ~/miniconda/envs/convert_tsv_embl/bin/

conda deactivate

# Tidy up
cd ..
rm -rf convert_tsv_to_embl

set +eu
set +x
