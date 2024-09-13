# Start your image with a node base image
FROM ubuntu:noble

# The /app directory should act as the main application directory
WORKDIR /opt/posapi3

# Copy the app package and package-lock.json file
COPY PosAPI.deb .

RUN apt-get update
# Install node packages, install serve, build the app, and remove dependencies at the end
RUN chmod +x PosAPI.deb && \
    apt-get install PosAPI.deb

EXPOSE 3000

# Start the app using serve command
CMD [ "serve", "-s", "build" ]