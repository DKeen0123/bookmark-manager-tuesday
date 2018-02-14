ENV['ENVIRONMENT'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app.rb')
require File.join(File.dirname(__FILE__), 'features', 'web_helpers.rb')
require 'capybara/rspec'
require 'pg'
require 'rake'

Capybara.app = BookmarkManager
# rake = Rake.application
# rake.init
# rake.load_rakefile
Rake.application.load_rakefile

RSpec.configure do |config|
  config.before(:each) do
    Rake::Task['test_database_setup'].execute
  end

  
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
