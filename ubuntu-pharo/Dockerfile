FROM ubuntu
WORKDIR /home

RUN apt-get update -y && \
	apt-get install -y curl unzip \
	&& apt-get install -y libx11-6 libgl1-mesa-glx libfontconfig1 libssl1.0.0 \
	&& apt-get install -y libssh2-1-dev libcurl3-gnutls

RUN curl https://get.pharo.org/64/ | bash

RUN \
	echo "*      hard    rtprio  2" > /etc/security/limits.d/pharo.conf && \
	echo "*      soft    rtprio  2" >> /etc/security/limits.d/pharo.conf
