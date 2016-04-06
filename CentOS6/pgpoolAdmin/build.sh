#!/bin/bash

su postgres < /tmp/rpmbuild.sh
cp -rp /var/lib/pgsql/rpmbuild/RPMS /var/volum
cp -rp /var/lib/pgsql/rpmbuild/SRPMS /var/volum
