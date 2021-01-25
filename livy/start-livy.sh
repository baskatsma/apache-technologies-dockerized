#!/bin/bash

# Fix "java.lang.NoClassDefFoundError: org/slf4j/Logger"
export SPARK_DIST_CLASSPATH=$(hadoop classpath)

# Load Spark environment variables
. "${SPARK_HOME}/sbin/spark-config.sh"
. "${SPARK_HOME}/bin/load-spark-env.sh"

${LIVY_HOME}/bin/livy-server start && tail -F ${LIVY_HOME}/conf/livy.conf
