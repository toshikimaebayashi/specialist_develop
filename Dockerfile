FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /specialist_develop
WORKDIR /specialist_develop
COPY Gemfile /specialist_develop/Gemfile
COPY Gemfile.lock /specialist_develop/Gemfile.lock
RUN bundle install
COPY . /specialist_develop

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]