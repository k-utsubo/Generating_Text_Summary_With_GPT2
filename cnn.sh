#!/bin/bash

if [ ! -d venv ];then
    virtualenv -p python3 venv
fi
source venv/bin/activate
pip install -r requirements.txt

if [ ! -f CNN/CNN_file_size.pickle ];then
python max_article_sizes.py  $DATA/cnn-dailymail/cnn_stories_tokenized/  CNN
fi

if [ ! -f CNN/ids.json ];then
python prepare_data.py  $DATA/cnn-dailymail/cnn_stories_tokenized/  CNN CNN/CNN_file_size.pickle 
fi

python train_gpt2_summarizer.py --device cpu --batch_size 1 --root_dir CNN/gpt2_1024_data/

