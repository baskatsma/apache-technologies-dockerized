#!/bin/bash

. "${SPARK_HOME}/sbin/spark-config.sh"

. "${SPARK_HOME}/bin/load-spark-env.sh"

${LIVY_HOME}/bin/livy-server start && tail -F ${LIVY_HOME}/conf/livy.conf
