# frozen_string_literal: true

require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_mailbox/engine'
require 'action_text/engine'
require 'action_view/railtie'
require 'action_cable/engine'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module EmailTest
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Company name and address information.
    config.x.company.name = 'Social Co.'
    config.x.company.address_line1 = '1234 Main St.'
    config.x.company.address_line2 = 'Toronto, ON, M4M 1M1'

    # Don't generate system test files.
    config.generators.system_tests = nil

    config.action_mailer.preview_path = Rails.root.join('spec/mailers/previews')

    config.assets.paths << Rails.root.join('app/components')

    config.generators do |g|
      g.test_framework :rspec, view_specs: false, request_specs: false
      g.fixture_replacement :factory_bot
      g.helper false
      g.assets false
    end
  end
end
