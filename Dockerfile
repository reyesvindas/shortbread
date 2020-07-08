FROM ruby:1.9.3

RUN set -ex \
    && apt-get update -y \
    && apt-get install -y \
        build-essential \
        libgmp-dev \
        libpq-dev \
        nodejs \
    && apt-get autoremove --purge -y \
    && rm -rf /var/lib/apt/lists/*

ENV RAILS_ROOT /var/www/my-shrtbrd
RUN mkdir -p $RAILS_ROOT
WORKDIR $RAILS_ROOT
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install
COPY . .

EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
