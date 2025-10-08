# Docker file to create pgpool-II rpm

FROM rockylinux:9

MAINTAINER Bo Peng <pengbo@sraoss.co.jp>

ENV RPM_USER rpmuser

RUN dnf update -y; exit 0

RUN dnf install -y rpm-build

RUN useradd rpmuser

ADD rpmbuild.sh /tmp/rpmbuild.sh
ADD build.sh /tmp/build.sh
ADD pgpool-II-release-44.spec /tmp/pgpool-II-release-44.spec
ADD pgpool-II-release-44.repo /tmp/pgpool-II-release-44.repo
ADD https://www.pgpool.net/yum/RPM-GPG-KEY-PGPOOL2 /tmp/RPM-GPG-KEY-PGPOOL2
RUN chown rpmuser /tmp/RPM-GPG-KEY-PGPOOL2
CMD /tmp/build.sh
