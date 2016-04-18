module Kittens
  module Api
    # Location API call to submit search party coordinates
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
