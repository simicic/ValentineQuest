class Heart
  attr_reader :x, :y, :gender

  SPEED_SCALE = 0.3

  def initialize(x, y)
    @x = x
    @y = y
    @velocity_x = 0;
    @velocity_y = 10;
    @scale_x = 0.2
    @scale_y = 0.2
    @gender = ['f', 'm'].sample
    @image = image_based_on_gender
  end

  def draw
    @image.draw(@x, @y, 1, @scale_x, @scale_y)
  end

  def update
    @velocity_x = @velocity_x + rand(3) - 1;
    @velocity_y = @velocity_y + [1, 1, 1, 1, -1, -3, -2, -2, 2, 3].sample;
    @x = x + @velocity_x * SPEED_SCALE
    @y = y + @velocity_y * SPEED_SCALE
  end

  def underscreen?
    y < ValentineQuestMain::WINDOW_HEIGHT
  end

  def hit?(position_x, position_y)
    position_x >= x && position_x <= x + @image.width * @scale_x &&
      position_y >= y && position_y <= y + @image.height * @scale_y
  end

  private

  def image_based_on_gender
    Gosu::Image.new("assets/images/nested-hearts-#{gender}.png")
  end
end
