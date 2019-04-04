# ar-argos-buzz-simulations
[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/icra2018/ar-argos-buzz-simulations.svg)](https://hub.docker.com/r/icra2018/ar-argos-buzz-simulations)
<a href="#how-to-run-with-docker"><img src="https://img.shields.io/badge/Docker-instructions-brightgreen.svg"></a>

Buzz source code and ARGoS simulations

for any question, please contact jacopo.panerati@polymtl.ca

# How to Run with Docker
## Linux
#### Prerequisites
* NVIDIA GPU
* [nvidia-docker 2.0](https://github.com/nvidia/nvidia-docker/wiki/Installation-(version-2.0))

Tested on Ubuntu 16.04.6 with Docker 18.06.1-ce, NVIDIA Driver version 410.48.

1. Open a terminal and run the command:
```
nvidia-docker run --rm -p 8888:8888 -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix icra2018/ar-argos-buzz-simulations:latest
```
2. Run a web browser and open the link: [http://localhost:8888/lab/tree/README.ipynb](http://localhost:8888/lab/tree/README.ipynb)
