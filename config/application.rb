require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
# require "action_mailer/railtie"
require "action_view/railtie"
# require "action_cable/engine"
# require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Pokegraffiti
  class Application < Rails::Application
    config.api_only = true
    config.active_record.primary_key = :uuid
    config.active_record.raise_in_transactional_callbacks = true
    Jbuilder.key_format camelize: :lower

    config.middleware.delete Rack::Sendfile
    config.middleware.delete ActionDispatch::Static
  end
end
