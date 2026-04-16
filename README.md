# Rails Example App — Updated for OpenProject 17

This is the [sclorg/rails-ex](https://github.com/sclorg/rails-ex) quickstart
Rails application, updated to be compatible with **building and running
OpenProject version 17** on OpenShift.

---

## What Changed from the Original

| Area | Original (rails-ex) | Updated (OpenProject 17) |
|---|---|---|
| **Ruby** | `~> 2.3` | **`~> 3.4`** (3.4.7 required) |
| **Rails** | `~> 6` | **`~> 8.0`** |
| **PostgreSQL** | 8.2+ | **16 / 17** (13-15 not supported) |
| **Node.js** | any | **v22.x** (LTS) |
| **Puma** | default | **`~> 6.5`** |
| **Bundler** | any | **2.7.2** |
| **Asset pipeline** | uglifier + coffee-rails + turbolinks | importmap-rails + turbo-rails + stimulus-rails |
| **SQLite (test)** | sqlite3 | **Removed** — PostgreSQL only |
| **JavaScript** | CoffeeScript | Vanilla JS / Stimulus (Hotwire) |
| **OpenShift template** | `ruby:2.5`, `postgresql:9.5` | **`ruby:3.4`**, **`postgresql:17`** |

---

## OpenProject 17 System Requirements

Taken directly from [openproject.org/docs](https://www.openproject.org/docs/installation-and-operations/system-requirements/):

- **Ruby** 3.4.7
- **Rails** 8.x
- **PostgreSQL** 16 or **17** (recommended)
  - Required extensions: `pg_trgm`, `btree_gist`, `unaccent`
- **Node.js** v22.x LTS
- **Puma** 6.5+
- **Bundler** 2.7.2

---

## OpenShift Considerations

### Assets

Your application is set to precompile the assets every time you push to OpenShift.

Set `DISABLE_ASSET_COMPILATION=true` in your BuildConfig to skip asset compilation.

### Security

OpenShift generates and injects `SECRET_KEY_BASE` and database credentials via
Secrets. These are never committed to source control.

### Development mode

```bash
oc set env dc/rails-postgresql-openproject17 RAILS_ENV=development
```

### Installation

```bash
oc new-app openshift/templates/rails-postgresql.json \
  -p SOURCE_REPOSITORY_URL=https://github.com/<yourusername>/rails-ex
```

### Puma Tuning

Two new template parameters control Puma concurrency:

- `WEB_CONCURRENCY` — number of worker processes (default: `2`)
- `RAILS_MAX_THREADS` — threads per worker (default: `5`)

Increase `MEMORY_LIMIT` if you increase either value.

### PostgreSQL Extensions

OpenProject 17 requires `pg_trgm`, `btree_gist`, and `unaccent`. These are
installed automatically by `rake db:migrate` when the database user has the
`CREATE EXTENSION` privilege (or SUPERUSER).

---

## Manual Installation (non-OpenShift)

```bash
# 1. Install Ruby 3.4.7 via rbenv
rbenv install 3.4.7
rbenv global 3.4.7

# 2. Install Node.js 22 via nodenv
nodenv install 22.21.0
nodenv global 22.21.0

# 3. Install Bundler 2.7.2
gem install bundler -v 2.7.2

# 4. Install gems
bundle install --without development test

# 5. Configure database
cp config/database.yml config/database.yml.example
# Edit config/database.yml with your PostgreSQL 16/17 credentials

# 6. Migrate
RAILS_ENV=production bundle exec rake db:migrate

# 7. Precompile assets
RAILS_ENV=production bundle exec rake assets:precompile

# 8. Start Puma
bundle exec puma -C config/puma.rb
```

---

## Compatibility

| Component | Required Version |
|---|---|
| Ruby | 3.4.7 |
| Rails | 8.0.x |
| PostgreSQL | 16 or 17 |
| Node.js | 22.x |
| Bundler | 2.7.2 |
| Puma | 6.5+ |

---

## License

This code is dedicated to the public domain to the maximum extent permitted by
applicable law, pursuant to [CC0](http://creativecommons.org/publicdomain/zero/1.0/).
