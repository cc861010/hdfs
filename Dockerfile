FROM ubuntu:18.04 

#RUN echo " \ 
#deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse \
#deb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse \
#deb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse \
#deb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse \
#deb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse \
#deb-src http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse \
#deb-src http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse \
#deb-src http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse \
#deb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse \
#deb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse \
#" > /etc/apt/sources.list


RUN apt-get update && apt install -y openjdk-8-jdk openssh-server vim wget \
	&& ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa \
        && cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys \
        && chmod 0600 ~/.ssh/authorized_keys \
	&& echo "StrictHostKeyChecking no" > ~/.ssh/config \
	&& echo "UserKnownHostsFile /dev/null" >>  ~/.ssh/config


#RUN wget http://apache.claz.org/hadoop/common/current2/hadoop-2.9.2.tar.gz
RUN wget http://mirrors.ibiblio.org/apache/hadoop/common/current2/hadoop-2.9.2.tar.gz
RUN tar -xvf hadoop-2.9.2.tar.gz
RUN rm hadoop-2.9.2.tar.gz

WORKDIR /hadoop-2.9.2
COPY ./etc ./etc

#RUN bin/hdfs namenode -format

#RUN sbin/start-dfs.sh

entrypoint service ssh start && /bin/bash
