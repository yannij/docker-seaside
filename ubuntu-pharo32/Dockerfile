FROM ubuntu
WORKDIR /home

RUN dpkg --add-architecture i386 && \
    apt-get update -y && \
    apt-get install -y curl unzip \
    libx11-6:i386 libgl1-mesa-glx:i386 \
    libfontconfig1:i386 libssl1.0.0:i386 
  
RUN curl https://get.pharo.org | bash
