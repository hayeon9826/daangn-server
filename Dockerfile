# Dockerfile

FROM ruby:2.7.1
FROM heroku/heroku:20

MAINTAINER hayeonkim226@gmail.com


RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN apt-get update -qq && apt-get install -y build-essential nodejs
RUN apt-get update && apt-get install -y curl

RUN mkdir /daangn-server
WORKDIR /daangn-server

COPY Gemfile /daangn-server/Gemfile
COPY Gemfile.lock /daangn-server/Gemfile.lock

RUN gem install bundler -v 2.2.9
RUN bundle install

COPY . /daangn-server

RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
ENV GEM_HOME="/usr/local/bundle"
ENV PATH $GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH
