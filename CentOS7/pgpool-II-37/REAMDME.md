How to build pgpool-II 3.7.x rpms with PostgreSQL
==================

```
	sh make.sh
```
will create pgpool-II 3.7 rpms/srpms under $HOME/volum.
If you want to change this, edit "myvol=..." line in make.sh.

If you need to use proxy, type:

```
	sh make.sh -p proxy_address
```
