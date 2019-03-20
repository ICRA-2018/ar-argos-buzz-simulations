# ar-argos-buzz-simulations
<a href="#roslab-run"><img src="https://img.shields.io/badge/ROSLab-run-brightgreen.svg"></a>

Buzz source code and ARGoS simulations

for any question, please contact jacopo.panerati@polymtl.ca

# ROSLab Run

## Prerequisites:
* [Docker](https://www.docker.com/)
* [nvidia-docker](https://github.com/nvidia/nvidia-docker/wiki/Installation-(version-2.0))
* Tested on Ubuntu Linux 16.04, Docker version 18.06.1-ce, NVIDIA Driver version 410.48.

## 1. Clone the repository and build ROSLab image:
```
git clone https://github.com/ICRA-2018/ar-argos-buzz-simulations.git
cd ar-argos-buzz-simulations
./roslab_build
```
## 2. Launch ROSLab image:
```
./roslab_run
```
## 3. Open JupyterLab in your browser:
[http://localhost:8888/lab/tree/README.ipynb](http://localhost:8888/lab/tree/README.ipynb)

## 4. Run in JupyterLab:
```
bzzc rendez-vous.bzz
argos3 -c rendez-vous.argos
```
```
bzzc rotating-prominence.bzz
argos3 -c rotating-prominence.argos
```
```
bzzc thick-prominence.bzz
argos3 -c thick-prominence.argos
```
```
bzzc thin-prominence.bzz
argos3 -c thin-prominence.argos
```
```
bzzc tri-star.bzz
argos3 -c tri-star.argos
```
