ENV['RAILS_ENV'] ||= 'test'

require File.expand_path("../../spec/dummy/config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/its'
require File.expand_path('../factories', __FILE__) unless defined?(FactoryGirl)
require 'shoulda-matchers'

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories.
Dir[Rails.root.join('../support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.include AuthenticatedTestHelper
  config.include ApiJsonParser

  config.infer_spec_type_from_file_location!

  config.mock_with :rspec do |mocks|
    mocks.verify_doubled_constant_names = true
    mocks.verify_partial_doubles = true
  end

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  # --seed 1234
  config.order = 'random'
end
