require_relative 'game/bowling_game'
require_relative 'game/bowling_game_interface'

module Player
  class Interface
    def initialize
      @players = 0
      @frame = 1
    end

    def start_game
      puts "How many players?"
      @players = gets
      @players_game = []
      @players.to_i.times do |i, _player|
        @players_game << Game::BowlingInterface.new(i+1)
      end 
      start_bowling
    end

    private

    def start_bowling
      10.times do |frame|
        puts "Frame ##{@frame}"
        @players_game.each do |player|
          roll = player_roll(player.id)
          if roll == 10
            player.roll(10)
          else
            player.roll(roll)
            player.roll(player_roll(player.player_id))
          end
          player.frame_played
          display_score(player)
        end
        @frame += 1
      end
      check_last_frame
    end

    def check_last_frame
      @players_game.each do |player|
        if player.frame_score(9) == 10 && player.check_last_roll == 10
          puts "final roll strike!"
          player.roll(player_roll(player.player_id))
          player.frame_played
          player.roll(player_roll(player.player_id))
          player.frame_played
        elsif player.frame_score(9) == 10 && player.check_last_roll != 10
          puts "final roll spare!"
          player.roll(player_roll(player.player_id))
          player.frame_played
        end
        display_score(player)
      end
      determine_winner
    end

    def determine_winner

    end

    def player_roll(id)
      puts "Enter roll player #{id}:"
      roll = gets
      roll.to_i
    end

    def display_score(player)
      puts "Total score player #{player.id}: #{player.score}"
    end
  end
end

# Player::Interface.new.start_game