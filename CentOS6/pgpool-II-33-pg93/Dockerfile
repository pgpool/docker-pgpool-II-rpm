# Docker file to create pgpool-II rpm

FROM centos:centos6

MAINTAINER Tatsuo Ishii <ishii@sraoss.co.jp>

ENV PGPOOL_VERSION 3.3.4

RUN yum update -y
RUN yum install -y wget
RUN wget http://yum.postgresql.org/9.3/redhat/rhel-6-x86_64/pgdg-centos93-9.3-1.noarch.rpm
RUN rpm -ivh pgdg-centos93-9.3-1.noarch.rpm
RUN yum install -y postgresql93-devel postgresql93 postgresql93-server tar rpm-build pam-devel gcc git openssl-devel

# make dist requires these
RUN yum install -y bison flex make autoconf automake

RUN wget http://www.pgpool.net/download.php?f=pgpool-II-$PGPOOL_VERSION.tar.gz -O /tmp/pgpool-II-$PGPOOL_VERSION.tar.gz
RUN su -c 'cd /var/lib/pgsql && git clone http://git.postgresql.org/git/pgpool2.git' postgres
RUN su -c 'cd /tmp;tar xfz pgpool-II-$PGPOOL_VERSION.tar.gz' postgres
ADD rpmbuild.sh /tmp/rpmbuild.sh
ADD build.sh /tmp/build.sh
CMD /tmp/build.sh
