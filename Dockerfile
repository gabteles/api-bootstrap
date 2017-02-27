FROM ruby:2.3.3
RUN mkdir /app
WORKDIR /app
ADD . /app
RUN bundle install
