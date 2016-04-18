require 'json'

module Kittens
  module Api
    BASE_DOMAIN = 'https://which-technical-exercise.herokuapp.com'
    BASE_URL = "#{BASE_DOMAIN}/api/#{ENV['EMAIL']}"

    class Base
      protected

      def self.get_data(endpoint)
        response = HTTParty.get "#{BASE_URL}#{endpoint}"
        raise Errors::InvalidApiResponse unless response.success?
        response.body
      end
    end
  end
end

require_relative 'api/forensics'
