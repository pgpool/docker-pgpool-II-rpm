#! /bin/sh
# Script to create pgpool-II and PostgreSQL RPMs
# Run this script as user "postgres".

cd /var/lib/pgsql
mkdir -p rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}
cp /var/volum/pgpool-II-$PGPOOL_VERSION.tar.gz /var/lib/pgsql/rpmbuild/SOURCES
#cp /var/volum/pgpool-II-$PGPOOL_VERSION.tar.gz /tmp
tar zxf rpmbuild/SOURCES/pgpool-II-$PGPOOL_VERSION.tar.gz

cp /var/lib/pgsql/pgpool-II-$PGPOOL_VERSION/src/pgpool.spec /var/lib/pgsql/rpmbuild/SPECS
cp /var/lib/pgsql/pgpool-II-$PGPOOL_VERSION/src/redhat/pgpool.conf.sample.patch /var/lib/pgsql/rpmbuild/SOURCES
cp /var/lib/pgsql/pgpool-II-$PGPOOL_VERSION/src/redhat/pgpool.init /var/lib/pgsql/rpmbuild/SOURCES
cp /var/lib/pgsql/pgpool-II-$PGPOOL_VERSION/src/redhat/pgpool_rhel*.sysconfig /var/lib/pgsql/rpmbuild/SOURCES
cp /var/lib/pgsql/pgpool-II-$PGPOOL_VERSION/src/redhat/pgpool.service /var/lib/pgsql/rpmbuild/SOURCES
cp /var/lib/pgsql/pgpool-II-$PGPOOL_VERSION/src/redhat/pgpool_socket_dir.patch /var/lib/pgsql/rpmbuild/SOURCES
cp /var/lib/pgsql/pgpool-II-$PGPOOL_VERSION/src/redhat/pcp_unix_domain_path.patch /var/lib/pgsql/rpmbuild/SOURCES
cp /var/lib/pgsql/pgpool-II-$PGPOOL_VERSION/src/redhat/pgpool_log.patch /var/lib/pgsql/rpmbuild/SOURCES
cp /var/lib/pgsql/pgpool-II-$PGPOOL_VERSION/src/redhat/pgpool_sudoers.d /var/lib/pgsql/rpmbuild/SOURCES
cp /var/lib/pgsql/pgpool-II-$PGPOOL_VERSION/src/redhat/pgpool_tmpfiles.d /var/lib/pgsql/rpmbuild/SOURCES


# checkout branch
case $PGPOOL_VERSION in
    4.4*) PGPOOL_BRANCH="V4_4_STABLE"
          dir="src/";;
    4.3*) PGPOOL_BRANCH="V4_3_STABLE"
          dir="src/";;
    4.2*) PGPOOL_BRANCH="V4_2_STABLE"
          dir="src/";;
    4.1*) PGPOOL_BRANCH="V4_1_STABLE"
          dir="src/";;
    4.0*) PGPOOL_BRANCH="V4_0_STABLE"
          dir="src/";;
    3.7*) PGPOOL_BRANCH="V3_7_STABLE"
          dir="src/";;
    3.6*) PGPOOL_BRANCH="V3_6_STABLE"
          dir="src/";;
    3.5*) PGPOOL_BRANCH="V3_5_STABLE"
          dir="src/";;
    3.4.*) PGPOOL_BRANCH="V3_4_STABLE"
           dir="src/";;
    3.3.*) PGPOOL_BRANCH="V3_3_STABLE"
           dir="";;
    *) echo "wrong pgpool-II version $PGPOOL_VERSION";exit 1;;
esac

# If Release number is greater than 1, generate pgpool-II-head.patch and apply it.
#cp -r /var/volum/pgpool2 /var/lib/pgsql
#\cp  /var/volum/pgpool2/src/pgpool.spec /var/lib/pgsql/rpmbuild/SPECS
#cd /var/lib/pgsql/pgpool2
#git pull
#git checkout $PGPOOL_BRANCH
#git pull
#./configure --with-pgsql=/usr/pgsql-$POSTGRESQL_VERSION
#make
#make dist
#mkdir /tmp/head
#cp pgpool-II-$PGPOOL_VERSION.tar.gz /tmp/head
#cd /tmp/head
#tar xfz pgpool-II-$PGPOOL_VERSION.tar.gz
#cd ..
#tar xfz pgpool-II-$PGPOOL_VERSION.tar.gz
#diff -crN pgpool-II-$PGPOOL_VERSION head/pgpool-II-$PGPOOL_VERSION > pgpool-II-head.patch
#cp /tmp/pgpool-II-head.patch /var/lib/pgsql/rpmbuild/SOURCES


cd /var/lib/pgsql/rpmbuild/SPECS
rpmbuild -ba pgpool.spec --define="pgpool_version $PGPOOL_VERSION" \
    --define="pg_version $POSTGRESQL_VERSION2" --define="pghome /usr/pgsql-$POSTGRESQL_VERSION" \
    --define="dist .rhel8" \
    --define="pgsql_ver $POSTGRESQL_VERSION3"
