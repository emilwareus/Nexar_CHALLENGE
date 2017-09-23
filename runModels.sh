#!/bin/bash
# The path to the config file
PATH_CONFIG=$PATH:~training/ssd_mobilenet_v1_pets.config

# The path to the csv files
PATH_INPUT_TO_TF_RECORD=$PATH:~data/test_labels.csv 
PATH_OUTPUT_TO_TF_RECORD=$PATH:~data/test.record

# THe path for the training
PATH_TRAIN_DIR=$PATH:~training/
PATH_PIPELINE_CONFIG_PATH=$PATH:~training/ssd_mobilenet_v1_pets.config

python3 generate_tfrecord.py --csv_input=data/train_labels.csv --output_path=data/train.record
# Do we ever use the test labels really? I dont think so actually..... 
# Why are they generated to a tf.record? The testing is done seperatly...
#python3 generate_tfrecord.py --csv_input=data/test_labels.csv --output_path=data/test.record

cd object_detection
python3 train.py --logtostderr --train_dir=training/ --pipeline_config_path=training/ssd_mobilenet_v1_pets.config

