FROM golang:1.10.3

RUN apt-get update && apt-get install -y --no-install-recommends \
  xz-utils

ARG NODE_URL=https://nodejs.org/dist/v8.11.4/node-v8.11.4-linux-armv7l.tar.xz
RUN mkdir node
RUN curl $NODE_URL | tar -xJ -C node --strip 1
ENV PATH $GOPATH/node/bin:$PATH
RUN npm install -g yarn
RUN apt-get purge -y \
  xz-utils

RUN apt-get install -y --no-install-recommends \
  ruby \
  ruby-dev
RUN gem install fpm -v 1.4

RUN apt-get install -y --no-install-recommends \
  libfontconfig \
  bzip2 \
  rpm

# Installing phantomjs allows us to build Grafana on ARM
RUN apt-get install -y --no-install-recommends \
  phantomjs
# Without this phantomjs tries to render to the screen and sigaborts.
ENV QT_QPA_PLATFORM offscreen

RUN apt-get clean -y && apt-get autoclean -y && apt-get autoremove -y && rm -rf /var/lib/apt/lists/*

COPY ./build-grafana.sh /

CMD ["/bin/bash"]
