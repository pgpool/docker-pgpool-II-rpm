# Docker file to create pgpool-II rpm

FROM centos:centos7

MAINTAINER Tatsuo Ishii <ishii@sraoss.co.jp>

ENV PGPOOL_VERSION 3.4.0

RUN yum update -y
RUN yum install -y tar rpm-build pam-devel gcc git openssl-devel \
    libmemcached-devel wget

# this is neccessary for "su postgres"
RUN rpm -Uvh http://yum.postgresql.org/9.4/redhat/rhel-7-x86_64/pgdg-redhat94-9.4-1.noarch.rpm
RUN yum install -y postgresql-server

RUN su -c 'cd /var/lib/pgsql && git clone http://git.postgresql.org/git/pgpool2.git' postgres

# download pgpool-II tar ball
RUN wget http://www.pgpool.net/download.php?f=pgpool-II-$PGPOOL_VERSION.tar.gz -O /tmp/pgpool-II-$PGPOOL_VERSION.tar.gz

# centos7 base image does not include make.
RUN yum install -y make

ADD rpmbuild.sh /tmp/
ADD build.sh /tmp/
CMD /tmp/build.sh
