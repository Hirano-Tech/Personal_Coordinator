require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module PersonalCoordinator
  class Application < Rails::Application
    config.load_defaults 6.1

    config.encoding = 'utf-8'
    config.i18n.default_locale = :ja
    config.time_zone = 'Asia/Tokyo'
    config.beginning_of_week = :monday

    config.active_record.default_timezone = :local
    config.active_record.schema_format = :ruby

    console do
      require 'pry'
      config.console = Pry
    end

    config.generators do |g|
      g.helper false
      g.assets false
      g.stylesheets false
      g.javascripts false
    end
  end
end
