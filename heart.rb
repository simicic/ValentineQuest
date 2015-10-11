class Heart
  def initialize(x, y)
    @image = Gosu::Image.new("assets/images/nested-hearts.png")
    @x = x
    @y = y
  end

  def draw
    @image.draw(@x, @y, 1, 0.2, 0.2)
  end
end
