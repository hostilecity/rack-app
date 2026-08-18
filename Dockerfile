FROM ruby:3.2.7

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 9292

CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "9292"]
