Name:		pgpool-II-release
Version:	4.0
Release:	2
Summary:	pgpool-II 4.0.x official RPMs for RHEL - Yum Repository Configuration
Vendor:		PgPool Global Development Group
Group:		System Environment/Base
License:	BSD
URL:		http://www.pgpool.net/
Source0:	http://www.pgpool.net/yum/RPM-GPG-KEY-PGPOOL2
Source1:	pgpool-II-release-40.repo
BuildRoot:	%{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)
BuildArch:	noarch

%description
This package contains yum configuration, and also the GPG
key for pgpool-II official RPMs.

%prep
%setup -q -c -T

%build

%install
rm -rf %{buildroot}

install -Dpm 644 %{SOURCE0} \
    %{buildroot}%{_sysconfdir}/pki/rpm-gpg/RPM-GPG-KEY-PGPOOL2

install -dm 755 %{buildroot}%{_sysconfdir}/yum.repos.d
install -pm 644 %{SOURCE1}  \
    %{buildroot}%{_sysconfdir}/yum.repos.d/

%clean
rm -rf %{buildroot}

#%post
#/bin/rpm --import %{_sysconfdir}/pki/rpm-gpg/RPM-GPG-KEY-PGPOOL2

%files
%defattr(-,root,root,-)
%config %{_sysconfdir}/yum.repos.d/*
%dir %{_sysconfdir}/pki/rpm-gpg
%{_sysconfdir}/pki/rpm-gpg/*

%changelog
* Tue Nov 22 2022 Bo Peng <pengbo@sraoss.co.jp> - 4.0-2
- Update GPG key
* Wed Sep 19 2018 Bo Peng <pengbo@sraoss.co.jp> - 4.0-1
- Initial Package
* Tue Oct 17 2017 Bo Peng <pengbo@sraoss.co.jp> - 3.7-1
- Initial Package
* Mon Nov 21 2016 Bo Peng <pengbo@sraoss.co.jp> - 3.6-1
- Initial Package
* Wed Dec 16 2015 Yugo Nagata <nagata@sraoss.co.jp> - 3.5-1
- Initial Package
* Thu Dec 4 2014 Yugo Nagata <nagata@sraoss.co.jp> - 3.4-1
- Initial Package
