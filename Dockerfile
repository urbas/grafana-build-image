FROM golang:1.9.1

RUN apt-get update && apt-get install -y --no-install-recommends \
  xz-utils
RUN curl https://nodejs.org/dist/v6.11.4/node-v6.11.4-linux-x64.tar.xz | tar -xJ
ENV PATH $GOPATH/node-v6.11.4-linux-x64/bin:$PATH
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

RUN apt-get clean -y && apt-get autoclean -y && apt-get autoremove -y && rm -rf /var/lib/apt/lists/*

COPY ./build-grafana.sh /

CMD ["/bin/bash"]