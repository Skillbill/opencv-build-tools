FROM ubuntu:15.10

RUN apt-get update
RUN apt-get install -y build-essential gcc g++ cmake libboost-all-dev libv8-dev libgstreamer1.0-dev libopencv-dev\
    tesseract-ocr tesseract-ocr-eng libtesseract-dev libleptonica-dev

RUN adduser --disabled-password --gecos "" developer;
RUN echo "developer ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN echo "alias ll='ls -la'" >> /home/developer/.bashrc

RUN mkdir -p /workspace
RUN chown developer.developer /workspace

ENV HOME /home/developer
USER developer

WORKDIR /workspace
