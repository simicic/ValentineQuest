class Player
  attr_reader :scores

  def initialize
    @scores = {:single => 0,
      :hetero => 0,
      :homo => 0,
      :poly => 0}
  end

  def add_to_score(type, delta)
    @scores[type] += delta
  end
end
