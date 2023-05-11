FROM ruby:2.6.6-alpine3.10
WORKDIR /app
COPY . .
#COPY Gemfile Gemfile.lock ./

RUN apk add build-base
RUN gem install bundler
RUN bundle install



# Application dependencies


# Serve the application
ENV RAILS_SERVE_STATIC_FILES=true
ENV RAILS_LOG_TO_STDOUT=true
CMD rackup -o 0.0.0.0
EXPOSE 9292