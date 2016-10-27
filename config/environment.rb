# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
APP_CONFIG = YAML.load_file("#{Rails.root}/config/config.yml")
config.action_mailer.default_url_options = { :host => 'a17224.heroku.com' } #testing mailer with heroku
