#!/bin/sh
echo Drop DB
rm -f db/development.sqlite3
rm -f db/test.sqlite3
echo DEV Migrate
bundle exec rake db:migrate
echo DEV Seed
bundle exec rake db:seed
echo DEV Import: AdSize
bundle exec rake import:adsizes
echo TEST Migrate
RAILS_ENV=test bundle exec rake db:migrate
echo De-annotate
annotate -d
echo Annotate
annotate -i -m
