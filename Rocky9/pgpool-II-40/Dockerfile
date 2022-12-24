# Docker file to create pgpool-II rpm

FROM rockylinux:9

MAINTAINER Bo Peng <pengbo@sraoss.co.jp>

ENV PGPOOL_VERSION 4.0.7

RUN dnf update -y; exit 0
RUN dnf install -y --enablerepo=crb tar rpm-build pam-devel gcc git openssl-devel bc \
    libmemcached-devel wget make docbook-xsl openjade \
    jade libxslt docbook-dtds docbook-style-xsl docbook-style-dsssl

RUN sed -i -e 's/^SGMLDECL "docbook.dcl"/  -- SGMLDECL "docbook.dcl" --/' /usr/share/sgml/docbook/sgml-dtd-*/catalog

# this is neccessary for "su postgres"
RUN dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-9-x86_64/pgdg-redhat-repo-latest.noarch.rpm
RUN dnf install -y postgresql15-server

RUN dnf install -y epel-release llvm-devel clang-devel
RUN dnf install -y ccache

RUN git config --global http.version HTTP/1.1
RUN su -c 'cd /var/lib/pgsql && git clone http://git.postgresql.org/git/pgpool2.git' postgres

# download pgpool-II tar ball
RUN wget http://www.pgpool.net/download.php?f=pgpool-II-$PGPOOL_VERSION.tar.gz -O /tmp/pgpool-II-$PGPOOL_VERSION.tar.gz

COPY rpmbuild.sh /tmp/
COPY build.sh /tmp/
RUN chmod +x /tmp/*.sh
CMD /tmp/build.sh
