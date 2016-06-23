require 'pry'
class BowlingGame
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
        @frame_scores[x] = 10 + spare_bonus(frame_index)
        frame_index += 2
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

  def frame_score(frame)
    @frame_scores[frame]
  end

  def strike?(frame_index)
    @rolls[frame_index] == 10
  end

  def spare?(frame_index)
    @rolls[frame_index] + @rolls[frame_index + 1] == 10
  end

  def check_last_roll
    @rolls.last
  end

  private

  def strike_bonus(frame_index)
    @rolls[frame_index + 1] + @rolls[frame_index + 2]
  rescue
    0
  end

  def sum_of_balls_in_frame(frame_index)
    @rolls[frame_index] + @rolls[frame_index + 1]
  end

  def spare_bonus(frame_index)
    spare_value = @rolls[frame_index + 2]
    if spare_value == nil
      return 0
    else
      return spare_value
    end
  end
end
