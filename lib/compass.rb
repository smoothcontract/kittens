class Compass

  def initialize
    @direction = 0
  end

  def direction=(direction)
    @direction = DIRECTIONS.index(direction)
    self.direction
  rescue
    raise Errors::InvalidDirection
  end

  def direction
    DIRECTIONS[@direction]
  end

  def left
    rotate ANTICLOCKWISE
  end

  def right
    rotate CLOCKWISE
  end

  private

  DIRECTIONS = %i(north east south west)
  CLOCKWISE = 1
  ANTICLOCKWISE = -1

  def rotate(increment)
    @direction = (@direction + increment) % DIRECTIONS.length
    direction
  end

end
