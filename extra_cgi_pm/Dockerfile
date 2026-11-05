FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y apache2 perl libcgi-pm-perl dos2unix && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN a2enmod cgid && \
    echo "ServerName localhost" >> /etc/apache2/apache2.conf

COPY hello.pl /usr/lib/cgi-bin/hello.pl

RUN dos2unix /usr/lib/cgi-bin/hello.pl && \
    chmod +x /usr/lib/cgi-bin/hello.pl

EXPOSE 80

CMD ["apachectl", "-D", "FOREGROUND"]