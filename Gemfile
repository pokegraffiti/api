# frozen_string_literal: true
source 'https://rubygems.org'

gem 'rails', '~> 5.0.0'
gem 'puma', '~> 3.0'

# datastore
gem 'pg', '~> 0.18'

# javascript backend
gem 'jbuilder', '~> 2.5'

# extensions
gem 'rack-cors'

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
