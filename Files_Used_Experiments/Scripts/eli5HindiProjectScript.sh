#!/bin/bash
#SBATCH --job-name=eli5_88866_Hindi
#SBATCH --partition=gpuq
#SBATCH --qos=gpu
#SBATCH --gres=gpu:A100.80gb:1
#SBATCH -N 1
#SBATCH --ntasks-per-node=12

#SBATCH --mem=150GB
#SBATCH --time=0-12:00:00

#SBATCH --output=eli5_88866_Hindi.%j.out
#SBATCH --error=eli5_88866_Hindi.%j.err

## load modules
module load gnu10
module load python

pip install --upgrade pip
pip install -r requirementsmlSum.txt
python run_summarization_no_trainer_eli5Hindi.py --model_name_or_path ml6team/mbart-large-cc25-cnn-dailymail-xsum-nl --tokenizer_name facebook/mbart-large-cc25 --pred_distill --intermediate_distill --num_train_epochs 10 --weight_bits 8 --do_train --do_test --distill_encoder 6 --distill_decoder 6 --learning_rate 5e-5 --per_device_train_batch_size 8 --train_file eli5_train_hindi.csv --test_file eli5_test_hindi.csv --validation_file eli5_validation_hindi.csv --seed 42