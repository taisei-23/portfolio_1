require_relative "boot"

require "rails/all"

Dotenv::Railtie.load if defined?(Dotenv)

Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    config.load_defaults 8.0

    config.i18n.default_locale = :ja
    config.autoload_lib(ignore: %w[assets tasks])

    config.session_store :cookie_store, key: "_your_app_session"
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore

    config.generators do |g|
      g.orm :active_record, primary_key_type: :uuid
    end
  end
end
