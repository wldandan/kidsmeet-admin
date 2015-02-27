ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara-screenshot/rspec'
require 'devise'
require 'sidekiq/testing'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

Dir.mkdir('tmp') unless File.directory?('tmp')

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!

  config.include FactoryGirl::Syntax::Methods
  config.include Devise::TestHelpers, type: :controller
  config.include Warden::Test::Helpers
  config.include FixtureLoaderHelper

  config.before (:each) do
    Sidekiq::Worker.clear_all
  end

  # config.before :suite do
  #   DatabaseRewinder.clean_all
  # end

  config.before(with_a_logged_user: true) do
    login_as(FactoryGirl.create(:user), scope: :user)
  end

  # config.after do
  #   DatabaseRewinder.clean
  # end
end

Sidekiq::Testing.fake!
