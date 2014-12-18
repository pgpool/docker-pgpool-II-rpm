#! /bin/sh
# Script to create pgpoolAdmin RPMs
# Run this script as user "postgres".

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
rpmbuild -ba pgpoolAdmin.spec --define="dist .rhel6" --define="pgpooladmin_version $PGPOOL_ADMIN_VERSION"
