#!/bin/bash
#SBATCH --job-name=cnnM88863Dutch_FD
#SBATCH --partition=gpuq
#SBATCH --qos=gpu
#SBATCH --gres=gpu:A100.80gb:1
#SBATCH -N 1
#SBATCH --ntasks-per-node=12

#SBATCH --mem=150GB
#SBATCH --time=0-12:00:00

#SBATCH --output=cnnM88863Dutch_FD.%j.out
#SBATCH --error=cnnM88863Dutch_FD.%j.err

## load modules
module load gnu10
module load python

pip install --upgrade pip
pip install -r requirements.txt
python run_summarization_no_trainer_cnnDutch.py --model_name_or_path ml6team/mbart-large-cc25-cnn-dailymail-xsum-nl --dataset_name ml6team/cnn_dailymail_nl --dataset_config_name 3.0.0 --tokenizer_name facebook/mbart-large-cc25 --pred_distill --intermediate_distill --num_train_epochs 20 --weight_bits 8 --do_train --do_test --distill_encoder 6 --distill_decoder 3 --learning_rate 3e-5 --per_device_train_batch_size 16
