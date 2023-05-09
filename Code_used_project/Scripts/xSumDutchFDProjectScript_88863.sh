#!/bin/bash
#SBATCH --job-name=xSum88863Dutch_FD
#SBATCH --partition=gpuq
#SBATCH --qos=gpu
#SBATCH --gres=gpu:A100.80gb:1
#SBATCH -N 1
#SBATCH --ntasks-per-node=12

#SBATCH --mem=150GB
#SBATCH --time=0-7:00:00

#SBATCH --output=xSum88863Dutch_FD.%j.out
#SBATCH --error=xSum88863Dutch_FD.%j.err

## load modules
module load gnu10
module load python

pip install --upgrade pip
pip install -r requirements.txt
python run_summarization_no_trainer_xSumDutch.py --model_name_or_path morenolq/bart-base-xsum --dataset_name yhavinga/xsum_dutch --dataset_config_name 1.0.0 --pred_distill --intermediate_distill --num_train_epochs 4 --weight_bits 8 --do_train --do_test --distill_encoder 6 --distill_decoder 3 --learning_rate 5e-5 --per_device_train_batch_size 16
