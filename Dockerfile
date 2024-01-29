FROM ubuntu

RUN apt-get update
RUN apt-get install -y curl

# -y means yes to all prompts (no prompts) during installation process
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - 
RUN apt-get install -y nodejs

# Copying the package.json file to the container
# COPY <source> <destination>
COPY package.json package.json
COPY package-lock.json package-lock.json
RUN npm install
COPY main.js main.js


# ENTRYPOINT is the command that will be executed when the container starts
ENTRYPOINT [ "node","main.js" ]

# docker build -t <name>  is used to build the image -t is the tag name of the image