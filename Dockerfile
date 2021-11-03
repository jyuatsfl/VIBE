FROM ubuntu:18.04
RUN apt-get update && apt-get install -y \
    wget vim python3.7 python3-pip \
    git \
    apt-utils \
    locales \
    libgtk2.0-dev \
    imagemagick \
    libgl1 \
    libosmesa6-dev \
    freeglut3-dev \
    ffmpeg \
    unzip

ENV WORK_ROOT /work
RUN mkdir $WORK_ROOT
# RUN cd $WORK_ROOT && git clone https://github.com/mkocabas/VIBE.git 
RUN cd $WORK_ROOT && git clone https://github.com/jyuatsfl/VIBE.git
WORKDIR $WORK_ROOT/VIBE

RUN pip3 install --upgrade pip
RUN pip3 install numpy==1.17.5 torch==1.4.0 torchvision==0.5.0
RUN pip3 install git+https://github.com/giacaglia/pytube.git --upgrade
RUN pip3 install -r requirements.txt
RUN chmod +x scripts/prepare_data.sh && ./scripts/prepare_data.sh
RUN git clone https://github.com/mmatl/pyopengl.git && \
    cd pyopengl && git checkout 76d1261adee2d3fd99b418e75b0416bb7d2865e6 && \
    cd .. && pip3 install ./pyopengl

