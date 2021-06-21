# Docker file to create pgpool-II rpm

FROM centos:centos8

MAINTAINER Bo Peng <pengbo@sraoss.co.jp>

ENV PGPOOL_ADMIN_VERSION 4.2.0

RUN dnf update -y; exit 0

RUN dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm
RUN dnf -qy module disable postgresql
RUN dnf install -y postgresql13-server

RUN dnf install -y tar rpm-build tar rpm-build php-pgsql wget git

RUN su -c 'cd /var/lib/pgsql && git clone http://git.postgresql.org/git/pgpooladmin.git' postgres
RUN wget http://www.pgpool.net/download.php?f=pgpoolAdmin-$PGPOOL_ADMIN_VERSION.tar.gz -O /tmp/pgpoolAdmin-$PGPOOL_ADMIN_VERSION.tar.gz

ADD rpmbuild.sh /tmp/rpmbuild.sh
ADD build.sh /tmp/build.sh
RUN chmod +x /tmp/*.sh
CMD /tmp/build.sh
