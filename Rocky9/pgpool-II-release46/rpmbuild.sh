#! /bin/sh
# Script to create pgpool-II release RPMs
TOPDIR=/tmp/rpmbuild
mkdir -p $TOPDIR/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}

cp /tmp/pgpool-II-release-46.spec $TOPDIR/SPECS
cp /tmp/pgpool-II-release-46.repo $TOPDIR/SOURCES
cp /tmp/RPM-GPG-KEY-PGPOOL2 $TOPDIR/SOURCES

cd $TOPDIR/SPECS
rpmbuild -ba pgpool-II-release-46.spec --define="dist rhel9" --define="_topdir $TOPDIR"
