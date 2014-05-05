require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Luke
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    config.assets.paths << Rails.root.join('app', 'assets', 'swf')
    config.autoload_paths += %W(#{config.root}/app/models/ckeditor)

    config.i18n.default_locale = :'zh-CN'
    I18n.locale = "zh-CN"

    #config.i18n.available_locales = "zh-CN"

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', 'models', '*', '*.yml').to_s]  
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', 'views', '*', '*.yml').to_s]  
      
    # config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]  

    config.action_mailer.delivery_method = :smtp
    # config.action_mailer.perform_deliveries = true
    # config.action_mailer.raise_delivery_errors = false
    # config.action_mailer.default :charset => "utf-8"
    config.action_mailer.smtp_settings = {
      address:              'smtp.163.com',
      port:                 25,
      domain:               '163.com',
      authentication:       'plain',
      enable_starttls_auto: true,
      authentication: :login,
      user_name:            'luke_hr@163.com',
      password:             'luke123456'
    }

  end
end
