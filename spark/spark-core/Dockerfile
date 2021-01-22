FROM core

# https://www.kdnuggets.com/2020/07/apache-spark-cluster-docker.html
# https://medium.com/@marcovillarreal_40011/creating-a-spark-standalone-cluster-with-docker-and-docker-compose-ba9d743a157f

ARG scala_version='2.11.12'
ARG spark_version='2.4.0'
ARG hadoop_version='2.7.7'
ARG hadoop_spark_version='2.7'

ENV SCALA_HOME="/usr/scala-${scala_version}"
ENV SPARK_HOME="/usr/spark-${spark_version}"
ENV HADOOP_HOME="/usr/hadoop-${hadoop_version}"

RUN apt-get update -y && \
    apt-get install -y wget unzip procps

# Install Scala
RUN wget -q https://downloads.typesafe.com/scala/${scala_version}/scala-${scala_version}.tgz -O scala.tgz && \ 
    tar -xzf scala.tgz && \
    mv scala-${scala_version} "${SCALA_HOME}" && \
    rm scala.tgz

ENV PATH="${SCALA_HOME}/bin:${PATH}"

# Install Spark
RUN wget -q https://archive.apache.org/dist/spark/spark-${spark_version}/spark-${spark_version}-bin-hadoop${hadoop_spark_version}.tgz -O spark.tgz && \
#RUN wget -q https://apache.newfountain.nl/spark/spark-${spark_version}/spark-${spark_version}-bin-hadoop${hadoop_spark_version}.tgz -O spark.tgz && \
#RUN wget -q https://apache.newfountain.nl/spark/spark-${spark_version}/spark-${spark_version}-bin-without-hadoop.tgz -O spark.tgz && \
    tar -xzf spark.tgz && \
    mv spark-${spark_version}-bin-hadoop${hadoop_spark_version} "${SPARK_HOME}" && \
    #mv spark-${spark_version}-bin-without-hadoop "${SPARK_HOME}" && \
    rm spark.tgz

ENV PATH="${SPARK_HOME}/bin:${PATH}"

ENV SPARK_MASTER_HOST spark-master
ENV SPARK_MASTER_PORT 7077
ENV PYSPARK_PYTHON python3

# Install Hadoop
RUN wget -q https://archive.apache.org/dist/hadoop/common/hadoop-${hadoop_version}/hadoop-${hadoop_version}.tar.gz -O hadoop.tar.gz && \
    tar -xzf hadoop.tar.gz && \
    mv hadoop-${hadoop_version} "${HADOOP_HOME}" && \
    rm hadoop.tar.gz

ENV PATH="${HADOOP_HOME}/bin:${PATH}"

ENV HADOOP_OPTS="-Djava.library.path=${HADOOP_HOME}/lib/native"
ENV LD_LIBRARY_PATH="${HADOOP_HOME}/lib/native"

WORKDIR ${SPARK_HOME}
