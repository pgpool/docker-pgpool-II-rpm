# Docker file to create pgpool-II rpm

FROM centos:centos6

MAINTAINER Tatsuo Ishii <ishii@sraoss.co.jp>

ENV PGPOOL_ADMIN_VERSION 3.4.0
ENV POSTGRESQL_VERSION 9.3
ENV POSTGRESQL_VERSION2 93

RUN yum update -y

RUN rpm -Uvh http://yum.postgresql.org/$POSTGRESQL_VERSION/redhat/rhel-6-x86_64/pgdg-centos93-9.3-1.noarch.rpm
RUN yum install -y postgresql$POSTGRESQL_VERSION2 postgresql$POSTGRESQL_VERSION2-server tar rpm-build
RUN yum install -y php-pgsql wget
ADD rpmbuild.sh /tmp/rpmbuild.sh
ADD build.sh /tmp/build.sh
CMD /tmp/build.sh
