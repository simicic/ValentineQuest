require 'gosu'
require_relative 'heart'

class ValentineQuestMain < Gosu::Window
  WINDOW_HEIGHT = 1024
  WINDOW_WIDTH = 768

  def initialize
    super WINDOW_HEIGHT, WINDOW_WIDTH
    self.caption = "Valentine Quest"

    @background_image = Gosu::Image.new("assets/images/gradient.png", :tileable => false)
    @heart = Heart.new(100, 100)
  end

  def update
    @heart.update
  end

  def draw
    @background_image.draw(0, 0, 0)
    @heart.draw
  end
end

window = ValentineQuestMain.new
window.show
