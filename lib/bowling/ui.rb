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
        final_scores << player.score
      end
      determine_winner(final_scores)
    end

    def determine_winner(final_scores)
      index = final_scores.each_with_index.max[1]
      high_score = final_scores[index]
      player = index + 1
      @players_game.each { |f_score| display_score(f_score, true) }
      puts "The winner is player #{player}!! Highscore: #{high_score}"
    end

    def display_score(player, final = false)
      player.score
      unless final
        puts 'Frame scores:'
        for i in 1..player.total_frames_played
          puts "frame #{i}: #{player.frame_score(i - 1)}"
        end
      end
      puts "Total score player #{player.id}: #{player.score}"
    end
  end
end
