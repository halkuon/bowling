module Bowling
  class Player
    attr_reader :id
    def initialize(player, id)
      @player = player
      @id = id
    end

    def play_frame
      roll = player_roll(@player.id)
      if roll == 10
        @player.roll(10)
      else
        @player.roll(roll)
        @player.roll(player_roll(@player.player_id))
      end
      @player.frame_played
    end

    def play_out_bonus(player)
      if player_rolled_strike?
        puts "final roll strike!"
        @player.roll(player_roll(@player.player_id))
        @player.frame_played
        @player.roll(player_roll(@player.player_id))
        @player.frame_played
      elsif player_rolled_spare?
        puts "final roll spare!"
        @player.roll(player_roll(@player.player_id))
        @player.frame_played
      end
    end

    def player_rolled_strike?
      @player.frame_score(9) == 10 && @player.check_last_roll == 10
    end

    def player_rolled_spare?
      @player.frame_score(9) == 10 && @player.check_last_roll != 10
    end

    def player_roll(id)
      puts "Enter roll player #{id}:"
      roll = gets
      roll.to_i
    end

    def score
      @player.score
    end

    def frame_score
      @player.frame_score
    end
  end
end
