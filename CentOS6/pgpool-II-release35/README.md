How to build pgpool-II 3.5.x repository rpm.
==================

### 1. Build docker image

```
	sudo docker build -t pgpool_release_35_rpm .
```

### 2. Run docker container

```
	sudo docker run -v /home/yourname/volum:/var/volum pgpool_release_35_rpm
```
### 3. You will find RPMs and SRPMs under /home/yourname/volum.
