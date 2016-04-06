# Docker file to create pgpool-II rpm

FROM centos:centos6

MAINTAINER Tatsuo Ishii <ishii@sraoss.co.jp>

ENV PGPOOL_ADMIN_VERSION 3.5.1
ENV POSTGRESQL_VERSION 9.4
ENV POSTGRESQL_VERSION2 94

RUN yum update -y

RUN rpm -Uvh http://yum.postgresql.org/$POSTGRESQL_VERSION/redhat/rhel-6-x86_64/pgdg-centos94-9.4-1.noarch.rpm
RUN yum install -y postgresql$POSTGRESQL_VERSION2 postgresql$POSTGRESQL_VERSION2-server tar rpm-build
RUN yum install -y php-pgsql wget git

RUN su -c 'cd /var/lib/pgsql && git clone http://git.postgresql.org/git/pgpooladmin.git' postgres
RUN wget http://www.pgpool.net/download.php?f=pgpoolAdmin-$PGPOOL_ADMIN_VERSION.tar.gz -O /tmp/pgpoolAdmin-$PGPOOL_ADMIN_VERSION.tar.gz

ADD rpmbuild.sh /tmp/rpmbuild.sh
ADD build.sh /tmp/build.sh
CMD /tmp/build.sh
