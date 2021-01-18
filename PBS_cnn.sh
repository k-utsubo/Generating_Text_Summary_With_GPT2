#PBS -N cnn
#PBS -j oe -l select=1
##PBS -q GPU-1
#PBS -q SINGLE

cd $PBS_O_WORKDIR


#(singularity exec --nv $IMAGES/ubuntu18.sif bash cnn.sh > cnn.log) >& /dev/stdout
(singularity exec $IMAGES/ubuntu18.sif bash cnn.sh > cnn.log) >& /dev/stdout
