# Dockerfile
# Use ruby image to build our own image
#FROM heroku/ruby
FROM ruby:2.7.1
FROM heroku/heroku:20
MAINTAINER hayeonkim226@gmail.com
# We specify everything will happen within the /app folder inside the container
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN apt-get update -qq && apt-get install -y build-essential nodejs
RUN apt-get update && apt-get install -y curl

RUN mkdir /daangn-server
WORKDIR /daangn-server
# We copy these files from our current application to the /app container
COPY Gemfile /daangn-server/Gemfile
COPY Gemfile.lock /daangn-server/Gemfile.lock
# We install all the dependencies
RUN gem install bundler
RUN bundle config --global silence_root_warning 1
RUN bundle install

# We copy all the files from our current application to the /app container
COPY . .
# We expose the port
EXPOSE 3000
# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
ENV GEM_HOME="/usr/local/bundle"
ENV PATH $GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH
