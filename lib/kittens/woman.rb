module Kittens
  # Tracks position and orientation of witch when moving
  class Woman
    attr_accessor :x_position, :y_position

    def initialize(params = {})
      @compass = Compass.new
      @x_position = params.fetch(:x_position, 0)
      @y_position = params.fetch(:y_position, 0)
      self.direction = params.fetch(:direction, :north)
    end

    def direction
      @compass.direction
    end

    def direction=(direction)
      @compass.direction = direction
    end

    def left
      @compass.left
    end

    def right
      @compass.right
    end

    def forward
      @x_position += @compass.delta_x
      @y_position += @compass.delta_y
      self
    end
  end
end
