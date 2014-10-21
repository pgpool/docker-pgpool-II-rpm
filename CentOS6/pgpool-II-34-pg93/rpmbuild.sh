#! /bin/sh
# Script to create pgpool-II and PostgreSQL RPMs
# Run this script as user "postgres".
POSTGRESQL_VERSION=9.3
POSTGRESQL_VERSION2=93

wget http://www.pgpool.net/download.php?f=pgpool-II-$PGPOOL_VERSION.tar.gz -O /tmp/pgpool-II-$PGPOOL_VERSION.tar.gz
cd /tmp
tar xfz pgpool-II-$PGPOOL_VERSION.tar.gz
cd /var/lib/pgsql
mkdir rpmbuild
cd rpmbuild
mkdir BUILD BUILDROOT RPMS SOURCES SPECS SRPMS
cp /tmp/pgpool-II-$PGPOOL_VERSION.tar.gz SOURCES
cd /tmp
cd pgpool-II-$PGPOOL_VERSION
cp src/pgpool.spec /var/lib/pgsql/rpmbuild/SPECS
cp src/redhat/pgpool.conf.sample.patch /var/lib/pgsql/rpmbuild/SOURCES
cp src/redhat/pgpool.init /var/lib/pgsql/rpmbuild/SOURCES
cp src/redhat/pgpool.sysconfig /var/lib/pgsql/rpmbuild/SOURCES
cd /var/lib/pgsql/rpmbuild/SPECS
rpmbuild -ba pgpool.spec --define="pgpool_version $PGPOOL_VERSION" --define="pg_version $POSTGRESQL_VERSION2" --define="pghome /usr/pgsql-$POSTGRESQL_VERSION" --define="dist .pgdg"
