FROM centos:7
MAINTAINER "Johannes Skov Frandsen" <localgod@heaven.dk>

RUN yum -y update \
    && yum -y install epel-release wget git nodejs \
    && wget --no-cookies --no-check-certificate \
    --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
    http://download.oracle.com/otn-pub/java/jdk/8u112-b15/jdk-8u112-linux-x64.rpm \
    && yum -y localinstall jdk-8u112-linux-x64.rpm \
    && rm -f ./jdk-8u112-linux-x64.rpm \
    && yum clean all

ENV JAVA_HOME=/usr/java/default
