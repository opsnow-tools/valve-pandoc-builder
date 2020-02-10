# Dockerfile

FROM node:10-jessie-slim

ENV pandoc 2.9.1.1

RUN apt-get update
RUN apt-get install -y bzip2 curl

RUN curl -sL https://github.com/jgm/pandoc/releases/download/${pandoc}/pandoc-${pandoc}-linux-amd64.tar.gz | tar xz
RUN mv pandoc-${pandoc}/bin/* /usr/local/bin/
RUN rm -rf pandoc-${pandoc}
