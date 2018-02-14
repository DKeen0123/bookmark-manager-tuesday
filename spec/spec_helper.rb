 ENV['ENVIRONMENT'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app.rb')
require File.join(File.dirname(__FILE__), 'features', 'web_helpers.rb')
require 'capybara/rspec'
require 'pg'

Capybara.app = BookmarkManager

RSpec.configure do |config|
  config.before(:each) do
    require_relative './test_database_setup.rb'
    #use load if you need to redo table before every test.
  end
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
