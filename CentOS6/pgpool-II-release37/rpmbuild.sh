#! /bin/sh
# Script to create pgpool-II release RPMs
TOPDIR=/tmp/rpmbuild
mkdir -p $TOPDIR/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}

cp /tmp/pgpool-II-release-37.spec $TOPDIR/SPECS
cp /tmp/pgpool-II-release-37.repo $TOPDIR/SOURCES
cp /tmp/RPM-GPG-KEY-PGPOOL2 $TOPDIR/SOURCES

cd $TOPDIR/SPECS
rpmbuild -ba pgpool-II-release-37.spec --define="dist rhel6" --define="_topdir $TOPDIR"
