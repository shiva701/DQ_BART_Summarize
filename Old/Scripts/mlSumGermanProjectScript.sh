#!/bin/bash
#SBATCH --job-name=mlSum88866_German
#SBATCH --partition=gpuq
#SBATCH --qos=gpu
#SBATCH --gres=gpu:A100.80gb:1
#SBATCH -N 1
#SBATCH --ntasks-per-node=12

#SBATCH --mem=150GB
#SBATCH --time=0-12:00:00

#SBATCH --output=mlSum88866_German.%j.out
#SBATCH --error=mlSum88866_German.%j.err

## load modules
module load gnu10
module load python

pip install --upgrade pip
pip install -r requirementsmlSum.txt
python run_summarization_no_trainer_mlSum_German.py --model_name_or_path Shahm/bart-german --dataset_name mlsum --dataset_config_name de --pred_distill --intermediate_distill --num_train_epochs 5 --weight_bits 8 --do_train --do_test --distill_encoder 6 --distill_decoder 6 --learning_rate 5e-5 --per_device_train_batch_size 6 --seed 42