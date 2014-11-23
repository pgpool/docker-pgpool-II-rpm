# Docker file to create pgpool-II rpm

FROM centos:centos6

MAINTAINER Tatsuo Ishii <ishii@sraoss.co.jp>

ENV PGPOOL_VERSION 3.4.0
ENV POSTGRESQL_VERSION 9.2
ENV POSTGRESQL_VERSION2 92
ENV YUMPG pgdg-centos92-9.2-6.noarch.rpm

RUN yum update -y
RUN yum install -y wget
RUN wget http://yum.postgresql.org/$POSTGRESQL_VERSION/redhat/rhel-6-x86_64/$YUMPG
RUN rpm -ivh $YUMPG
RUN yum install -y postgresql$POSTGRESQL_VERSION2-devel postgresql$POSTGRESQL_VERSION2 \
    postgresql$POSTGRESQL_VERSION2-server tar rpm-build pam-devel gcc git openssl-devel \
    libmemcached-devel

RUN wget http://www.pgpool.net/download.php?f=pgpool-II-$PGPOOL_VERSION.tar.gz \
    -O /tmp/pgpool-II-$PGPOOL_VERSION.tar.gz

RUN su -c 'cd /var/lib/pgsql && git clone http://git.postgresql.org/git/pgpool2.git' postgres
RUN su -c 'cd /tmp;tar xfz pgpool-II-$PGPOOL_VERSION.tar.gz' postgres
ADD rpmbuild.sh /tmp/rpmbuild.sh
ADD build.sh /tmp/build.sh
CMD /tmp/build.sh
