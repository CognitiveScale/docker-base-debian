# c12e/debian
# inlcudes: java7

FROM debian:jessie
MAINTAINER Indy Beck indy@c12e.com

ENV DEBIAN_FRONTEND noninteractive
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee /etc/apt/sources.list.d/webupd8team-java.list && \
   echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list && \
   apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 && \
   apt-get update && \
   echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
   apt-get install -y oracle-java7-installer oracle-java7-set-default ruby2.1 ruby2.1-dev build-essential supervisor && \
   apt-get clean

ENV JAVA_HOME /usr/lib/jvm/java-7-oracle

