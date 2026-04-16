# config/puma.rb — Puma 6.5+ configuration
# OpenProject 17 requires Puma ~> 6.5.
#
# WEB_CONCURRENCY  : number of worker processes  (default: 2)
# RAILS_MAX_THREADS: max threads per worker       (default: 5)
# PORT             : HTTP port to bind            (default: 8080 on OpenShift, 3000 locally)

max_threads_count = ENV.fetch('RAILS_MAX_THREADS', 5).to_i
min_threads_count = ENV.fetch('RAILS_MIN_THREADS') { max_threads_count }
threads min_threads_count, max_threads_count

# Puma 6 uses `port` for single-bind; multi-bind uses `bind`.
port ENV.fetch('PORT', 3000)

# Puma 6 cluster mode: multiple worker processes
# Each worker gets its own copy of the application after forking.
workers ENV.fetch('WEB_CONCURRENCY', 2).to_i

# Puma 6 phased restart (rolling restart without downtime)
# Requires workers > 0.
allow_restart

# Preload application in the master process before forking workers.
# Improves boot time; requires thread-safe code (Rails 8 is thread-safe by default).
preload_app!

on_worker_boot do
  # Re-establish ActiveRecord connection pool after forking.
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
end

# Path to Puma's state and control socket — used by pumactl.
state_path 'tmp/pids/server.state'
pidfile    'tmp/pids/server.pid'

# Puma 6 plugin: statsd metrics (only loaded if puma-plugin-statsd is in Gemfile)
# plugin :statsd

# Environment (falls back to 'development' if RAILS_ENV is not set)
rails_env = ENV.fetch('RAILS_ENV', 'development')
environment rails_env

# In production, log to stdout so OpenShift / container runtimes capture it.
if rails_env == 'production'
  stdout_redirect '/dev/stdout', '/dev/stderr', true
end
