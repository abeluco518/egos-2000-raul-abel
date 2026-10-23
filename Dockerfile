FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

# Build dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    make \
    gcc \
    git \
    wget \
    curl \
    ca-certificates \
    xz-utils \
    python3 \
    qemu-system-misc \
    bsdextrautils \
    vim \
    && rm -rf /var/lib/apt/lists/* 

# Install RISC-V GNU toolchain
WORKDIR /opt

RUN wget -O toolchain.tar.gz \
    https://github.com/xpack-dev-tools/riscv-none-elf-gcc-xpack/releases/download/v14.2.0-3/xpack-riscv-none-elf-gcc-14.2.0-3-linux-x64.tar.gz \
    && tar -xzf toolchain.tar.gz \
    && rm toolchain.tar.gz

ENV PATH="/opt/xpack-riscv-none-elf-gcc-14.2.0-3/bin:${PATH}"

WORKDIR /egos


# Create a command line
CMD ["bash"]
