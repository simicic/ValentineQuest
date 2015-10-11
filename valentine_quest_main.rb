require 'gosu'

class ValentineQuestMain < Gosu::Window
  def initialize
    super 1024, 768
    self.caption = "Valentine Quest"
  end

  def update
  end

  def draw
  end
end

window = ValentineQuestMain.new
window.show
