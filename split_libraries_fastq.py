#!/bin/bash --login
#PBS -l walltime=15:00:00
#PBS -l select=1:ncpus=32
#PBS -N split_benchm
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
mkdir -p ~/output/data/
cd ~/output/data/

# QIIME Code

echo "Demultiplexing with QIIME defaults"
echo "read1"
# note: the command below is broken across several lines using backslashes (\)
# you could also have the code on a single line with spaces instead
time split_libraries_fastq.py \
-i ~mbaron/2019/read1.fastq.gz \
-b ~mbaron/2019/index.fastq.gz \
-m ~zcbtprm/scripts/map.tsv \
-o ~./slout_1 \
--rev_comp_barcode --rev_comp_mapping_barcodes

echo "read2"
time split_libraries_fastq.py \
-i ~mbaron/2019/read2.fastq.gz \
-b ~mbaron/2019/index.fastq.gz \
-m ~zcbtprm/scripts/map.tsv \
-o ~./slout_2 \
--rev_comp_barcode --rev_comp_mapping_barcodes

echo "closing environment"
conda deactivate
### script end
