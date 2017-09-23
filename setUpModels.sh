#!/bin/bash
echo "This is a test script!"
git clone https://github.com/tensorflow/models.git
yes Y |sudo apt-get install protobuf-compiler python-pil python-lxml
sudo -H pip install jupyter
sudo -H pip install matplotlib
ls
cd models/research
protoc object_detection/protos/*.proto --python_out=.
export PYTHONPATH=$PYTHONPATH:`pwd`:`pwd`/slim
sudo python3 setup.py install 
echo "The installation script is now done"
cd object_detection
#mkdir data
mkdir images
cd images
mkdir test
mkdir train
cd ..
mkdir training
echo "Now you need to add the data to the different folders"
cd ..
python object_detection/builders/model_builder_test.py
echo "If the test passed the instalation was succesfull"


