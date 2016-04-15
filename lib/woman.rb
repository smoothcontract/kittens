class Woman
  attr_accessor :x_position, :y_position, :direction

  def initialize
    self.x_position = 0
    self.y_position = 0
    self.direction = :north
  end

  def left
    self.direction = case direction
    when :north then :west
    when :west then :south
    when :south then :east
    when :east then :north
    else direction
    end
  end

end