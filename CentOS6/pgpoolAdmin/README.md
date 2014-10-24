How to build pgpool-II 3.4.x rpms with PostgreSQL 9.3.
==================

### 1. Build docker image

```
	sudo docker build -t pgpooladmin_34_pg93_rpm .
```

### 2. Run docker container

```
	sudo docker run -i -v /home/yourname/volum:/var/volum -t pgpooladmin_34_pg93_rpm
```
### 3. You will find RPMs and SRPMs under /home/yourname/volum.
