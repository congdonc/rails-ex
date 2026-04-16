# config.ru — Rack entry point
# Updated for Rails 8 / Puma 6.5+ (OpenProject 17)
#
# Puma 6.x looks for this file automatically; no additional configuration
# is required here beyond the standard Rails bootup.

require_relative 'config/environment'

run Rails.application

# Rails 8 ships with built-in middleware for serving static assets in
# production via ActionDispatch::Static.  If you are placing a reverse
# proxy (e.g., Apache / nginx) in front of Puma you can disable this
# by setting RAILS_SERVE_STATIC_FILES=false.
Rails.application.config.middleware.use ActionDispatch::Static, "#{Rails.root}/public" \
  if ENV['RAILS_SERVE_STATIC_FILES'].present?
