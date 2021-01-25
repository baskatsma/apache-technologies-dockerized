FROM core

ARG scala_version='2.11.12'
ARG spark_version='2.4.0'
ARG hadoop_version='2.7.7'

ENV SCALA_HOME="/usr/scala-${scala_version}"
ENV SPARK_HOME="/usr/spark-${spark_version}"
ENV HADOOP_HOME="/usr/hadoop-${hadoop_version}"

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
    wget unzip procps && \
    rm -rf /var/lib/apt/lists/*

# Install Scala
RUN wget -qO- https://downloads.typesafe.com/scala/${scala_version}/scala-${scala_version}.tgz | tar -xzf - && \ 
    mv scala-${scala_version} "${SCALA_HOME}"

ENV PATH="${SCALA_HOME}/bin:${PATH}"

# Install Spark
RUN wget -qO- https://archive.apache.org/dist/spark/spark-${spark_version}/spark-${spark_version}-bin-without-hadoop.tgz | tar -xzf - && \
    mv spark-${spark_version}-bin-without-hadoop "${SPARK_HOME}"

ENV PATH="${SPARK_HOME}/bin:${PATH}"

ENV SPARK_MASTER_HOST spark-master
ENV SPARK_MASTER_PORT 7077
ENV PYSPARK_PYTHON python3

# Install Hadoop
RUN wget -qO- https://archive.apache.org/dist/hadoop/common/hadoop-${hadoop_version}/hadoop-${hadoop_version}.tar.gz | tar -xzf - && \
    mv hadoop-${hadoop_version} "${HADOOP_HOME}"

ENV PATH="${HADOOP_HOME}/bin:${PATH}"

# Fix “Unable to load native-hadoop library for your platform” warning
ENV HADOOP_OPTS="-Djava.library.path=${HADOOP_HOME}/lib/native"
ENV LD_LIBRARY_PATH="${HADOOP_HOME}/lib/native"

WORKDIR ${SPARK_HOME}
