# Docker file to create pgpool-II rpm

FROM centos:centos6

MAINTAINER Bo Peng <pengbo@sraoss.co.jp>

ENV PGPOOL_ADMIN_VERSION 4.1.0

RUN yum update -y

RUN sudo yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-6-x86_64/pgdg-redhat-repo-latest.noarch.rpm
RUN yum install -y postgresql12-server
RUN yum install -y php-pgsql wget git tar rpm-build

RUN su -c 'cd /var/lib/pgsql && git clone http://git.postgresql.org/git/pgpooladmin.git' postgres
RUN wget http://www.pgpool.net/download.php?f=pgpoolAdmin-$PGPOOL_ADMIN_VERSION.tar.gz -O /tmp/pgpoolAdmin-$PGPOOL_ADMIN_VERSION.tar.gz

ADD rpmbuild.sh /tmp/rpmbuild.sh
ADD build.sh /tmp/build.sh
CMD /tmp/build.sh
