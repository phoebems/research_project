#!/bin/bash --login
#PBS -l walltime=02:00:00
#PBS -l select=1:ncpus=16
#PBS -N otu_benchm
#PBS -A d411-training
#PBS -j oe

### script start

echo "setting temporary directory"
mkdir -p ~/qiime_tmp
export TMPDIR=~/qiime_tmp

echo "loading virtual environment"
source deactivate
source activate qiime1

echo "creating and cd to output directory"
mkdir -p ~/output/data/diversity/
cd ~/output/data/diversity/

# QIIME code


echo "Core diversity analysis"
time core_diversity_analysis.py \
        -i ~/otus/otu_table.biom \
        -m ~/scripts/map.tsv \
        -t ~/otus/97_otus.tree \
        -o ~/cdout
        -e 96000
        -a -0 16 \
        --recover_from_failure



echo "closing environment"
source deactivate

### end script
