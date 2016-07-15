# frozen_string_literal: true
source 'https://rubygems.org'

gem 'rails', '~> 5.0.0'
gem 'puma', '~> 3.0'

# datastore
gem 'pg', '~> 0.18'

# assets
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'font-awesome-sass', '~> 4.6.2'

# javascript frontend
gem 'jquery-rails'
gem 'turbolinks', '~> 5'

# javascript backend
gem 'jbuilder', '~> 2.5'

# extensions
gem 'rack-cors'
gem 'stripe'
gem 'high_voltage', '~> 3.0.0'

# error handing/reporting
gem 'airbrake', '~> 5.4'
gem 'newrelic_rpm'

group :development do
  gem 'listen'

  gem 'better_errors' # Setup/Usage https://github.com/charliesome/better_errors#security
  gem 'binding_of_caller'

  # gem 'letter_opener'
  gem 'rubocop'
end

group :test do
  gem 'faker'
  gem 'vcr'
  gem 'webmock'
  gem 'fuubar'

  gem 'simplecov', require: false
  # gem 'codeclimate-test-reporter', require: false
end

group :development, :test do
  gem 'dotenv-rails'

  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'factory_girl_rails'

  gem 'pry'
  gem 'pry-stack_explorer'
  gem 'pry-rescue'
  gem 'pry-byebug'
  gem 'awesome_print'
end

group :production, :staging do
  gem 'rails_12factor'
end
