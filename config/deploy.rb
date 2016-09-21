# Config valid only for current version of Capistrano
lock "3.6.0"

# Application name
set :application, "czepa_hlasovani"

# Repository configuration
set :repo_url, "http://deploy:MCDsM3Qv@git.clockstar.cz/anuba-design/czepa.cz.hlasovani.git"

# Dirs which should not be updated from repository
set :linked_dirs, fetch(:linked_dirs, []).push("log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/fonts")

# Files which should not be updated from repository
set :linked_files, fetch(:linked_files, []).push("config/database.yml")

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Restart passenger with sudo
set :passenger_restart_with_sudo, true