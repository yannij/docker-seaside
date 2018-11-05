FROM my-ubuntu-pharo

RUN echo "Metacello new baseline:'Seaside3'; repository: 'github://SeasideSt/Seaside:v3.2.4/repository'; load" > load-seaside.st \\
	&& ./pharo -vm-display-null -vm-sound-null Pharo.image --save --quit load-seaside.st
