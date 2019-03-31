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
mkdir -p ~/output/data/otus/
cd ~/output/data/outus/

# QIIME code

echo "Picking closed reference OTUs"
echo "Read 1"
for i in {1..3}
do
    echo "run $i"
    time pick_closed_reference_otus.py \
    -i /lustre/home/d411/zcbtprm/output/data/~./slout_1/seqs.fna\
    -o ./otus \
    -f -a -O 16
done

echo "Read 2"
for i in {1..3}
do
    echo "run $i"
    time pick_closed_reference_otus.py \
    -i /lustre/home/d411/zcbtprm/output/data/~./slout_2/seqs.fna.incomplete\
    -o ./otus \
    -f -a -O 16
done

echo "closing environment"
source deactivate

### end script
