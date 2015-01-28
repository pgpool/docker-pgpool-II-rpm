#! /bin/sh
# Script to create pgpoolAdmin RPMs
# Run this script as user "postgres".

# sources from tar ball in donwload page
cd /tmp
tar xfz pgpoolAdmin-$PGPOOL_ADMIN_VERSION.tar.gz

# sources from git
# do nothing because they are in /var/lib/pgsql/pgpooladmin

# create a patch
diff -crN pgpoolAdmin-$PGPOOL_ADMIN_VERSION /var/lib/pgsql/pgpooladmin > pgpoolAdmin.patch

cd /var/lib/pgsql
mkdir rpmbuild
cd rpmbuild
mkdir BUILD BUILDROOT RPMS SOURCES SPECS SRPMS
cp /tmp/pgpoolAdmin-$PGPOOL_ADMIN_VERSION.tar.gz SOURCES
cp /tmp/pgpoolAdmin-$PGPOOL_ADMIN_VERSION/pgpoolAdmin.spec /var/lib/pgsql/rpmbuild/SPECS
cp /tmp/pgpoolAdmin.patch rpmbuild/SOURCES
cd /var/lib/pgsql/rpmbuild/SPECS
rpmbuild -ba pgpoolAdmin.spec --define="dist .rhel6" --define="pgpooladmin_version $PGPOOL_ADMIN_VERSION"
