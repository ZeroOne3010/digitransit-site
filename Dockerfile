FROM node:10-alpine
MAINTAINER Reittiopas version: 0.1

ENV WORK=/opt/digitransit-site

WORKDIR ${WORK}

RUN yarn global add gatsby-cli@2.4.5 && \
  yarn global add serve@10.1.1 && \
  mkdir -p ${WORK}

# Add application
ADD . ${WORK}

RUN yarn && \
  gatsby build

EXPOSE 8080

CMD serve -l 8080 ./public
