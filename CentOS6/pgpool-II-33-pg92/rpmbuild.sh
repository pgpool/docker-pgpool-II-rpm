#! /bin/sh
# Script to create pgpool-II and PostgreSQL RPMs
# Run this script as user "postgres".
PGPOOL_VERSION=${PGPOOL_VERSION:-"3.3.4"}
PGPOOL_BRANCH=${PGPOOL_BRANCH:-"V3_3_STABLE"}
POSTGRESQL_VERSION=9.2
POSTGRESQL_VERSION2=92
cd /var/lib/pgsql
mkdir rpmbuild
cd rpmbuild
mkdir BUILD BUILDROOT RPMS SOURCES SPECS SRPMS
cd ..
cp /tmp/pgpool-II-$PGPOOL_VERSION.tar.gz rpmbuild/SOURCES

cd pgpool2
git checkout $PGPOOL_BRANCH
git pull

cp pgpool.spec ../rpmbuild/SPECS
cp redhat/pgpool.conf.sample.patch ../rpmbuild/SOURCES
cp redhat/pgpool.init ../rpmbuild/SOURCES
cp redhat/pgpool.sysconfig ../rpmbuild/SOURCES
./configure --with-pgsql=/usr/pgsql-$POSTGRESQL_VERSION
make dist
mkdir /tmp/head
cp pgpool-II-$PGPOOL_VERSION.tar.gz /tmp/head
cd /tmp/head
tar xfz pgpool-II-$PGPOOL_VERSION.tar.gz
cd ..
diff -crN pgpool-II-$PGPOOL_VERSION head/pgpool-II-$PGPOOL_VERSION > pgpool-II-head.patch
cd /var/lib/pgsql
cp /tmp/pgpool-II-head.patch rpmbuild/SOURCES
cd rpmbuild/SPECS
rpmbuild -ba pgpool.spec --define="pgpool_version $PGPOOL_VERSION" --define="pg_version $POSTGRESQL_VERSION2" --define="pghome /usr/pgsql-$POSTGRESQL_VERSION" --define="dist .pgdg"
