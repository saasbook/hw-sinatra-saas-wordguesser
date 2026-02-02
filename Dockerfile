FROM ruby:3.3.8

RUN gem install bundler

WORKDIR /app

COPY app.rb config.ru Rakefile Procfile Gemfile Guardfile /app/
COPY --parents docs/ /app/
COPY --parents features/ /app/
COPY --parents lib/ /app/
COPY --parents spec/ /app/
COPY --parents views/ /app/

#RUN bundle install
