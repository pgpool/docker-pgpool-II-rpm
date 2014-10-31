#! /bin/sh
# Script to create pgpoolAdmin RPMs
# Run this script as user "postgres".
POSTGRESQL_VERSION=9.3
POSTGRESQL_VERSION2=93

wget http://www.pgpool.net/download.php?f=pgpoolAdmin-$PGPOOL_ADMIN_VERSION.tar.gz -O /tmp/pgpoolAdmin-$PGPOOL_ADMIN_VERSION.tar.gz
cd /tmp
tar xfz pgpoolAdmin-$PGPOOL_ADMIN_VERSION.tar.gz
cd /var/lib/pgsql
mkdir rpmbuild
cd rpmbuild
mkdir BUILD BUILDROOT RPMS SOURCES SPECS SRPMS
cp /tmp/pgpoolAdmin-$PGPOOL_ADMIN_VERSION.tar.gz SOURCES
cp /tmp/pgpoolAdmin-$PGPOOL_ADMIN_VERSION/pgpoolAdmin.spec /var/lib/pgsql/rpmbuild/SPECS
cd /var/lib/pgsql/rpmbuild/SPECS
rpmbuild -ba pgpoolAdmin.spec --define="dist .pgdg" --define="pgpooladmin_version $PGPOOL_ADMIN_VERSION"
