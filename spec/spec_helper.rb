require 'simplecov'
SimpleCov.start

ENV['EMAIL'] = 'foo@company.com'

require 'webmock/rspec'
require 'support/api_tests'
require 'kittens'
