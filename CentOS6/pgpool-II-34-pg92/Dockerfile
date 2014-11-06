# Docker file to create pgpool-II rpm

FROM centos:centos6

MAINTAINER Tatsuo Ishii <ishii@sraoss.co.jp>

ENV PGPOOL_VERSION 3.4.0
ENV POSTGRESQL_VERSION 9.2
ENV POSTGRESQL_VERSION2 92

RUN yum update -y
RUN yum install -y wget
RUN wget http://yum.postgresql.org/9.2/redhat/rhel-6-x86_64/pgdg-centos92-9.2-6.noarch.rpm
RUN rpm -ivh pgdg-centos92-9.2-6.noarch.rpm
RUN yum install -y postgresql${POSTGRESQL_VERSION2}-devel postgresql${POSTGRESQL_VERSION2} postgresql${POSTGRESQL_VERSION2}-server
RUN yum install -y bison flex make autoconf automake
RUN yum install -y tar rpm-build pam-devel gcc git openssl-devel
ADD rpmbuild.sh /tmp/rpmbuild.sh
ADD build.sh /tmp/build.sh
CMD /tmp/build.sh

