require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Jobaty
  class Application < Rails::Application
    config.time_zone = 'Buenos Aires' 
    config.active_record.default_timezone = :local
    config.active_record.raise_in_transactional_callbacks = true
    config.i18n.default_locale = :es
  end
end
