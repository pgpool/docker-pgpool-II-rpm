#! /bin/sh
# Script to create pgpoolAdmin RPMs
# Run this script as user "postgres".
cd /var/lib/pgsql
mkdir rpmbuild
cd rpmbuild
mkdir BUILD BUILDROOT RPMS SOURCES SPECS SRPMS
cd ..
cp /tmp/pgpoolAdmin-$PGPOOL_ADMIN_VERSION.tar.gz rpmbuild/SOURCES

cd /var/lib/pgsql/pgpooladmin
git pull
cp pgpoolAdmin.spec ../rpmbuild/SPECS
cd tools
sed -i -e 's|ssh://git@git.postgresql.org|http://git.postgresql.org/git|' make_tarball.sh
./make_tarball.sh $PGPOOL_ADMIN_VERSION master
mkdir /tmp/head
cp pgpoolAdmin-$PGPOOL_ADMIN_VERSION.tar.gz /tmp/head
cd /tmp/head
tar xfz pgpoolAdmin-$PGPOOL_ADMIN_VERSION.tar.gz
cd ..
tar xfz pgpoolAdmin-$PGPOOL_ADMIN_VERSION.tar.gz
diff -crN pgpoolAdmin-$PGPOOL_ADMIN_VERSION head/pgpoolAdmin-$PGPOOL_ADMIN_VERSION > pgpoolAdmin.patch
cd /var/lib/pgsql
cp /tmp/pgpoolAdmin.patch rpmbuild/SOURCES
cd rpmbuild/SPECS
rpmbuild -ba pgpoolAdmin.spec --define="dist .rhel6" --define="pgpooladmin_version $PGPOOL_ADMIN_VERSION"
