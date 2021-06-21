How to build pgpoolAdmin
==================

```
	sh make.sh
```
will create pgpoolAdmin rpms/srpms under $HOME/volum.
If you want to change this, edit "myvol=..." line in make.sh.

If you need to use proxy, type:

```
	sh make.sh -p proxy_address
