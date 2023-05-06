#!/bin/bash
#SBATCH --job-name=cnn22811Dutch_FD
#SBATCH --partition=gpuq
#SBATCH --qos=gpu
#SBATCH --gres=gpu:A100.80gb:1
#SBATCH -N 1
#SBATCH --ntasks-per-node=12

#SBATCH --mem=150GB
#SBATCH --time=0-12:00:00

#SBATCH --output=cnn22811Dutch_FD.%j.out
#SBATCH --error=cnn22811Dutch_FD.%j.err

## load modules
module load gnu10
module load python

pip install --upgrade pip
pip install -r requirements.txt
python run_summarization_no_trainer_cnnDutch.py --model_name_or_path ainize/bart-base-cnn --dataset_name ml6team/cnn_dailymail_nl --dataset_config_name 3.0.0 --pred_distill --intermediate_distill --num_train_epochs 20 --weight_bits 2 --input_bits 2 --do_train --do_test --distill_encoder 1 --distill_decoder 1 --learning_rate 3e-5 --per_device_train_batch_size 16
