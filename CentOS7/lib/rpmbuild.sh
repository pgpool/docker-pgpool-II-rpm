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

cd /var/lib/pgsql/pgpool2
git pull
git checkout $PGPOOL_BRANCH
git pull

cp ${dir}pgpool.spec ../rpmbuild/SPECS
cp ${dir}redhat/pgpool.conf.sample.patch ../rpmbuild/SOURCES
cp ${dir}redhat/pgpool.init ../rpmbuild/SOURCES
cp ${dir}redhat/pgpool_rhel*.sysconfig ../rpmbuild/SOURCES
cp ${dir}redhat/pgpool.service ../rpmbuild/SOURCES
cp ${dir}redhat/pgpool_socket_dir.patch ../rpmbuild/SOURCES
cp ${dir}redhat/pcp_unix_domain_path.patch ../rpmbuild/SOURCES
cp ${dir}redhat/pgpool_log.patch ../rpmbuild/SOURCES
cp ${dir}redhat/pgpool_sudoers.d ../rpmbuild/SOURCES
cp ${dir}redhat/pgpool_tmpfiles.d ../rpmbuild/SOURCES

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
rpmbuild -ba pgpool.spec --define="pgpool_version $PGPOOL_VERSION" \
    --define="pg_version $POSTGRESQL_VERSION2" --define="pghome /usr/pgsql-$POSTGRESQL_VERSION" \
    --define="dist .rhel7" \
    --define="pgsql_ver $POSTGRESQL_VERSION3"
