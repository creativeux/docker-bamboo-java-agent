FROM centos:7.0.1406

MAINTAINER Aaron Stone <aaronastone@gmail.com>

RUN yum -y install java-1.8.0-openjdk-devel.x86_64
RUN yum -y install git
RUN yum -y install wget \
	tar \
	bzip2

RUN mkdir /usr/share/apache-maven

WORKDIR /usr/share/apache-maven

RUN wget http://www.carfab.com/apachesoftware/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz

RUN	tar -xvf apache-maven-3.3.3-bin.tar.gz
RUN rm apache-maven-3.3.3-bin.tar.gz

ENV PATH $PATH:/usr/share/apache-maven/apache-maven-3.3.3/bin

COPY ./config/atlassian-bamboo-agent-installer-5.8.1.jar /
COPY ./config/start-agent.sh /

ENTRYPOINT ["/start-agent.sh"]