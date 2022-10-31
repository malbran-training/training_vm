### 1) Create VM

<p>Create a new virtual machine, selecting Linux and Ubuntu64 as the Type and Version. Select sufficient memory (i.e. in green zone just before the redzone). For the hard disk, select the 'Create a virtial hard disk now' option. Choose VDI and dynamically allocated. Choose 1TB as the size.</p>

### 2) Install Ubuntu

<p>Follow instructions as directed on screen to install Ubuntu. Choose minimal installation. Restart when prompted.</p>

### 3) Run an update

    sudo apt-get update
    sudo apt-get upgrade
    reboot

### 4) Install the following software

    sudo apt-get install gcc make git

### 5) Install guest additions
<p>Insert and run the guest additions. Set the Shared Clipboard and Drag and Drop to be bidirectional. Restart the machine. Don't forget to eject the Guest Additons disk.</p>

### 6) Install singularity as root

    wget https://github.com/sylabs/singularity/releases/download/v3.9.8/singularity-ce_3.9.8-focal_amd64.deb
    sudo dpkg -i singularity-ce_3.9.8-focal_amd64.deb
    rm singularity-ce_3.9.8-focal_amd64.deb

### 7) Clone the repo for installing the software

    git clone https://github.com/pgimer-training/training_vm.git
    cd training_vm

### 8) Install miniconda

<p>Install latest version of miniconda for Python 3</p> 

    ./install_miniconda.sh
    
### 9) Install the software

<p>Install the softare in a specific conda environment and add a line to the bashrc to activate that environment.</p>

    ./install_conda_software.sh

### 10) Install the nextflow pipelines

    ./install_nf_pipelines.sh    
    
### 11) Install the additional software not available in a conda channel

    ./install_bactinspector.sh
    ./install_remove_blocks.sh
    ./install_convert_tsv_to_embl.sh
    
### 12) To enable shared folders

    sudo usermod -a -G vboxsf manager
  
### 13) Add terminal and screenshot to the menu
