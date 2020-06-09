FROM registry.fedoraproject.org/fedora:31

RUN set -x && \
    dnf -y update && \
    dnf -y install ruby-devel make gcc gcc-c++ redhat-rpm-config zlib-devel rubygem-nokogiri git && \
    dnf clean all && \
    rm -rf /var/cache/yum /var/cache/dnf

RUN mkdir -p /home/koku/website
RUN mkdir -p /home/koku/bin

WORKDIR /home/koku/website

RUN gem install bundle && gem install jekyll

COPY . /home/koku/website
RUN bundle install
ENTRYPOINT [ "bundle", "exec", "jekyll", "serve", "-H", "0.0.0.0" ]
