FROM ubuntu:18.04 
RUN apt-get update && apt install -y openjdk-8-jdk openssh-server vim wget \
	&& ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa \
        && cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys \
        && chmod 0600 ~/.ssh/authorized_keys \
	&& echo "StrictHostKeyChecking no" > ~/.ssh/config \
	&& echo "UserKnownHostsFile /dev/null" >>  ~/.ssh/config
RUN wget http://apache.claz.org/hadoop/common/current2/hadoop-2.9.2.tar.gz
RUN echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" >> ~/.bashrc
RUN tar -xvf hadoop-2.9.2.tar.gz
RUN rm hadoop-2.9.2.tar.gz


