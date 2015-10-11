require 'gosu'
require_relative 'heart'

class ValentineQuestMain < Gosu::Window
  def initialize
    super 1024, 768
    self.caption = "Valentine Quest"

     @background_image = Gosu::Image.new("assets/images/gradient.png", :tileable => false)
     @heart = Heart.new(100, 100)
  end

  def update
  end

  def draw
    @background_image.draw(0, 0, 0)
    @heart.draw
  end
end

window = ValentineQuestMain.new
window.show
