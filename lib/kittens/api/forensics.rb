module Kittens
  module Api
    # Forensics API call to retrieve list of movements
    class Forensics < Base
      def self.directions
        response = get_data('/directions')
        JSON.parse(response)['directions']
      rescue
        raise Errors::InvalidApiResponse
      end
    end
  end
end
