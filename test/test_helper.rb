# frozen_string_literal: true

require 'simplecov'
SimpleCov.start 'rails' do
  add_filter 'app/channels'
  add_filter 'app/jobs'
  add_filter 'app/mailers'
end
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

module ActiveSupport
  class TestCase
    include FactoryBot::Syntax::Methods
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Add more helper methods to be used by all tests here...
  end
end
