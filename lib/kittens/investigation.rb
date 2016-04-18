module Kittens
  # Top level class to coordinate logic and API calls
  class Investigation
    def initialize
      @woman = Woman.new
    end

    def conduct!
      puts 'Conducting investigation into the lost kitten case...'
      gather_forensics
      follow_directions
      send_out_search_party

      @woman
    end

    private

    def gather_forensics
      puts 'Gathering forensic data...'
      @directions = Api::Forensics.directions
    end

    def follow_directions
      puts 'Tracing route using gathered forensic data...'
      @directions.each { |direction| @woman.move(direction) }
      position = "x: #{@woman.x_position}, y: #{@woman.y_position}"
      puts "Looks like the kittens were last spotted at #{position}"
    end

    def send_out_search_party
      puts 'Sending out search party...'
      puts Api::Location.search(@woman.x_position, @woman.y_position)
    end
  end
end
