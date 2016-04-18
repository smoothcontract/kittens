module Kittens
  module Api
    class Location < Base
      def self.search(x, y)
        response = get_data("/location/#{x}/#{y}")
        JSON.parse(response)['message']
      rescue
        raise Errors::InvalidApiResponse
      end
    end
  end
end
