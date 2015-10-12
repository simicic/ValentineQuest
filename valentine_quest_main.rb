require 'gosu'
require_relative 'heart'

class ValentineQuestMain < Gosu::Window
  WINDOW_WIDTH = 1024
  WINDOW_HEIGHT = 768

  def initialize
    super WINDOW_WIDTH, WINDOW_HEIGHT
    self.caption = "Valentine Quest"

    @background_image = Gosu::Image.new("assets/images/gradient.png", :tileable => false)
    @hearts = []
    @frames = 0
  end

  def update
    @frames += 1
    @hearts << Heart.new(rand(WINDOW_WIDTH), 0) if @frames % 15 == 0
    @hearts.map(&:update)
    @hearts.reject!{|heart| !heart.underscreen?}
  end

  def draw
    @background_image.draw(0, 0, 0)
    @hearts.map(&:draw)
  end
end

window = ValentineQuestMain.new
window.show
