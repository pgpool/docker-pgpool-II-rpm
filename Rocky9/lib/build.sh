#!/bin/bash

export PGPOOL_VERSION=${PGPOOL_VERSION:-"3.4.0"}
export PGPOOL_BRANCH=${PGPOOL_BRANCH:-"V3_4_STABLE"}
export POSTGRESQL_VERSION=${POSTGRESQL_VERSION:-"9.4"}
export POSTGRESQL_VERSION2=`echo $POSTGRESQL_VERSION|sed s/\\\\.//`
export POSTGRESQL_VERSION3=`echo "scale=0;$POSTGRESQL_VERSION*10" | bc | cut -d '.' -f 1`

dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-9-x86_64/pgdg-redhat-repo-latest.noarch.rpm
dnf install -y postgresql$POSTGRESQL_VERSION2-server postgresql$POSTGRESQL_VERSION2-devel

su postgres < /tmp/rpmbuild.sh
cp -rp /var/lib/pgsql/rpmbuild/RPMS /var/volum
cp -rp /var/lib/pgsql/rpmbuild/SRPMS /var/volum
