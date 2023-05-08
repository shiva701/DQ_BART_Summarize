#!/bin/bash
#SBATCH --job-name=eli5x22811xFD
#SBATCH --partition=gpuq
#SBATCH --qos=gpu
#SBATCH --gres=gpu:A100.80gb:1
#SBATCH -N 1
#SBATCH --ntasks-per-node=12

#SBATCH --mem=150GB
#SBATCH --time=0-12:00:00

#SBATCH --output=FDeli5x22811.%j.out
#SBATCH --error=FDeli5x22811.%j.err

## load modules
module load gnu10
module load python

pip install --upgrade pip
pip install -r requirements.txt
pip install datasets transformers accelerate
python run_summarization_no_trainer_1_eli5.py --model_name_or_path facebook/bart-base --dataset_name Rahmaa/eli5_final --pred_distill --intermediate_distill --num_train_epochs 20 --weight_bits 2 --do_train --do_test --distill_encoder 1 --distill_decoder 1 --learning_rate 3e-5 --per_device_train_batch_size 16
