How to build pgpool-II 4.7.x rpms with PostgreSQL
==================

Create $HOME/volum directory and place tar ball under $HOME/volum/.
```
mkdir $HOME/volum
cp pgpool-II-4.7.X.tar.gz $HOME/volum/
```

Run the following command.
```
sh make.sh
```

The command above will create pgpool-II 4.7 rpms/srpms under $HOME/volum.
If you want to change this, edit "myvol=..." line in make.sh.

If you need to use proxy, type:

```
sh make.sh -p proxy_address
```
