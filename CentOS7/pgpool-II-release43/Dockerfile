# Docker file to create pgpool-II rpm

FROM centos:centos7

MAINTAINER Bo Peng <pengbo@sraoss.co.jp>

ENV RPM_USER rpmuser

RUN yum -y install yum-plugin-fastestmirror
RUN echo "include_only=.jp" >>  /etc/yum/pluginconf.d/fastestmirror.conf
RUN yum update -y; exit 0

RUN yum install -y rpm-build

RUN useradd rpmuser

ADD rpmbuild.sh /tmp/rpmbuild.sh
ADD build.sh /tmp/build.sh
ADD pgpool-II-release-43.spec /tmp/pgpool-II-release-43.spec
ADD pgpool-II-release-43.repo /tmp/pgpool-II-release-43.repo
ADD http://www.pgpool.net/yum/RPM-GPG-KEY-PGPOOL2 /tmp/RPM-GPG-KEY-PGPOOL2
RUN chown rpmuser /tmp/RPM-GPG-KEY-PGPOOL2
CMD /tmp/build.sh
