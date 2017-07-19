#! /bin/sh
# Script to create pgpool-II release RPMs
TOPDIR=/tmp/rpmbuild
mkdir -p $TOPDIR/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}

cp /tmp/pgpool-II-release-36.spec $TOPDIR/SPECS
cp /tmp/pgpool-II-release-36.repo $TOPDIR/SOURCES
cp /tmp/RPM-GPG-KEY-PGPOOL2 $TOPDIR/SOURCES

cd $TOPDIR/SPECS
rpmbuild -ba pgpool-II-release-36.spec --define="dist rhel7" --define="_topdir $TOPDIR"
