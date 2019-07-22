#!/usr/bin/env bash
set -e

rm -rf var apt-trusted-keys

# BEWARE, this removes all containers
docker system prune -a
