#!/bin/bash
#
# migrate-database.sh — updated for OpenProject 17
#
# Runs ActiveRecord migrations against the configured PostgreSQL 16/17 database.
# This script is typically invoked as a pre-hook in the OpenShift DeploymentConfig.
#
# OpenProject 17 required extensions (must be created before first migrate):
#   pg_trgm, btree_gist, unaccent
# These are installed automatically by OpenProject's db:migrate if the DB user
# has SUPERUSER or CREATE EXTENSION privileges.

set -e

function is_db_initialized() {
  bundle exec rails runner "ActiveRecord::Base.connection.table_exists?('schema_migrations')" \
    RAILS_ENV="${RAILS_ENV:-production}" 2>/dev/null
}

echo "==> Waiting for PostgreSQL to become available..."
until bundle exec rails runner "ActiveRecord::Base.connection" RAILS_ENV="${RAILS_ENV:-production}" 2>/dev/null; do
  echo "    PostgreSQL not ready yet, sleeping 2s..."
  sleep 2
done

echo "==> Running database migrations (Rails 8 / OpenProject 17)..."
bundle exec rails db:migrate RAILS_ENV="${RAILS_ENV:-production}"

echo "==> Database migration complete."
