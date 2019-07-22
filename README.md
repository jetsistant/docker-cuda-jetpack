# docker-cuda-jetpack
Docker containers for CUDA with GPU acceleration, running on Nvidia Jetson.

Tested on Jetson Nano. You need JetPack 4.2.1 for this!

Use build.sh and run-*.sh scripts. You'll have to enter your root password.

./run-devel.sh
cp -r /usr/local/cuda/samples /tmp
cd /tmp/samples/5_Simulations/nbody
make
./nbody

For more details, see https://github.com/NVIDIA/nvidia-docker/wiki/NVIDIA-Container-Runtime-on-Jetson,
instead of 'nvcr.io/nvidia/l4t-base:r32.2' use cuda-jetpack:4.2.1-devel.
