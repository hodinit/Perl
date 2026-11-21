FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    apache2 \
    libapache2-mod-perl2 \
    libcgi-pm-perl \
    liblog-log4perl-perl \
    curl \
    perl \
    make \
    gcc \
    && rm -rf /var/lib/apt/lists/*

RUN curl -L https://cpanmin.us | perl - App::cpanminus
RUN cpanm --verbose Template::Tiny CGI File::Slurp Data::Dumper Exporter::NoWork

RUN mkdir -p /usr/lib/cgi-bin/uploads && \
    chown -R www-data:www-data /usr/lib/cgi-bin/uploads && \
    chmod 755 /usr/lib/cgi-bin/uploads

RUN a2enmod cgi alias
RUN mkdir -p /usr/lib/cgi-bin

# Apache CGI configuration
COPY apache-cgi.conf /etc/apache2/conf-available/cgi-bin.conf

RUN a2enconf cgi-bin

# Apache logs to Docker stdout/stderr
RUN ln -sf /dev/stdout /var/log/apache2/access.log && \
    ln -sf /dev/stderr /var/log/apache2/error.log

EXPOSE 80

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

CMD ["/usr/local/bin/docker-entrypoint.sh"]