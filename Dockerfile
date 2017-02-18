# 8888888b.                         888
# 888  "Y88b                        888
# 888    888                        888
# 888    888888  88888888b.  .d8888b88888b.  8888b. 88888b.
# 888    888888  888888 "88bd88P"   888 "88b    "88b888 "88b
# 888    888888  888888  888888     888  888.d888888888  888
# 888  .d88PY88b 888888  888Y88b.   888  888888  888888  888
# 8888888P"  "Y88888888  888 "Y8888P888  888"Y888888888  888
#                 888  The Dynamic Chan Engine | dynchan.com
#           Y8b d88P   Apache 2.0 License
#           "Y88P"

# Use the latest version of Node.js as the basis for our container
FROM node:latest

# Create the working directory for the installation of Dynchan within
# the Docker container context
RUN mkdir -p /usr/src/dynchan/
WORKDIR /usr/src/dynchan/

# Copy the `package.json` file containing dependencies for Dynchan into
# the Docker container context and install those dependencies using the
# Node.js Package Manager (NPM)
COPY package.json /usr/src/dynchan/
RUN npm install

# Copy the remainder of the dynchan source code into the Docker container
# context
COPY . /usr/src/dynchan/

# Expose the ports used in dynchan to Docker
# -> HTTP
EXPOSE 80
ENV DYNCHAN_HTE_HTTP_PORT 80

# -> HTTPS
EXPOSE 443
ENV DYNCHAN_HTE_HTTPS_PORT 443

# Start dynchan
CMD [ "npm", "start" ]
