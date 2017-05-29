# welliton/ga4gh-shiny
FROM rocker/shiny

MAINTAINER Welliton Souza "well309@gmail.com"

RUN apt-get update && \
    apt-get install --yes libssl-dev libxml2-dev

COPY install.R /tmp/install.R
RUN R -f /tmp/install.R && \
    rm -f /tmp/install.R

COPY app.R /srv/shiny-server/app.R
