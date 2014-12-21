#!/bin/bash

export PGPOOL_VERSION=${PGPOOL_VERSION:-"3.4.0"}
export PGPOOL_BRANCH=${PGPOOL_BRANCH:-"V3_4_STABLE"}
export POSTGRESQL_VERSION=${POSTGRESQL_VERSION:-"9.4"}
export POSTGRESQL_VERSION2=`echo $POSTGRESQL_VERSION|sed s/\\\\.//`

# install PostgreSQL rpms
case $POSTGRESQL_VERSION in
    "9.4") YUMPG=pgdg-centos94-9.4-1.noarch.rpm;;
    "9.3") YUMPG=pgdg-centos93-9.3-1.noarch.rpm;;
    "9.2") YUMPG=pgdg-centos92-9.2-6.noarch.rpm;;
    "*") echo wrong postgresql version \"$POSTGRESQL_VERSION\";exit 1;;
esac

rpm -Uvh http://yum.postgresql.org/$POSTGRESQL_VERSION/redhat/rhel-7-x86_64/$YUMPG
yum install -y postgresql$POSTGRESQL_VERSION2-devel postgresql$POSTGRESQL_VERSION2 \
    postgresql$POSTGRESQL_VERSION2-server

su postgres < /tmp/rpmbuild.sh
cp -rp /var/lib/pgsql/rpmbuild/RPMS /var/volum
cp -rp /var/lib/pgsql/rpmbuild/SRPMS /var/volum
