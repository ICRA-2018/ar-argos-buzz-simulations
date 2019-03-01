FROM nvidia/opengl:1.0-glvnd-devel-ubuntu16.04

################################## JUPYTERLAB ##################################

ENV DEBIAN_FRONTEND noninteractive
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN apt-get -o Acquire::ForceIPv4=true update && apt-get -yq dist-upgrade \
 && apt-get -o Acquire::ForceIPv4=true install -yq --no-install-recommends \
	locales python-pip cmake \
	python3-pip python3-setuptools git build-essential \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN pip3 install jupyterlab bash_kernel \
 && python3 -m bash_kernel.install

ENV SHELL=/bin/bash \
	NB_USER=jovyan \
	NB_UID=1000 \
	LANG=en_US.UTF-8 \
	LANGUAGE=en_US.UTF-8

ENV HOME=/home/${NB_USER}

RUN adduser --disabled-password \
	--gecos "Default user" \
	--uid ${NB_UID} \
	${NB_USER}

EXPOSE 8888

CMD ["jupyter", "lab", "--no-browser", "--ip=0.0.0.0", "--NotebookApp.token=''"]

################################### SOURCE #####################################

RUN apt-get -o Acquire::ForceIPv4=true update \
 && apt-get -o Acquire::ForceIPv4=true install -yq --no-install-recommends \
    cmake \
    libfreeimage-dev \
    libfreeimageplus-dev \
    qt5-default \
    freeglut3-dev \
    libxi-dev \
    libxmu-dev \
    liblua5.2-dev \
    lua5.2 \
    doxygen \
    graphviz \
    graphviz-dev \
    asciidoc \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/ilpincy/argos3.git /argos3 \
 && cd /argos3 \
 && mkdir build \
 && cd build \
 && cmake  ../src \
 && make -j2 && make doc -j2 && make install \
 && rm -fr /argos3

RUN git clone https://github.com/MISTLab/Buzz.git /buzz \
 && cd /buzz \
 && mkdir build \
 && cd build \
 && cmake  ../src \
 && make install \
 && rm -fr /buzz

RUN git clone https://github.com/ilpincy/argos3-examples.git /argos-examples \
 && cd /argos-examples \
 && mkdir build \
 && cd build \
 && cmake  ../ \
 && make \
 && cp -R /argos-examples ${HOME}/. \
 && rm -fr /argos-examples

##################################### COPY #####################################

RUN mkdir ${HOME}/ar-argos-buzz-simulations

COPY . ${HOME}/ar-argos-buzz-simulations

################################### CUSTOM #####################################

RUN ldconfig

##################################### TAIL #####################################

RUN chown -R ${NB_UID} ${HOME}

USER ${NB_USER}

WORKDIR ${HOME}/ar-argos-buzz-simulations
