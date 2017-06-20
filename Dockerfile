#https://docs.docker.com/compose/rails/#build-the-project

FROM ruby:2.3

# install postgres native client
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# make workdir
RUN mkdir /myapp
WORKDIR /myapp

# build rails & gems
RUN gem install rails --version 3.2.21
COPY Dockerfile* fig.yml* .gitignore* .dockerignore* Gemfile* /myapp/
RUN [ -e /myapp/Gemfile ] && bundle install || true
