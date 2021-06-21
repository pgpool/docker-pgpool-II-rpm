# Docker file to create pgpool-II rpm

FROM centos:centos7

MAINTAINER Bo Peng <pengbo@sraoss.co.jp>

ENV PGPOOL_VERSION 3.5.23

RUN dnf update -y; exit 0
RUN dnf install -y tar rpm-build pam-devel gcc git openssl-devel \
    libmemcached-devel wget make

# this is neccessary for "su postgres"
RUN dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm
RUN dnf -qy module disable postgresql
RUN dnf install -y postgresql13-server

RUN dnf install -y epel-release llvm-devel clang-devel
RUN dnf install -y ccache

RUN su -c 'cd /var/lib/pgsql && git clone http://git.postgresql.org/git/pgpool2.git' postgres

# download pgpool-II tar ball
RUN wget http://www.pgpool.net/download.php?f=pgpool-II-$PGPOOL_VERSION.tar.gz -O /tmp/pgpool-II-$PGPOOL_VERSION.tar.gz

COPY rpmbuild.sh /tmp/
COPY build.sh /tmp/
RUN chmod +x /tmp/*.sh
CMD /tmp/build.sh
