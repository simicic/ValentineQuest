class Player
  attr_reader :score

  def initialize
    @score = 0
  end

  def add_to_score(delta)
    @score += delta
  end
end
