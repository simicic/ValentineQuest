class Heart
  attr_reader :x, :y

  def initialize(x, y)
    @image = Gosu::Image.new("assets/images/nested-hearts.png")
    @x = x
    @y = y
  end

  def draw
    @image.draw(@x, @y, 1, 0.2, 0.2)
  end

  def update
    if x < ValentineQuestMain::WINDOW_WIDTH && y < ValentineQuestMain::WINDOW_HEIGHT
      @x = x + rand(40) - 10
      @y = y + rand(30)
    end
  end
end
