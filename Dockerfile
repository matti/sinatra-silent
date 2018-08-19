FROM ruby:2.5.1

WORKDIR /app
ADD . .

RUN bundle install
