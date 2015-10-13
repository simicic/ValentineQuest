require 'gosu'
require_relative 'heart'
require_relative 'player'

class ValentineQuestMain < Gosu::Window
  WINDOW_WIDTH = 1024
  WINDOW_HEIGHT = 768

  def initialize
    super WINDOW_WIDTH, WINDOW_HEIGHT
    self.caption = "Valentine Quest"

    @background_image = Gosu::Image.new("assets/images/gradient.png", tileable: false)
    @cursor_image = Gosu::Image.new("assets/images/cursor.png", tileable: false)
    @hit = Gosu::Sample.new('assets/sounds/boost1.wav')
    @hit_success = Gosu::Sample.new('assets/sounds/afterburn.wav')

    @score_text = Gosu::Font.new(64)

    @hearts = []
    @frames = 0

    @player = Player.new
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
    @cursor_image.draw(self.mouse_x, self.mouse_y, 2, 0.2, 0.2)
    @score_text.draw("#{@player.scores[:single]} forever alones", 10, 0*50+10, 2, 1.0, 1.0, 0xff_000000)
    @score_text.draw("#{@player.scores[:hetero]} hetero couples", 10, 1*50+10, 2, 1.0, 1.0, 0xff_000000)
    @score_text.draw("#{@player.scores[:homo]} homo couples",     10, 2*50+10, 2, 1.0, 1.0, 0xff_000000)
    @score_text.draw("#{@player.scores[:poly]} polyamourous",     10, 3*50+10, 2, 1.0, 1.0, 0xff_000000)
  end

  def button_down(id)
    if id == Gosu::MsLeft
      hit_hearts = @hearts.select{|heart| heart.hit?(self.mouse_x, self.mouse_y)}
      hearts_hit(hit_hearts)
    elsif id == Gosu::KbEscape
      close
    end
  end

  def hearts_hit(hit_hearts)
    add_score hit_hearts
    play_sound hit_hearts
    remove_hearts hit_hearts
  end

  def remove_hearts(hearts)
    @hearts -= hearts
  end

  def add_score(hearts)
    return if hearts.size == 0

    if hearts.size == 1
      type = :single
    elsif hearts.size == 2
      if hearts[0].gender == hearts[1].gender
        type = :homo
      else
        type = :hetero
      end
    else
      type = :poly
    end
    @player.add_to_score(type, 1)
  end

  def play_sound(hearts)
    hearts.empty? ? @hit.play : @hit_success.play
  end
end

window = ValentineQuestMain.new
window.show
