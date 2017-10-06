FROM ruby:latest

RUN apt-get update && apt-get -qq install nodejs -y
RUN gem install rails

WORKDIR /git/automation
EXPOSE 3000

RUN groupadd -r felipe && useradd -r -g felipe felipe
RUN apt-get install -y gcc make cron vim

# bin/rake db:migrate RAILS_ENV=production;
CMD ["bash" , "-c" , "bundle install; /etc/init.d/cron start; rails server -b 0.0.0.0 -p 3000"]