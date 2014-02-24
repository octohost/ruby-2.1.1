FROM octohost/ubuntu:13.10

RUN apt-get update && apt-get install -y git curl wget build-essential make libxslt-dev libxml2-dev libmysqlclient-dev libpq-dev libsqlite3-0 libsqlite3-dev software-properties-common libyaml-0-2
# Install from deb we built using these scripts: https://github.com/darron/ubuntu-ruby-package-builder
RUN wget -q http://dl.bintray.com/octohost/ruby/ruby-2.1.1_amd64.deb && dpkg -i ruby-2.1.1_amd64.deb && rm -f ruby-2.1.1_amd64.deb
RUN gem install foreman bundler --no-ri --no-rdoc

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
