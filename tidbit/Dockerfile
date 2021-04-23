# Build in 2 stages to minimize the size of the final docker image
# See https://docs.docker.com/develop/develop-images/multistage-build/

# Stage 1: Load the project
FROM basmalltalk/pharo:8.0-image AS loader
COPY load-preload.st ./
RUN pharo Pharo.image load-preload.st --save --quit
COPY load-tidbit.st ./
RUN pharo Pharo.image load-tidbit.st --save --quit
#COPY tidbit7.image ./Pharo.image
#COPY tidbit7.changes ./Pharo.changes

# Stage 2: Copy the resulting Pharo.image with our project loaded
# into a new docker image with just the vm
FROM basmalltalk/pharo:8.0
WORKDIR /app
COPY --from=loader /opt/pharo/Pharo.image ./
COPY --from=loader /opt/pharo/Pharo.changes ./
COPY --from=loader /opt/pharo/Pharo*.sources ./
#COPY start.st ./

USER root
RUN chown pharo:users /app -R

USER pharo
#CMD [ "pharo", "Pharo.image", "start.st" ]
CMD pharo Pharo.image eval --no-quit ""
