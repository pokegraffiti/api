# frozen_string_literal: true
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :webmock
  config.default_cassette_options = { record: :once }

  config.configure_rspec_metadata!
  # config.ignore_hosts 'codeclimate.com'

  config.filter_sensitive_data('STRIPE_PUBLISHABLE_KEY') { ENV['STRIPE_PUBLISHABLE_KEY'] }
  config.filter_sensitive_data('STRIPE_SECRET_KEY')      { ENV['STRIPE_SECRET_KEY'] }
end

RSpec.configure do |config|
  # Add VCR to all tests
  config.around(:each) do |example|
    options = example.metadata[:vcr] || {}

    if options[:record] == :skip
      VCR.turned_off(&example)
    else
      name = example
             .metadata[:full_description]
             .split(/\s+/, 2)
             .join('/')
             .underscore
             .strip
             .gsub(/[\.#]/, '/')
             .gsub(%r([^\w/]+), '_')
             .gsub(%(/$), '')
             .gsub('_/', '/')

      VCR.use_cassette(name, options, &example)
    end
  end
end
