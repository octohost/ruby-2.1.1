FROM octohost/ubuntu:13.10

RUN apt-get update && apt-get install -y git curl wget build-essential make libxslt-dev libxml2-dev libmysqlclient-dev libpq-dev libsqlite3-0 libsqlite3-dev software-properties-common libyaml-0-2
RUN add-apt-repository ppa:brightbox/ruby-ng && add-apt-repository ppa:nginx/development && apt-get update
RUN apt-get install -y nginx ruby2.1 ruby2.1-dev
RUN update-alternatives --set ruby /usr/bin/ruby2.1 && update-alternatives --set gem /usr/bin/gem2.1
RUN gem install foreman bundler --no-ri --no-rdoc
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ADD default /etc/nginx/sites-available/default
ADD nginx.conf /etc/nginx/nginx.conf
