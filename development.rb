require 'active_support/core_ext/integer/time'

Rails.application.configure do
  # -----------------------------------------------------------------------
  # Rails 8 development defaults
  # -----------------------------------------------------------------------
  config.enable_reloading = true
  config.eager_load = false
  config.consider_all_requests_local = true
  config.server_timing = true

  # Action Controller
  config.action_controller.perform_caching = false
  config.action_controller.raise_on_missing_callback_actions = true

  # -----------------------------------------------------------------------
  # Asset pipeline
  # -----------------------------------------------------------------------
  config.assets.debug   = true
  config.assets.quiet   = true
  config.assets.compile = true

  # -----------------------------------------------------------------------
  # Logging
  # -----------------------------------------------------------------------
  config.log_level = :debug

  # -----------------------------------------------------------------------
  # Active Record
  # -----------------------------------------------------------------------
  config.active_record.migration_error = :page_load
  config.active_record.verbose_query_logs = true
  config.active_record.query_log_tags_enabled = true

  # -----------------------------------------------------------------------
  # Mailer
  # -----------------------------------------------------------------------
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.perform_caching = false

  # -----------------------------------------------------------------------
  # Deprecation notices to console
  # -----------------------------------------------------------------------
  config.active_support.deprecation = :log
  config.active_support.disallowed_deprecation = :raise
  config.active_support.disallowed_deprecation_warnings = []

  # -----------------------------------------------------------------------
  # File watcher — uses listen gem (~> 3.9)
  # -----------------------------------------------------------------------
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
end
