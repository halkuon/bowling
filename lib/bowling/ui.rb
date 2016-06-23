require_relative 'game/bowling_game_interface'
require_relative 'player'

module Bowling
  # Game interface that the user can interact with
  class Interface
    def start_game!
      puts 'How many players?'
      players_count = gets
      determine_player_count(players_count)
      start_bowling
    end

    private

    def determine_player_count(players_count)
      @players_game = []
      players_count.to_i.times do |i, _player|
        game_instance = Bowling::Game::Interface.new(i + 1)
        @players_game << Bowling::Player.new(game_instance, i + 1)
      end
    end

    def start_bowling
      frame = 1
      10.times do
        puts "Frame ##{frame}"
        @players_game.each do |player|
          player.play_frame
          display_score(player)
        end
        frame += 1
      end
      check_last_frame
    end

    def check_last_frame
      final_scores = []
      @players_game.each do |player|
        player.play_out_bonus
        display_score(player)
      end
      determine_winner
    end

    def determine_winner
    
    end

    def display_score(player)
      puts "Frame scores:"
      player.score
      for i in 1..(player.total_frames_played)
        puts "frame #{i}: #{player.frame_score(i-1)}"
      end
      puts "Total score player #{player.id}: #{player.score}"
    end
  end
end
