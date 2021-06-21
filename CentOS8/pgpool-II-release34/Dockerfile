# Docker file to create pgpool-II rpm

FROM centos:centos8

MAINTAINER Bo Peng <pengbo@sraoss.co.jp>

ENV RPM_USER rpmuser

RUN dnf update -y

RUN dnf install -y rpm-build

RUN useradd rpmuser

ADD rpmbuild.sh /tmp/rpmbuild.sh
ADD build.sh /tmp/build.sh
ADD pgpool-II-release-34.spec /tmp/pgpool-II-release-34.spec
ADD pgpool-II-release-34.repo /tmp/pgpool-II-release-34.repo
ADD http://www.pgpool.net/yum/RPM-GPG-KEY-PGPOOL2 /tmp/RPM-GPG-KEY-PGPOOL2
RUN chown rpmuser /tmp/RPM-GPG-KEY-PGPOOL2
CMD /tmp/build.sh
