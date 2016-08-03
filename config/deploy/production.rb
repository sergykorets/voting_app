# Remote server configuration
server 'bret.clockstar.cz', user: 'www-data', roles: %w{app db web}

# The path on the remote server where the application should be deployed
set :deploy_to, '/var/data/production/anuba-design/czepa.cz.hlasovani'

# Use "production" environment
set :rails_env, 'production'