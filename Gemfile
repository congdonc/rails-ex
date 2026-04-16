source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# ------------------------------------------------------------------
# Ruby version constraint — must match OpenProject 17's requirement
# OpenProject stable/17 requires Ruby 3.4.x (see .ruby-version)
# ------------------------------------------------------------------
ruby '~> 3.4'

# Rails 8.0.2 is required by OpenProject 17 — pinned to the exact series
# (OpenProject Gemfile specifies: gem "rails", "~> 8.0.2", ">= 8.0.2.1")
gem 'rails', '~> 8.0.2', '>= 8.0.2.1'

# PostgreSQL 16/17 is required by OpenProject 17.
# pg gem 1.5+ supports both PG 16 and PG 17.
gem 'pg', '~> 1.5'

# Puma 6.5+ as the app server (OpenProject 17 uses puma ~> 6.5)
gem 'puma', '~> 6.5'

# Asset pipeline — sprockets 3.x (OpenProject locks below 4.0)
gem 'sprockets', '~> 3.7'
gem 'sprockets-rails', '~> 3.5'

# SCSS for stylesheets — sass-rails updated for Rails 8 compatibility
gem 'sass-rails', '~> 6.0'

# Use Cssbundling / Jsbundling for modern asset handling, or keep
# importmap-rails as a lightweight option for Rails 8 apps.
# Replace the old uglifier/coffee-rails pipeline:
gem 'importmap-rails', '~> 2.0'
gem 'turbo-rails', '~> 2.0'
gem 'stimulus-rails', '~> 1.3'

# JSON API builder — kept from original
gem 'jbuilder', '~> 2.12'

# Redis adapter for Action Cable / cache (updated to 5.x per OpenProject 17)
gem 'redis', '~> 5.4'

# matrix gem required for prawn (no longer bundled in Ruby >= 3.1 core)
gem 'matrix', '~> 0.4'

# net-smtp is required by ActionMailer in Ruby >= 3.1
gem 'net-smtp', '~> 0.5'

# ffi (native extensions — keep >=1.15.1 for Ruby 3.x compat)
gem 'ffi', '>= 1.15.1'

# listen is needed for file-watching in dev
gem 'listen', '~> 3.9'

# tzinfo-data for Windows / JRuby platforms
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# ----------------------------------------------------------------------
# REMOVED from original rails-ex (not compatible with Rails 8 / Ruby 3.4):
#   gem 'uglifier'        — replaced by importmap-rails / jsbundling
#   gem 'coffee-rails'    — CoffeeScript no longer supported by Rails 8
#   gem 'turbolinks'      — replaced by turbo-rails (Hotwire)
#   gem 'sqlite3'         — OpenProject 17 requires PostgreSQL exclusively
# ----------------------------------------------------------------------

group :development, :test do
  # Ruby debugger (byebug replaced by debug gem in Ruby 3.1+)
  gem 'debug', '>= 1.0.0', platforms: [:mri, :mingw, :x64_mingw]

  # System testing
  gem 'capybara', '~> 3.40'
  gem 'selenium-webdriver', '~> 4.0'
end

group :development do
  # Web console for debugging exceptions in browser
  gem 'web-console', '~> 4.2'

  # Spring is not recommended with Ruby 3.4+ / Rails 8; use zeitwerk instead
  # gem 'spring'
  # gem 'spring-watcher-listen'
end
