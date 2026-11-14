FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    apache2 \
    perl \
    libcgi-pm-perl \
    libtemplate-tiny-perl \
    libfile-slurp-perl
RUN a2enmod cgid
CMD ["apachectl", "-D", "FOREGROUND"]