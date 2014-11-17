source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.1.0'

# Use sqlite3 and MySQL as the database for Active Record
gem 'sqlite3'
gem 'mysql2'

# Use SCSS for stylesheets
gem 'sass', '~> 3.2.5'
gem 'sass-rails', '~> 4.0.2'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', require: false

# Deploy with Capistrano
group :development do
  gem 'capistrano'
  gem 'capistrano-rails'
end

# To use debugger
# gem 'debugger'

# https://github.com/zapnap/resque_mailer
gem 'resque' # or a compatible alternative / fork
gem 'resque_mailer'

# http://rubygems.org/gems/carrierwave
gem 'mini_magick'
gem 'carrierwave'

# https://github.com/norman/babosa
gem 'babosa'

# https://github.com/balexand/email_validator
gem 'email_validator'

# https://github.com/EppO/rolify
# NOT NEEDED NOW gem 'rolify'

# http://rubygems.org/gems/authlogic
# gem 'authlogic'

# https://github.com/adzap/validates_timeliness/
gem 'validates_timeliness', '~> 3.0'

# https://github.com/jim/carmen-rails
#gem 'carmen', '1.0.0.beta2'
#gem 'carmen-rails', '1.0.0.beta2'
# still some troubles, skipping for now

# https://github.com/mikel/mail
# gem 'mail'

# http://mailcatcher.me/
gem 'mailcatcher'

# https://github.com/spilliton/randumb
# Artist.random # a random Artist if there are any, otherwise nil
# Artist.random(3)  # an array of three Artists picked at random
# Artist.random(1)  # an array containing one random Artist
# # gimmie 5 random artists that are in the top 100 most viewed
# artists = Artist.limit(100).order('view_count DESC').random_by_id_shuffle(5)
gem 'randumb'

# https://github.com/huacnlee/rails-settings-cached
# Setting.XXXXXXX
# gem 'rails-settings-cached', github: 'huacnlee/rails-settings-cached'


# http://smartinez87.github.io/exception_notification/
gem 'exception_notification'

# https://github.com/slim-template/slim
# gem 'slim'
gem 'slim-rails'

# https://github.com/ambethia/recaptcha/
gem 'recaptcha'

gem 'basic-scopes'
gem 'untraceable-save'

# https://coderwall.com/p/5eqonw
gem 'decent_exposure'

# https://github.com/amatsuda/kaminari
gem 'kaminari'

# http://everydayrails.com/2012/03/12/testing-series-rspec-setup.html
# http://girders.org/blog/2014/02/06/setup-rails-41-spring-rspec-and-guard/
# http://bloginius.com/blog/2014/04/18/useful-gems-for-rails-developer-part-1-development/
group :development, :test do
  gem 'spring-commands-rspec'
  gem 'rspec-rails'
  # gem 'rspec-legacy_formatters'
  # guard needs those
  #require 'rbconfig'
  #gem 'wdm', '>= 0.1.0' if RbConfig::CONFIG['target_os'] =~ /mswin|mingw|cygwin/i
  gem 'guard-rspec'
  gem 'rb-inotify'
  gem 'libnotify'
  gem 'rb-fsevent' if `uname` =~ /Darwin/
  gem 'factory_girl_rails'
  gem 'factory_girl-seeds'
  # https://github.com/stympy/faker
  # http://rubydoc.info/github/stympy/faker/master/frames
  gem 'faker'
  # http://rubydoc.info/gems/capybara/2.2.1/frames
  gem 'capybara'
  gem 'launchy'
  # https://github.com/grosser/autotest
  # gem 'autotest'

  # https://github.com/colszowka/simplecov
  gem 'simplecov'

  # https://github.com/glebm/i18n-tasks
  gem 'i18n-tasks', '~> 0.7.4'

  gem 'coveralls'#, require: false
end

group :development do
  # https://github.com/railsbp/rails_best_practices
  gem 'rails_best_practices'

  # http://railscasts.com/episodes/402-better-errors-railspanel?view=asciicast
  gem 'better_errors', '~> 1.1.0'
  gem 'binding_of_caller'
  gem 'meta_request'

  # https://github.com/rweng/pry-rails
  gem 'pry'
  gem 'pry-rails', github: 'rweng/pry-rails'
  # gem 'awesome_print'
  # gem 'pry-rails'
  # gem 'hirb'
  gem 'pry-git'

  # https://github.com/cldwalker/hirb
  gem 'hirb'

  # https://github.com/ctran/annotate_models
  gem 'annotate'

  # https://github.com/flyerhzm/bullet
  gem 'bullet'

  # https://github.com/plentz/lol_dba
  gem 'lol_dba'

  # https://github.com/evrone/quiet_assets
  gem 'quiet_assets'

  # https://github.com/harleyttd/miniprofiler
  gem 'miniprofiler', require: 'rack-mini-profiler'

  # https://github.com/SamSaffron/MiniProfiler/tree/master/Ruby
  gem 'rack-mini-profiler'

  # https://github.com/troessner/reek
  gem 'reek', github: 'troessner/reek'

  # https://github.com/ryanb/letter_opener
  gem 'letter_opener'

  # https://github.com/presidentbeef/brakeman
  # security tester: bundle exec brakeman
  gem 'brakeman', github: 'presidentbeef/brakeman', require: false

  # https://github.com/redealumni/i18n_yaml_sorter
  # sort_yaml < in.yml > out.yml
  gem 'i18n_yaml_sorter'

  # https://github.com/YorickPeterse/ruby-lint
  gem 'ruby-lint'

  gem 'rubocop'#, require: false
  gem 'rubocop-rspec'

  gem 'magic_encoding'
end

group :test do
  # https://github.com/thekompanee/fuubar
  gem 'fuubar'
end

# https://github.com/brainspec/enumerize
gem 'enumerize'

# https://github.com/basecamp/marginalia
gem 'marginalia'

# https://github.com/drapergem/draper
gem 'draper'

# https://github.com/lulalala/multi_logger
# To setup a logger, create an initializer script such as [Rails.root]/config/initializers/logger.rb with:
# MultiLogger.add_logger('mail')
# This will create a log file located at log/mail.log.
# Then In Rails, you can log by calling the following:
# Rails.logger.mail.debug('42')
gem 'multi_logger'
# logger for payments / ?mails

# https://github.com/plataformatec/simple_form
gem 'simple_form', '3.1.0rc2'

# https://github.com/rails/sprockets-rails/issues/49
# https://github.com/alexspeller/non-stupid-digest-assets
gem 'non-stupid-digest-assets'

# Fix for https://github.com/tzinfo/tzinfo/wiki/Resolving-TZInfo::DataSourceNotFound-Errors
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw]
