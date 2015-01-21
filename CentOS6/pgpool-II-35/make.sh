#! /bin/bash
#
# Main driver to generate rpms
# $0: [-p proxy_address]
# if "-p" is specifed, proxy setting used.
#

# Directory to place result rpms/srpms. Default to
# your_home_directory/volum.
myvol=$HOME/volum

# Docker image file name.
image=pgpool2_35_rpm

if [ $# -gt 1 ];then
    if [ $1 = "-p" ];then
        proxy=$2
        proxy_set=y
        echo "inserting proxy address $2."
    else
        echo "wrong parameter $1".
        exit 1
    fi
else
    proxy_set=n
fi

echo "======= Start docker build ======="
cp ../lib/build.sh .
cp ../lib/rpmbuild.sh .
if [ $proxy_set = "y" ];then
    cp Dockerfile Dockerfile.orig
    cat Dockerfile|sed "/ENV/ aENV http_proxy $proxy" > Dockerfile.proxy
    cp Dockerfile.proxy Dockerfile
fi
sudo docker build --no-cache -t $image .

echo "======= End docker build ======="

if [ $proxy_set = "y" ];then
    cp Dockerfile.orig Dockerfile
fi

for i in 9.4 9.3
do
    echo "======= Start rpm build for PostgreSQL $i ======="
    sudo docker run --rm -e POSTGRESQL_VERSION=$i -v $myvol:/var/volum $image
    echo "======= End rpm build for PostgreSQL $i ======="
done

echo "Done. RPMS/SRPS are placed on $myvol."
