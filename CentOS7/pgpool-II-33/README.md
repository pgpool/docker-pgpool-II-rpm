How to build pgpool-II 3.3.x rpms with PostgreSQL 9.*
==================

```
	sh make.sh
```
will create pgpool-II 3.3 rpm + PostgreSQL 9.2, 9.3, 9.4 rpms/srpms under
$HOME/volum. If you want to change this, edit "myvol=..." line in make.sh.

If you need to use proxy, type:

```
	sh make.sh -p proxy_address
```
