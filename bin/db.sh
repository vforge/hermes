#!/bin/sh
echo Drop DB
rake db:drop
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