require_relative 'bowling_game'

class BowlingGameInterface
  attr_reader :id
  def initialize(id)
    @frameset = BowlingGame.new
    @id = id
  end

  def roll(pins)
    @frameset.roll(pins)
  end

  def score
    @frameset.score
  end

  def frame_score(frame)
    @frameset.frame_score(frame)
  end

  def frame_played
    @frameset.frame_played
  end

  def check_last_roll
    @frameset.check_last_roll
  end
end

