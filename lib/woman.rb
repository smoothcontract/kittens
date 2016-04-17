class Woman
  attr_accessor :x_position, :y_position

  def initialize
    @compass = Compass.new
    @x_position = 0
    @y_position = 0
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

end