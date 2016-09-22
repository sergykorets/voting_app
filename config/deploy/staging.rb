# Remote server configuration
server "annabelle.clockstar.cz", user: "www-data", roles: %w{app db web}

# The path on the remote server where the application should be deployed
set :deploy_to, "/var/data/staging/anuba-design/czepa.cz.hlasovani"

# Use "staging" environment
set :rails_env, "staging"

# Eye
set :eye_config, "./worker_staging.eye"