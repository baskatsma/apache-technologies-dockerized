#!/bin/bash

apt-get update -y && \
apt-get install -y python3-pip vim && \
pip3 install wget && \
pip3 install pyspark && \
echo "Going into ${SHARED_WORKSPACE} to test Spark using /run-spark.py..." && \
cd ${SHARED_WORKSPACE} && \
python3 /run-spark.py
