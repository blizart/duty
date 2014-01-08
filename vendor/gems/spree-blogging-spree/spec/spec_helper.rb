require 'rubygems'
require 'spork'

Spork.prefork do

  # Configure Rails Environment
  ENV['RAILS_ENV'] ||= 'test'

  require File.expand_path("../dummy/config/environment", __FILE__)

  require 'rspec/rails'
  require 'ffaker'
  require 'database_cleaner'

  require 'spree/testing_support/factories'
  # require 'spree/testing_support/preferences'
  require 'spree/testing_support/controller_requests'
  require 'spree/testing_support/authorization_helpers'
  # require 'spree/testing_support/flash'
  require 'spree/testing_support/url_helpers'
  require 'spree/testing_support/capybara_ext'

  RSpec.configure do |config|
    config.include FactoryGirl::Syntax::Methods

    config.include Spree::TestingSupport::UrlHelpers

    config.mock_with :rspec

    config.use_transactional_fixtures = false

    config.before(:each) do
      if example.metadata[:js]
        DatabaseCleaner.strategy = :truncation, { :except => ['spree_countries', 'spree_zones', 'spree_zone_members', 'spree_states', 'spree_roles'] }
      else
        DatabaseCleaner.strategy = :transaction
      end
    end

    config.before(:each) do
      DatabaseCleaner.start
    end

    config.after(:each) do
      DatabaseCleaner.clean
    end

    config.filter_run :focus => true
    config.run_all_when_everything_filtered = true
  end

end

Spork.each_run do

  # TODO
  # FactoryGirl.reload
  
  # Dir[File.expand_path("../../lib/**/*.rb",  __FILE__)].each {|f| load f }
  Dir[File.expand_path("../../spec/support/**/*.rb",  __FILE__)].each {|f| load f }
  Dir[File.expand_path("../../app/**/*.rb",  __FILE__)].each {|f| load f }

  RSpec.configure do |config|
    config.include AuthenticationHelpers, :type => :request
  end

end
