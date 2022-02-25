require 'pry'

class Triangle
  attr_accessor :l1, :l3, :l3, :equilateral

  def initialize(l1, l2, l3)
    @l1 = l1
    @l2 = l2
    @l3 = l3
  end

  def validate_triangle?
    valid_size = @l1 > 0 && @l2 > 0 && @l3 > 0
    triangle_inequality = @l1 + @l2 > @l3 && @l2 + @l3 > @l1 && @l3 + @l1 > @l2
    valid_size && triangle_inequality
  end


  def test_triangle
    raise TriangleError unless validate_triangle?
  end

  class TriangleError < StandardError
  end

  def kind
    self.test_triangle;
    if @l1 == @l2 && @l2 == @l3
      :equilateral
    elsif @l1 == @l2 || @l2 == @l3 || @l1 == @l3
      :isosceles
    else
      :scalene
    end
  end
end

# Triangle.new(0, 0, 0).kind
