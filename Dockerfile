# Docker image for CHIP 3.7 (Sinatra Wordguesser).
#
# Builds an environment with the Ruby version and gems the assignment needs.
# GitHub Codespaces and the VS Code Dev Containers extension build this same
# file, via .devcontainer/devcontainer.json -- there is no separate dev image.
#
# It lives here in solutions/ because that is what build_starter_code.json
# copies to the root of the generated starter repo, which is the build context
# the COPY paths below are relative to. Unlike 2.5, this chip's Codio build
# does not copy solutions/, so nothing has to except it.
FROM ruby:3.3.13

RUN gem install bundler

WORKDIR /app

COPY Gemfile ./
RUN bundle install

COPY . ./
RUN chmod +x ./run_specs.sh

# The Sinatra app serves on http://localhost:4567 when started with
# `bundle exec rackup --host 0.0.0.0 -p 4567`
EXPOSE 4567

# Tip: run with `-v "$(pwd)":/app` so your local edits are visible inside the
# container without rebuilding the image (see DEVELOPING.md).
CMD ["bash"]
