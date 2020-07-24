FROM ruby:2.3

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/app

RUN gem install backup -v "4.4.0"


RUN apt-get update -y && apt-get install mysql-client -y  && rm -rf /var/lib/apt/lists/*

RUN useradd -r -u 1000 appuser

USER appuser

ENTRYPOINT ["/usr/local/bundle/bin/backup"]

