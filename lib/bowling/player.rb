module Bowling
  # Player class that interacts with the bowling API
  class Player
    attr_reader :id
    def initialize(game, id)
      @game = game
      @id = id
    end

    def play_frame
      roll = player_roll
      if roll == 10
        @game.roll(10)
      else
        @game.roll(roll)
        @game.roll(player_roll)
      end
      @game.frame_played
    end

    def play_out_bonus
      if player_rolled_strike?
        puts 'final roll strike!'
        @game.roll(player_roll)
        @game.roll(player_roll)
      elsif player_rolled_spare?
        puts 'final roll spare!'
        @game.roll(player_roll)
      end
    end

    def player_rolled_strike?
      @game.frame_score(9) == 10 && @game.check_last_roll == 10
    end

    def player_rolled_spare?
      @game.frame_score(9) == 10 && @game.check_last_roll != 10
    end

    def player_roll
      puts "Enter roll player #{@id}:"
      roll = gets
      roll.to_i
    end

    def score
      @game.score
    end

    def frame_score
      @game.frame_score
    end
  end
end
