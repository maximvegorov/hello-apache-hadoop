FROM openjdk:8-jdk-stretch

ENV HADOOP_VERSION=3.1.2
ENV HADOOP_HOME=/opt/apache-hadoop
ENV HADOOP_LOG_DIR=/var/log/apache-hadoop

ENV HDFS_NAMENODE_USER=root HDFS_DATANODE_USER=root HDFS_SECONDARYNAMENODE_USER=root

ENV PATH=${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin:${PATH}

RUN apt-get update && \
    apt-get install -y openssh-server && \
    ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && \
    chmod 0600 ~/.ssh/authorized_keys && \
    wget http://apache-mirror.rbc.ru/pub/apache/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz -P /opt && \
    tar -xf /opt/hadoop-${HADOOP_VERSION}.tar.gz -C /opt && \
    mv /opt/hadoop-${HADOOP_VERSION} ${HADOOP_HOME} && \
    mkdir -p ${HADOOP_LOG_DIR}

COPY etc ${HADOOP_HOME}/etc/
RUN echo "export JAVA_HOME=${JAVA_HOME}" >> ${HADOOP_HOME}/etc/hadoop/hadoop-env.sh
COPY start.sh /

RUN ${HADOOP_HOME}/bin/hdfs namenode -format

EXPOSE 9000 9870

ENTRYPOINT [ "/start.sh" ]
