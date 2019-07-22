# docker-cuda-jetpack
Docker containers for CUDA with GPU acceleration, running on Nvidia Jetson.

Tested on a Jetson Nano, using Docker 18.09.2. **Make sure you're on JetPack 4.2.1.**

Use the build.sh script to build the containers. Then use one of the run-....sh scripts. You'll have to enter your root password.

There are three containers:

* `base`: bare minimum to deploy pre-built CUDA app
* `runtime`: extends *base* adding all shared libs from the CUDA toolkit. Use if you have pre-built apps using multiple CUDA libs
* `devel`: the 'real thing' for development; extends *runtime* by adding the compiler, debugging tools, headers, static libs and the CUDA samples

Here's how you can use the `devel` container to run one of the CUDA samples:

```bash
./run-devel.sh
cp -r /usr/local/cuda/samples /tmp
cd /tmp/samples/5_Simulations/nbody
make
./nbody
```

For more details, see the [nvidia-docker wiki](https://github.com/NVIDIA/nvidia-docker/wiki/NVIDIA-Container-Runtime-on-Jetson) (instead of `nvcr.io/nvidia/l4t-base:r32.2`, use `cuda-jetpack:4.2.1-devel`).

Also available on Docker Hub: https://hub.docker.com/r/jetsistant/cuda-jetpack
