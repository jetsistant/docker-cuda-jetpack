#!/usr/bin/env bash
set -e

mkdir -p var

if ! [ -x "$(command -v rsync)" ]; then
  echo 'rsync needs to be installed!'
  sudo apt-get install -y rsync
fi

echo 'Syncing files for local CUDA apt repo...'
rsync -aq /var/cuda-repo-10-0-local-10.0.326/ var/cuda-repo

echo 'Exporting repo keys...'
export APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn
apt-key exportall > apt-trusted-keys

echo 'Building cuda-jetpack:4.2.1-base container...'
sudo DOCKER_BUILDKIT=1 docker build \
    -t cuda-jetpack:4.2.1-base \
    -f Dockerfile.base .

echo 'Building cuda-jetpack:4.2.1-runtime container...'
sudo DOCKER_BUILDKIT=1 docker build \
    -t cuda-jetpack:4.2.1-runtime \
    --build-arg BASE_IMAGE=cuda-jetpack:4.2.1-base \
    -f Dockerfile.runtime .

echo 'Building cuda-jetpack:4.2.1-devel container...'
sudo DOCKER_BUILDKIT=1 docker build \
    -t cuda-jetpack:4.2.1-devel \
    --build-arg BASE_IMAGE=cuda-jetpack:4.2.1-runtime \
    -f Dockerfile.devel .

sudo docker tag cuda-jetpack:4.2.1-runtime cuda-jetpack:latest