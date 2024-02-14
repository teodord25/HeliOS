FROM ubuntu:latest

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Update and install QEMU and NASM
RUN apt-get update && \
    apt-get install -y qemu-system-x86 qemu-utils nasm && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set up the working directory
WORKDIR /usr/src/app

# Copy the bootloader source file into the Docker image
COPY ./src/bootloader.asm /usr/src/app/bootloader.asm

# Compile the bootloader.asm to bootloader.bin using NASM
RUN nasm -f bin bootloader.asm -o bootloader.bin

# Command to run QEMU on container start with VNC
CMD ["qemu-system-x86_64", "-drive", "file=bootloader.bin,format=raw,index=0,if=floppy", "-vnc", ":0"]

