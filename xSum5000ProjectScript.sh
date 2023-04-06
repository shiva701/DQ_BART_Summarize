#!/bin/bash
#SBATCH --job-name=xSum5000_16Batch20ep
#SBATCH --partition=gpuq
#SBATCH --qos=gpu
#SBATCH --gres=gpu:A100.80gb:1
#SBATCH -N 1
#SBATCH --ntasks-per-node=12

#SBATCH --mem=150GB
#SBATCH --time=0-1:00:00

#SBATCH --output=dqBart.%j.out
#SBATCH --error=dqBart.%j.err

## load modules
module load gnu10
module load python

pip install --upgrade pip
pip install -r requirements.txt
pip install datasets transformers accelerate
python run_summarization_no_trainer_1.py --model_name_or_path facebook/mbart-large-en-ro --dataset_name xsum --dataset_config_name 3.0.0 --pred_distill --intermediate_distill --num_train_epochs 20 --weight_bits 8 --do_train --do_test --distill_encoder 6 --distill_decoder 6 --learning_rate 3e-5 --per_device_train_batch_size 16
