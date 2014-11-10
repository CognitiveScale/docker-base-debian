# c12e/debian
# inlcudes: java7

FROM debian:jessie
MAINTAINER Indy Beck indy@c12e.com

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python-software-properties software-properties-common && \
  add-apt-repository ppa:webupd8team/java && \
  apt-get update && \
  echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
  apt-get install -y oracle-java7-installer oracle-java7-set-default && \
  apt-get clean

ENV JAVA_HOME /usr/lib/jvm/java-7-oracle

