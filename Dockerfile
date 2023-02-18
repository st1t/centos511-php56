FROM centos:5.11
WORKDIR /tmp

RUN rm -f /etc/yum.repos.d/*
COPY files/etc/yum.repos.d/CentOS-Vault.repo /etc/yum.repos.d/CentOS-Vault.repo

RUN yum install -y \
    wget \
    make \
    gcc \
    libxml2-devel

RUN wget https://www.php.net/distributions/php-5.6.40.tar.gz --no-check-certificate \
    && tar zxvf php-5.6.40.tar.gz \
    && cd php-5.6.40/ \
    && ./configure \
    && make -j 4 \
    && make install
