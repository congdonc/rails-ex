require 'active_support/core_ext/integer/time'

# NOTE: The original rails-ex used SQLite for the test environment.
# OpenProject 17 requires PostgreSQL exclusively — the test env now
# uses a separate PostgreSQL database (see config/database.yml).

Rails.application.configure do
  config.enable_reloading = false
  config.eager_load = ENV['CI'].present?
  config.public_file_server.enabled  = true
  config.public_file_server.headers  = { 'Cache-Control' => "public, max-age=#{1.hour.to_i}" }

  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  config.cache_store = :null_store

  config.action_dispatch.show_exceptions = :rescuable

  config.action_controller.allow_forgery_protection = false

  config.active_support.deprecation = :stderr
  config.active_support.disallowed_deprecation = :raise
  config.active_support.disallowed_deprecation_warnings = []

  config.active_record.migration_error       = :page_load
  config.active_record.dump_schema_after_migration = false
end
