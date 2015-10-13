class Heart
  attr_reader :x, :y

  def initialize(x, y)
    @image = Gosu::Image.new("assets/images/nested-hearts.png")
    @x = x
    @y = y
    @velocity_x = 0;
    @velocity_y = 10;
    @scale_x = 0.2
    @scale_y = 0.2
  end

  def draw
    @image.draw(@x, @y, 1, @scale_x, @scale_y)
  end

  def update
    @velocity_x = @velocity_x + rand(3) - 1;
    @x = x + @velocity_x
    @y = y + @velocity_y
  end

  def underscreen?
    y < ValentineQuestMain::WINDOW_HEIGHT
  end

  def hit?(position_x, position_y)
    position_x >= x && position_x <= x + @image.width * @scale_x &&
      position_y >= y && position_y <= y + @image.height * @scale_y
  end
end
