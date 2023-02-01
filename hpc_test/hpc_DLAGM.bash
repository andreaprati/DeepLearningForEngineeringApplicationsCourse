#!/bin/bash
#SBATCH --partition=gpu
#SBATCH --nodes=1
#SBATCH --gres=gpu:1
#SBATCH --qos=gpu
#SBATCH --time 00:10:00
#SBATCH --mem=32gb
#SBATCH --ntasks-per-node 10


#< Charge resources to account
#SBATCH --reservation=hpc_t_2022_dlagm20221214    
#SBATCH --account T_2022_dlagm

echo $SLURM_JOB_NODELIST

echo  #OMP_NUM_THREADS : $OMP_NUM_THREADS

module load miniconda3
source "$CONDA_PREFIX/etc/profile.d/conda.sh"
conda activate pytorch-cuda-11.1

python ./hpc_test/hpc_test.py --dataset_path /hpc/archive/T_2022_DLAGM/tomaso.fontanini/cifar10 \
--checkpoint_path /hpc/group/T_2022_DLAGM/tomaso.fontanini/hpc_exp

conda deactivate
