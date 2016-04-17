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

  def delta_x
    X_DELTAS[@direction]
  end

  def delta_y
    Y_DELTAS[@direction]
  end

  private

  DIRECTIONS = %i(north east south west)
  X_DELTAS = [0, 1, 0, -1]
  Y_DELTAS = [1, 0, -1, 0]
  CLOCKWISE = 1
  ANTICLOCKWISE = -1

  def rotate(increment)
    @direction = (@direction + increment) % DIRECTIONS.length
    direction
  end

end
