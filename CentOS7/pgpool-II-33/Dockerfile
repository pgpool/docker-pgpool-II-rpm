# Docker file to create pgpool-II rpm

FROM centos:centos7

MAINTAINER Tatsuo Ishii <ishii@sraoss.co.jp>

ENV PGPOOL_VERSION 3.3.9

RUN yum install -y deltarpm
RUN yum update -y; exit 0
RUN yum install -y tar rpm-build pam-devel gcc git openssl-devel \
    libmemcached-devel wget make

# this is neccessary for "su postgres"
RUN rpm -Uvh http://yum.postgresql.org/9.4/redhat/rhel-7-x86_64/pgdg-redhat94-9.4-1.noarch.rpm
RUN yum install -y postgresql94-server

RUN su -c 'cd /var/lib/pgsql && git clone http://git.postgresql.org/git/pgpool2.git' postgres

# download pgpool-II tar ball
RUN wget http://www.pgpool.net/download.php?f=pgpool-II-$PGPOOL_VERSION.tar.gz -O /tmp/pgpool-II-$PGPOOL_VERSION.tar.gz

ADD rpmbuild.sh /tmp/
ADD build.sh /tmp/
CMD /tmp/build.sh
