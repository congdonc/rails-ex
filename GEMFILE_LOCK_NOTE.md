# Gemfile.lock — Note

A `Gemfile.lock` is **not** committed in this repository because the lock file
must be generated on the target platform (Linux x86_64 or arm64) against
the exact PostgreSQL 16/17 client libraries.

## To generate Gemfile.lock

```bash
# Ensure you are on Ruby 3.4.7
ruby --version   # should print ruby 3.4.7

# Ensure Bundler 2.7.2
gem install bundler -v 2.7.2
bundler --version

# Install gems and generate lock file
bundle install

# Commit the generated lock file
git add Gemfile.lock
git commit -m "Add Gemfile.lock for OpenProject 17 / Ruby 3.4.7"
```

## Platform notes

If you develop on macOS and deploy to Linux, run:

```bash
bundle lock --add-platform x86_64-linux
bundle lock --add-platform aarch64-linux   # if deploying to ARM
```

This ensures native gems (like `pg`, `ffi`, `nokogiri`) resolve correctly
for both platforms and are committed in the lock file.

## OpenProject 17 gem version pins to verify after lock generation

| Gem | Expected version |
|---|---|
| `rails` | `8.0.2.x` |
| `puma` | `6.5.x` |
| `pg` | `1.5.x` |
| `redis` | `5.4.x` |
| `sprockets` | `3.7.x` |
| `importmap-rails` | `2.x` |
| `turbo-rails` | `2.x` |
