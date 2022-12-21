# ==================================================================
# Base image
# ------------------------------------------------------------------
FROM nvidia/cuda:11.2.0-cudnn8-devel-ubuntu18.04

# ==================================================================
# git, text editors, cmake
# ------------------------------------------------------------------

RUN apt-get update -y && \
    apt-get upgrade -y && \
    APT_INSTALL="apt-get install -y" && \
    APT_INSTALL_NIR="apt-get install -y --no-install-recommends" && \
    PIP_INSTALL="python -m pip --no-cache-dir install" && \
    GIT_CLONE="git clone" && \
    DEBIAN_FRONTEND=noninteractive $APT_INSTALL_NIR \
    apt && \
    DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
    git-core \
    ca-certificates \
    cmake \
    wget \
    vim \
    nano \
    unzip \
    ffmpeg \
    libsm6 libxext6 libxrender-dev \
    libgstreamer1.0-0 gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-tools \
    build-essential && \
    # ==================================================================
    # python, pip
    # ------------------------------------------------------------------
    #    rm -rf /var/lib/apt/lists/* \
    #           /etc/apt/sources.list.d/cuda.list \
    #           /etc/apt/sources.list.d/nvidia-ml.list && \
    apt-get update -y && \
    apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
    software-properties-common && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
    python3.7 \
    python3.7-dev \
    python-tk \
    python3-tk \
    python3.7-tk \
    python3-pip && \
    ln -s /usr/bin/python3.7 /usr/local/bin/python3 && \
    ln -s /usr/bin/python3.7 /usr/local/bin/python && \
    python3.7 -m pip install pip --upgrade

# ==================================================================
# Tools and dependencies
# ------------------------------------------------------------------
RUN python -m pip install \
    setuptools==41.0.0 \
    transformers[sentencepiece] \
    numpy\
    h5py \
    scipy \
    pandas \
    matplotlib \
    datasets \
    pillow \
    jupyter \
    scikit-learn \
    tqdm \
    torch \
    torchvision \
    pytesseract \
    pdf2img \
    img2pdf \
    jupyterlab \
    timm 