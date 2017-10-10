FROM golang:1.9.1

RUN apt-get update && apt-get install -y --no-install-recommends \
  xz-utils
RUN curl https://nodejs.org/dist/v6.11.4/node-v6.11.4-linux-x64.tar.xz | tar -xJ
RUN apt-get purge -y \
  xz-utils

RUN apt-get clean -y && apt-get autoclean -y && apt-get autoremove -y && rm -rf /var/lib/apt/lists/*

ENV PATH $GOPATH/node-v6.11.4-linux-x64/bin:$PATH

CMD ["/bin/bash"]