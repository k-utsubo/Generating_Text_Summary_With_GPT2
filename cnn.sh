#!/bin/bash

if [ ! -d venv ];then
    virtualenv -p python3 venv
fi
source venv/bin/activate
pip install -r requirements.txt

python max_article_sizes.py  $DATA/cnn-dailymail/cnn_stories_tokenized/  CNN

python prepare_data.py  $DATA/cnn-dailymail/cnn_stories_tokenized/  CNN CNN/CNN_file_size.pickle 

python train_gpt2_summarizer.py --batch_size 1 --root_dir CNN/gpt2_1024_data/

