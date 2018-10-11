FROM ubuntu
WORKDIR /home

RUN apt-get update -y && \
    apt-get install -y curl unzip libx11-6 libgl1-mesa-glx libfontconfig1 libssl1.0.0 

RUN curl https://get.pharo.org/64/ | bash

RUN \
	echo "*      hard    rtprio  2" > /etc/security/limits.d/pharo.conf && \
	echo "*      soft    rtprio  2" >> /etc/security/limits.d/pharo.conf
