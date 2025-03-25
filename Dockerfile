# Start your image with a node base image
FROM ubuntu:noble

RUN mkdir /opt/posapi
# The /opt/posapi3 directory should act as the main application directory
WORKDIR /opt/posapi
VOLUME /opt/posapi

# Copy the app package and package-lock.json file
COPY PosAPI.deb .

RUN apt-get update
RUN apt-get install -y ca-certificates
RUN apt-get install -y systemd
# Install node packages, install serve, build the app, and remove dependencies at the end
RUN chmod +x PosAPI.deb
RUN dpkg -i  PosAPI.deb

CMD /opt/posapi/PosService

