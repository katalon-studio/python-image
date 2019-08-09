FROM ubuntu:18.04

RUN apt-get update && apt-get install -y --no-install-recommends \
  build-essential \
  curl \
  ca-certificates \
  ssh \
  nano \
  htop \
  libpq-dev

ENV PYTHON_VERSION=3.6
RUN curl -o ~/miniconda.sh -O  https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh  && \
  chmod +x ~/miniconda.sh && \
  ~/miniconda.sh -b -p /opt/conda && \
  rm ~/miniconda.sh && \
  /opt/conda/bin/conda install conda-build && \
  /opt/conda/bin/conda install python=$PYTHON_VERSION && \
  /opt/conda/bin/conda clean -ya

RUN /opt/conda/bin/conda init bash && exec bash

ENV PATH /opt/conda/bin:/opt/conda/envs/py$PYTHON_VERSION/bin:$PATH
