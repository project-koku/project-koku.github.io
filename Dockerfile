FROM fedora:31

RUN mkdir -p /home/koku/website
RUN mkdir -p /home/koku/bin
RUN dnf -y install ruby-devel make gcc gcc-c++ redhat-rpm-config zlib-devel rubygem-nokogiri git

WORKDIR /home/koku/website
RUN gem install bundle
RUN gem install jekyll

COPY . /home/koku/website
RUN bundle install
ENTRYPOINT [ "bundle", "exec", "jekyll", "serve", "-H", "0.0.0.0" ]
