#!/bin/sh
echo Drop DB
rm -f db/development.sqlite3
rm -f db/test.sqlite3
echo DEV Migrate
rake db:migrate
echo DEV Seed
rake db:seed
echo DEV Import: AdSize
rake import:adsizes
echo TEST Migrate
RAILS_ENV=test rake db:migrate
echo De-annotate
annotate -d
echo Annotate
annotate -i -m