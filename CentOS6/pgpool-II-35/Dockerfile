# Docker file to create pgpool-II rpm

FROM centos:centos6

MAINTAINER Bo Peng <pengbo@sraoss.co.jp>

ENV PGPOOL_VERSION 3.5.23

RUN yum update -y
RUN yum install -y tar rpm-build pam-devel gcc git openssl-devel flex bc \
    libmemcached-devel wget make

# this is neccessary for "su postgres"
RUN yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-6-x86_64/pgdg-redhat-repo-latest.noarch.rpm
RUN yum install -y postgresql12-server

RUN su -c 'cd /var/lib/pgsql && git clone http://git.postgresql.org/git/pgpool2.git' postgres

# download pgpool-II tar ball
RUN wget http://www.pgpool.net/download.php?f=pgpool-II-$PGPOOL_VERSION.tar.gz -O /tmp/pgpool-II-$PGPOOL_VERSION.tar.gz

ADD rpmbuild.sh /tmp/
ADD build.sh /tmp/
CMD /tmp/build.sh
