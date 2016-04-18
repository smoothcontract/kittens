require 'json'

module Kittens
  # Shared code for API calls
  module Api
    BASE_DOMAIN = 'https://which-technical-exercise.herokuapp.com'
    BASE_URL = "#{BASE_DOMAIN}/api/#{ENV['EMAIL']}"

    # Base class implements standard error handling for API calls
    class Base
      def self.get_data(endpoint)
        response = HTTParty.get "#{BASE_URL}#{endpoint}"
        fail Errors::InvalidApiResponse unless response.success?
        response.body
      end
    end
  end
end

require_relative 'api/forensics'
require_relative 'api/location'
