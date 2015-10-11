require 'gosu'

class ValentineQuestMain < Gosu::Window
  def initialize
    super 1024, 768
    self.caption = "Valentine Quest"

     @background_image = Gosu::Image.new("assets/images/gradient.png", :tileable => true)
  end

  def update
  end

  def draw
    @background_image.draw(0, 0, 0)
  end
end

window = ValentineQuestMain.new
window.show
