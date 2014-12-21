#! /bin/sh
# Script to create pgpool-II and PostgreSQL RPMs
# Run this script as user "postgres".

cd /var/lib/pgsql
mkdir rpmbuild
cd rpmbuild
mkdir BUILD BUILDROOT RPMS SOURCES SPECS SRPMS
cd ..
cp /tmp/pgpool-II-$PGPOOL_VERSION.tar.gz rpmbuild/SOURCES

# checkout branch
case $PGPOOL_VERSION in
    3.4.*) PGPOOL_BRANCH="V3_4_STABLE"
	use_src=true;;
    3.3.*) PGPOOL_BRANCH="V3_3_STABLE"
	use_src=false;;
    *) echo "wrong pgpool-II version $PGPOOL_VERSION";exit 1;;
esac

cd /var/lib/pgsql/pgpool2
git pull
git checkout $PGPOOL_BRANCH
git pull

if [ $use_src = "true" ];then
    cp src/pgpool.spec ../rpmbuild/SPECS
    cp src/redhat/pgpool.conf.sample.patch ../rpmbuild/SOURCES
    cp src/redhat/pgpool.init ../rpmbuild/SOURCES
    cp src/redhat/pgpool.sysconfig ../rpmbuild/SOURCES
else
    cp pgpool.spec ../rpmbuild/SPECS
    cp redhat/pgpool.conf.sample.patch ../rpmbuild/SOURCES
    cp redhat/pgpool.init ../rpmbuild/SOURCES
    cp redhat/pgpool.sysconfig ../rpmbuild/SOURCES
fi

./configure --with-pgsql=/usr/pgsql-$POSTGRESQL_VERSION
make
make dist
mkdir /tmp/head
cp pgpool-II-$PGPOOL_VERSION.tar.gz /tmp/head
cd /tmp/head
tar xfz pgpool-II-$PGPOOL_VERSION.tar.gz
cd ..
tar xfz pgpool-II-$PGPOOL_VERSION.tar.gz
diff -crN pgpool-II-$PGPOOL_VERSION head/pgpool-II-$PGPOOL_VERSION > pgpool-II-head.patch
cd /var/lib/pgsql
cp /tmp/pgpool-II-head.patch rpmbuild/SOURCES
cd rpmbuild/SPECS
rpmbuild -ba pgpool.spec --define="pgpool_version $PGPOOL_VERSION" --define="pg_version $POSTGRESQL_VERSION2" --define="pghome /usr/pgsql-$POSTGRESQL_VERSION" --define="dist .rhel7"
