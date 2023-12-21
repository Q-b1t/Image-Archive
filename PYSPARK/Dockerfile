ARG IMAGE=apache/spark-py:latest

FROM ${IMAGE} as spark-img 

FROM spark-img as env-setup

ARG INTERNAL_WORKSPACE=/spark_env

USER root
RUN echo "" > /tmp/java_opts.txt
RUN chmod 777 /tmp/java_opts.txt
RUN chown root:root /tmp/java_opts.txt
RUN ln -s /opt/spark/bin/pyspark /usr/bin/pyspark && ln -s /opt/spark/bin/spark-submit /usr/bin/spark-submit

WORKDIR ${INTERNAL_WORKSPACE}

EXPOSE 8032

FROM env-setup as additional-dependencies

RUN apt update && apt upgrade -y && \
    apt install -y nano && \
    apt install -y vim && \
    apt install -y tree 



CMD ["bash"]