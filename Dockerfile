FROM ubuntu

RUN apt-get update
RUN apt-get install -y curl

# -y means yes to all prompts (no prompts) during installation process
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - 
RUN apt-get install -y nodejs

# Copying the package.json file to the container
# COPY <source> <destination>

# COPY package.json /app/package.json
# COPY package-lock.json /app/package-lock.json

# RUN cd app && npm install
# COPY main.js /app/main.js

# better alternative to avoid using /app/ in every command

WORKDIR /app

COPY package.json package.json
COPY package-lock.json package-lock.json

RUN npm install
COPY main.js main.js


# COPY  ..  copies all the files from the current directory to the container

# ENTRYPOINT is the command that will be executed when the container starts
ENTRYPOINT [ "node","main.js" ]

# docker build -t <name>  is used to build the image -t is the tag name of the image