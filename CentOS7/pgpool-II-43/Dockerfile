# Docker file to create pgpool-II rpm

FROM centos:centos7

MAINTAINER Bo Peng <pengbo@sraoss.co.jp>

ENV PGPOOL_VERSION 4.3beta1

RUN yum update -y; exit 0
RUN yum install -y tar rpm-build pam-devel gcc git openssl-devel bc flex \
    libmemcached-devel openldap-devel wget make docbook docbook-dsssl docbook-sgml docbook-xsl openjade \
    jade libxslt docbook-dtds docbook-style-xsl docbook-style-dsssl

RUN sed -i -e 's/^SGMLDECL "docbook.dcl"/  -- SGMLDECL "docbook.dcl" --/' /usr/share/sgml/docbook/sgml-dtd-*/catalog

# this is neccessary for "su postgres"
RUN yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
RUN yum install -y postgresql14-server
RUN yum install -y epel-release centos-release-scl
RUN yum install -y llvm5.0 llvm-toolset-7 llvm-toolset-7-llvm-devel

#RUN su -c 'cd /var/lib/pgsql && git clone http://git.postgresql.org/git/pgpool2.git' postgres

# download pgpool-II tar ball
#RUN wget http://www.pgpool.net/download.php?f=pgpool-II-$PGPOOL_VERSION.tar.gz -O /tmp/pgpool-II-$PGPOOL_VERSION.tar.gz

COPY rpmbuild.sh /tmp/
COPY build.sh /tmp/
RUN chmod +x /tmp/*.sh
CMD /tmp/build.sh
