# Load DSL and set up stages
require "capistrano/setup"

# Include default deployment tasks
require "capistrano/deploy"

# Include Rails specific tasks
require "capistrano/bundler"
require "capistrano/rails/assets"
require "capistrano/rails/migrations"

# Include Passenger specific tasks
require "capistrano/passenger"

# Include Eye specific tasks
require "capistrano/eye"

# Include Rug specific tasks
require "capistrano/rug"

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }

