# config/importmap.rb
# Rails 8 uses importmap-rails as the default JavaScript bundler.
# This replaces the old Sprockets + uglifier + coffee-rails pipeline.
#
# All JavaScript modules pinned here are served via the browser's native
# ES module import mechanism — no transpilation or bundling required.

# Core Hotwire stack (replaces turbolinks from the original rails-ex)
pin 'application',      preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus',    to: 'stimulus.min.js'
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js'

# Auto-pin all controllers in app/javascript/controllers/
pin_all_from 'app/javascript/controllers', under: 'controllers'
