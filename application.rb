require_relative 'boot'

# Rails 8: require only the frameworks your application uses.
# OpenProject 17 uses the full Rails stack, so we load everything.
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsApp
  class Application < Rails::Application
    # ----------------------------------------------------------------
    # Rails 8 defaults
    # ----------------------------------------------------------------
    config.load_defaults 8.0

    # ----------------------------------------------------------------
    # Ruby 3.4 / Rails 8 timezone
    # ----------------------------------------------------------------
    # config.time_zone = 'UTC'
    # config.eager_load_paths << Rails.root.join('extras')

    # ----------------------------------------------------------------
    # Asset pipeline — sprockets 3.x (locked below 4.0 per OpenProject)
    # ----------------------------------------------------------------
    # importmap-rails is configured in config/importmap.rb
    config.assets.version  = '1.0'
    config.assets.prefix   = '/assets'

    # ----------------------------------------------------------------
    # PostgreSQL-specific: enable advisory locking for OpenProject 17
    # (used to safeguard journal creation and background jobs)
    # ----------------------------------------------------------------
    # config.active_record.advisory_locks_enabled = true  # default: true

    # ----------------------------------------------------------------
    # Encoding — explicit UTF-8 for PostgreSQL 16/17
    # ----------------------------------------------------------------
    config.encoding = 'utf-8'

    # ----------------------------------------------------------------
    # OpenProject 17 raises if SECRET_KEY_BASE is missing.
    # In production it must be set via ENV['SECRET_KEY_BASE'].
    # ----------------------------------------------------------------
    # config.require_master_key = true  # uncomment if using credentials
  end
end
