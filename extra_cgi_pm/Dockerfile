FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    apache2 \
    perl \
    cpanminus \
    libcgi-pm-perl \
    libtemplate-tiny-perl \
    libfile-slurp-perl \
    && cpanm Exporter::NoWork
RUN a2enmod cgid
CMD ["apachectl", "-D", "FOREGROUND"]