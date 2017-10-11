require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AdminApiDemo
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    # Add middleware for ActiveAdmin
    config.middleware.use Rack::MethodOverride
    config.middleware.use ActionDispatch::Flash
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore

    ActionMailer::Base.smtp_settings = {
      address: Figaro.env.EMAIL_ADDRESS,
      domain: Figaro.env.EMAIL_DOMAIN,
      password: Figaro.env.EMAIL_PASSWORD,
      port: Figaro.env.EMAIL_PORT,
      user_name: Figaro.env.EMAIL_USERNAME,
      authentication: :plain,
      enable_starttls_auto: true
    }

    config.action_mailer.delivery_method = :smtp
    config.action_mailer.default_url_options = { host: "#{Figaro.env.APP_DOMAIN}" }
  end
end
