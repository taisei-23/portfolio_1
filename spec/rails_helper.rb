# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'

# 初期環境はRAILS_ENV=developmentなので、テストはRAILS_ENV=test bundle exec rspecで実行すること

require_relative '../config/environment'

abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'rspec/rails'
require 'spec_helper'
require 'devise'
require 'webmock/rspec'

WebMock.disable_net_connect!(allow_localhost: true)

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end
RSpec.configure do |config|
  config.fixture_paths = [
    Rails.root.join('spec/fixtures')
  ]

  config.use_transactional_fixtures = true

  config.include Devise::Test::IntegrationHelpers, type: :request
  config.filter_rails_from_backtrace!

  config.include FactoryBot::Syntax::Methods

  config.before(:each, type: :request) do
    host! "www.example.com"
  end
end
