#!/bin/bash
echo "This is a test script!"
git clone https://github.com/tensorflow/models.git
apt-get install protobuf-compiler python-pil python-lxml
pip install jupyter
pip install matplotlib
ls
cd models
protoc object_detection/protos/*.proto --python_out=.
export PYTHONPATH=$PYTHONPATH:`pwd`:`pwd`/slim
sudo python3 setup.py install 
echo "The installation script is now done"
