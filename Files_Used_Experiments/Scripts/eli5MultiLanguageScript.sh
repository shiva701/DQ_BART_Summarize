#!/bin/bash
#SBATCH --job-name=eli5Russian88866
#SBATCH --partition=gpuq
#SBATCH --qos=gpu
#SBATCH --gres=gpu:A100.80gb:1
#SBATCH -N 1
#SBATCH --ntasks-per-node=12

#SBATCH --mem=150GB
#SBATCH --time=0-0:30:00

#SBATCH --output=eli5Russian88866.%j.out
#SBATCH --error=eli5Russian88866.%j.err

## load modules
module load gnu10
module load python

pip install --upgrade pip
pip install -r requirements.txt
python eli5MultiLanguage_trainer.py --model_name_or_path facebook/bart-base --pred_distill --intermediate_distill --num_train_epochs 4 --weight_bits 8 --do_train --do_test --distill_encoder 6 --distill_decoder 6 --learning_rate 5e-5 --per_device_train_batch_size 8 --train_file eli5_train_russian.csv --test_file eli5_test_russian.csv --validation_file eli5_validation_russian.csv --seed 42
