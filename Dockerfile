FROM ruby:3.0.1

RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - \
  && apt-get update && apt-get install -y vim nodejs \
  && npm install --global yarn && gem install rails -v '6.1.3.2'

WORKDIR /var/www/Personal_Coordinator

ADD . /
RUN bundle install
