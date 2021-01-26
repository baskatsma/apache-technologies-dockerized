FROM spark-core:2.4.0

COPY start-master.sh /start-master.sh
COPY test-pyspark.sh /test-pyspark.sh
COPY run-spark.py /run-spark.py

ENV SPARK_MASTER_PORT 7077
ENV SPARK_MASTER_WEBUI_PORT 8080

EXPOSE 8080 7077 6066

CMD ["/bin/bash", "/start-master.sh"]
