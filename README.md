## CS-678 NLP Project Spring 2023

## DQ-BART:  Efficient Sequence-to-Sequence Model via Joint Distillation and Quantization

This repository contains the code for the project. We have used the impementation of the ACL 2022 paper "DQ-BART: Efficient Sequence-to-Sequence Model via Joint Distillation and Quantization" and enhanced on top of that. We analyzed the code on the datasets used in the paper along with more multilingual data. We used existing multilingual bart models and also fine-tuned the base model to work on multi-lingual data. 

## Requirements
- Install dependencies via `pip install -r requirements.txt`. 

## Sample Command
- The following command will train an `8-8-8 3-1` model on CNN/DailyMail dataset. 
    ```bash
    python3 run_summarization_no_trainer.py \
      --model_name_or_path ainize/bart-base-cnn \
      --dataset_name cnn_dailymail \
      --dataset_config_name 3.0.0 \
      --pred_distill \
      --intermediate_distill \
      --num_train_epochs 20 \
      --weight_bits 8 \
      --do_train \
      --do_test \
      --distill_encoder 3 \
      --distill_decoder 1 \
      --learning_rate 3e-5 
    ```
