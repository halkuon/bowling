class BowlingGame
  attr_reader :score

  def initialize
    @rolls = []
    @frame_scores = []
    @current_roll = 0
    @frames_played = 0
  end

  def roll(pins)
    @rolls[@current_roll] = pins
    @current_roll += 1
  end

  def score
    total_score = 0
    frame_index = 0
    
    for x in 0..(@frames_played - 1)
      if strike?(frame_index)
        @frame_scores[x] = 10 + strike_bonus(frame_index)
        frame_index += 1
      elsif spare?(frame_index)
        @frame_scores[x] = 10 += 2
      else
        @frame_scores[x] = sum_of_balls_in_frame(frame_index)
        frame_index += 2
      end
      total_score += @frame_scores[x]
    end

    total_score
  end

  def frame_played
    @frames_played += 1
  end

  private

  def strike?(frame_index)
    @rolls[frame_index] == 10
  end

  def strike_bonus(frame_index)
    @rolls[frame_index + 1] + @rolls[frame_index + 2]
  end

  def spare?(frame_index)
    return false if frame_index == @rolls.count
    @rolls[frame_index] + @rolls[frame_index + 1] == 10
  end

  def sum_of_balls_in_frame(frame_index)
    return @rolls[frame_index] if frame_index == @rolls.count
    @rolls[frame_index] + @rolls[frame_index + 1]
  end

  def spare_bonus(frame_index)
    @rolls[frame_index + 2]
  end
end
