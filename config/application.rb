require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Sysigreja
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1
    config.autoload_lib(ignore: %w(assets tasks))

   # I18n config
    config.i18n.load_path += Dir[Rails.root.join('config/locales/**/*.{rb,yml}')]
    config.i18n.available_locales = [:'pt-BR', :en]
    config.i18n.default_locale = :'pt-BR'
    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"
    config.time_zone = 'Brasilia'
    Audited.current_user_method = :authenticated_user

    config.active_record.use_yaml_unsafe_load = true
      
     config.generators.system_tests = nil
  end
end
