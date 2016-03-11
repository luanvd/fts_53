require "simplecov"
require "factory_girl_rails"
SimpleCov.start do
  add_group "Models", "app/models"
  add_group "Controllers", "app/controllers"
end
SimpleCov.coverage_dir "public/coverage"

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
