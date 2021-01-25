#!/bin/bash

# Fix "java.lang.NoClassDefFoundError: org/slf4j/Logger"
export SPARK_DIST_CLASSPATH=$(hadoop classpath)

# Load Spark environment variables
. "${SPARK_HOME}/sbin/spark-config.sh"
. "${SPARK_HOME}/bin/load-spark-env.sh"

echo "Starting worker..."
echo "Using SPARK_HOME = $SPARK_HOME"
echo "Using SPARK_MASTER = $SPARK_MASTER"
echo "Using SPARK_WORKER_WEBUI_PORT = $SPARK_WORKER_WEBUI_PORT"

${SPARK_HOME}/bin/spark-class org.apache.spark.deploy.worker.Worker --webui-port $SPARK_WORKER_WEBUI_PORT $SPARK_MASTER
