#!/bin/bash

# set environment
export DIR=$(cd $(dirname $0);pwd)
export NAME=openfoam.cfd
export IMG=user/${NAME}


# build image
docker build -t ${IMG} .

mkdir -p ${DIR}/volume
# docker run -it --rm -v ${DIR}/volume:/home ${IMG}
# echo "source /usr/lib/openfoam/openfoam2306/etc/bashrc" >> ./volume/.bashrc
docker run \
    -it --rm \
    -u $(id -u):$(id -g) \
    -v /etc/group:/etc/group:ro -v /etc/passwd:/etc/passwd:ro \
    -v ${DIR}/volume:/home/${USER} \
    --name ${NAME} \
    ${IMG}
