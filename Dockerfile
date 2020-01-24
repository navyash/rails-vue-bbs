FROM ruby:2.5.1

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - &&\
    apt-get update -qq &&\
    apt-get install -y nodejs
ENV TZ=Asia/Tokyo

WORKDIR /usr/src/app
COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install

RUN mkdir frontend
COPY frontend/package.json frontend/.
COPY frontend/package-lock.json frontend/.
RUN cd frontend && npm install

CMD /bin/sh -c "rm -f tmp/pids/server.pid && bundle exec rails s -p 8080 -b '0.0.0.0'"