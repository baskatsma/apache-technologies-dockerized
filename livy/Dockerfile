FROM spark-core:2.4.0

ARG livy_version='0.7.0-incubating'

ENV LIVY_HOME="/usr/livy-${livy_version}"

COPY start-livy.sh /start-livy.sh
COPY conf/livy.conf /tmp/livy.conf

# Install Livy
RUN wget -q http://archive.apache.org/dist/incubator/livy/${livy_version}/apache-livy-${livy_version}-bin.zip -O livy.zip && \
    unzip -q livy.zip && \
    mv apache-livy-${livy_version}-bin "${LIVY_HOME}" && \
    rm livy.zip && \
    cp /tmp/livy.conf ${LIVY_HOME}/conf

ENV PATH="${LIVY_HOME}/bin:${PATH}"

EXPOSE 8998

WORKDIR ${LIVY_HOME}

CMD ["/bin/bash", "/start-livy.sh"]
