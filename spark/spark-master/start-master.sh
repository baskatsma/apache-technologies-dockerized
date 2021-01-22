#!/bin/bash

export SPARK_MASTER_HOST=`hostname`

. "${SPARK_HOME}/sbin/spark-config.sh"

. "${SPARK_HOME}/bin/load-spark-env.sh"

echo "Starting master..."
echo "Using SPARK_HOME = $SPARK_HOME"
echo "Using SPARK_MASTER_HOST = $SPARK_MASTER_HOST"
echo "Using SPARK_MASTER_PORT = $SPARK_MASTER_PORT"
echo "Using SPARK_MASTER_WEBUI_PORT = $SPARK_MASTER_WEBUI_PORT"

${SPARK_HOME}/bin/spark-class org.apache.spark.deploy.master.Master --ip $SPARK_MASTER_HOST --port $SPARK_MASTER_PORT --webui-port $SPARK_MASTER_WEBUI_PORT
