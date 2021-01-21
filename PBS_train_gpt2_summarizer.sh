#PBS -N train_gpt2_summarizer
#PBS -j oe -l select=2
##PBS -q GPU-1
#PBS -q SINGLE

cd $PBS_O_WORKDIR


#(singularity exec --nv $IMAGES/ubuntu18.sif bash train_gpt2_summarizer.sh > train_gpt2_summarizer.log) >& /dev/stdout
(singularity exec $IMAGES/ubuntu18.sif bash train_gpt2_summarizer.sh > train_gpt2_summarizer.log) >& /dev/stdout
