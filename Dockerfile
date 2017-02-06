FROM centos:7.3.1611
MAINTAINER "Johannes Skov Frandsen" <localgod@heaven.dk>

RUN yum-config-manager --add-repo https://rpm.nodesource.com/pub_7.x/el/7/x86_64/ \
    && sed -i 's|_pub_7.x_el_7_x86_64_||' /etc/yum.repos.d/rpm.nodesource.com_pub_7.x_el_7_x86_64_.repo \
    && echo gpgcheck=0 >> /etc/yum.repos.d/rpm.nodesource.com_pub_7.x_el_7_x86_64_.repo \
    && mv /etc/yum.repos.d/rpm.nodesource.com_pub_7.x_el_7_x86_64_.repo /etc/yum.repos.d/rpm.nodesource.com.repo \
    && yum -y update \
    && yum -y install epel-release wget git nodejs \
    && wget --no-cookies --no-check-certificate \
    --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
    http://download.oracle.com/otn-pub/java/jdk/8u112-b15/jdk-8u112-linux-x64.rpm \
    && yum -y localinstall jdk-8u112-linux-x64.rpm \
    && rm -f ./jdk-8u112-linux-x64.rpm \
    && yum clean all

ENV JAVA_HOME=/usr/java/default
