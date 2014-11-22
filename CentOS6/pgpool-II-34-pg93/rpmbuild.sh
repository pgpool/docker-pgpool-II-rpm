#! /bin/sh
# Script to create pgpool-II and PostgreSQL RPMs
# Run this script as user "postgres".
PGPOOL_VERSION=${PGPOOL_VERSION:-"3.4.0"}
PGPOOL_BRANCH=${PGPOOL_BRANCH:-"V3_4_STABLE"}
POSTGRESQL_VERSION=9.3
POSTGRESQL_VERSION2=93
cd /var/lib/pgsql
mkdir rpmbuild
cd rpmbuild
mkdir BUILD BUILDROOT RPMS SOURCES SPECS SRPMS
cd ..
cp /tmp/pgpool-II-$PGPOOL_VERSION.tar.gz rpmbuild/SOURCES

cd pgpool2
git pull
git checkout $PGPOOL_BRANCH
git pull

cp src/pgpool.spec ../rpmbuild/SPECS
cp src/redhat/pgpool.conf.sample.patch ../rpmbuild/SOURCES
cp src/redhat/pgpool.init ../rpmbuild/SOURCES
cp src/redhat/pgpool.sysconfig ../rpmbuild/SOURCES
./configure --with-pgsql=/usr/pgsql-$POSTGRESQL_VERSION
make
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
rpmbuild -ba pgpool.spec --define="pgpool_version $PGPOOL_VERSION" --define="pg_version $POSTGRESQL_VERSION2" --define="pghome /usr/pgsql-$POSTGRESQL_VERSION" --define="dist .rhel6"
