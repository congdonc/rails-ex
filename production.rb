require 'active_support/core_ext/integer/time'

Rails.application.configure do
  # -----------------------------------------------------------------------
  # Rails 8 production defaults
  # -----------------------------------------------------------------------
  config.enable_reloading = false
  config.eager_load = true
  config.consider_all_requests_local = false

  # Action Controller
  config.action_controller.perform_caching = true

  # -----------------------------------------------------------------------
  # Asset pipeline — Sprockets 3.x (locked < 4.0, per OpenProject 17)
  # -----------------------------------------------------------------------
  config.assets.compile = false
  config.assets.digest  = true

  # -----------------------------------------------------------------------
  # Static file serving
  # In OpenShift the container serves static assets itself unless a CDN or
  # reverse proxy is placed in front. Set RAILS_SERVE_STATIC_FILES=true
  # to enable; the OpenShift template sets this automatically.
  # -----------------------------------------------------------------------
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?

  # -----------------------------------------------------------------------
  # Force HTTPS — disable on OpenShift if the route handles TLS termination.
  # -----------------------------------------------------------------------
  # config.force_ssl = true

  # -----------------------------------------------------------------------
  # Logging
  # -----------------------------------------------------------------------
  config.log_level  = :info
  config.log_tags   = [:request_id]
  # Log to STDOUT so OpenShift / Docker capture it via the container log driver.
  config.logger = ActiveSupport::Logger.new($stdout)
  config.log_formatter = ::Logger::Formatter.new

  # -----------------------------------------------------------------------
  # Active Record
  # -----------------------------------------------------------------------
  # Dump DB schema after migrations (useful in development, not production).
  config.active_record.dump_schema_after_migration = false

  # -----------------------------------------------------------------------
  # Mailer
  # -----------------------------------------------------------------------
  config.action_mailer.perform_caching = false
  # config.action_mailer.raise_delivery_errors = false

  # -----------------------------------------------------------------------
  # Internationalisation
  # -----------------------------------------------------------------------
  # config.i18n.fallbacks = true

  # -----------------------------------------------------------------------
  # Deprecation notices
  # -----------------------------------------------------------------------
  config.active_support.report_deprecations = false

  # -----------------------------------------------------------------------
  # Cache — use memory store by default; switch to Redis for OpenProject 17
  # production deployments:
  #   config.cache_store = :redis_cache_store, { url: ENV['REDIS_URL'] }
  # -----------------------------------------------------------------------
  config.cache_store = :memory_store
end
