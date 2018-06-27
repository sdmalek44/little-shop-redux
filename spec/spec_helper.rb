ENV["RACK_ENV"] ||= "test"
require 'bundler'
Bundler.require(:default, :test)

require File.expand_path("../../config/environment", __FILE__)
require 'rspec'
require 'capybara/dsl'

Capybara.app = LittleShopApp

DatabaseCleaner.strategy = :truncation

RSpec.configure do |c|
  c.include Capybara::DSL
  c.before(:all) do #cleans at beginning
    DatabaseCleaner.clean
  end
  c.after(:each) do
    DatabaseCleaner.clean #after each test cleans
  end
end
