ENV['RAILS_ENV'] ||= 'test'
require 'simplecov'
SimpleCov.start 'rails'

require File.expand_path('../../config/environment', __FILE__)
require 'factory_girl_rails'
require 'rails/test_help'
require 'minitest/rails'
require 'minitest/rails/capybara'
require 'minitest/fail_fast'
require 'database_cleaner'
require 'support/database_cleaner'

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
end
