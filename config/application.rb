require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Mercury
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**/*.{rb,yml}').to_s]

    config.i18n.default_locale = :en
    config.i18n.fallbacks      = [:en]

    config.generators do |g|
      g.orm              :active_record
      g.template_engine  :slim
      g.test_framework   :rspec
      g.integration_tool :rspec
      g.stylesheets      false
      g.javascripts      false
    end

    # config.middleware.insert_before 0, "Rack::Cors", :debug => true, :logger => (-> { Rails.logger }) do
    config.middleware.insert_before 0, "Rack::Cors" do
      allow do
        origins '*'
        resource '/api',
                 :headers => :any,
                 :methods => [:post],
                 :credentials => true,
                 :max_age => 0
        resource '*',
                 :headers => :any,
                 :methods => [:get, :post, :delete, :put, :options, :head],
                 :max_age => 0
      end
    end

  end
end
