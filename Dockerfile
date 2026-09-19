FROM ubuntu:jammy
run apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    wget \
    curl \
    libssl-dev \
    libffi-dev \
    python3-dev \
    python3-pip

    run pip3 install --upgrade pip
    run useradd -m salama
    run mkdir /Data
    workdir /Data
    run apt install nginx -y
    cmd ["nginx", "-g"]

