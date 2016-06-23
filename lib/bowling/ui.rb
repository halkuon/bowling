require_relative 'game/bowling_game_interface'
require_relative 'player'

module Bowling
  class Interface
    def initialize
      @players = 0
      @frame = 1
    end

    def start_game!
      puts "How many players?"
      @players = gets
      @players_game = []
      @players.to_i.times do |i, _player|
        game_instance = Bowling::Game::Interface.new(i+1)
        @players_game << Bowling::Player.new(game_instance, i+1)
      end 
      start_bowling
    end

    private

    def start_bowling
      10.times do |frame|
        puts "Frame ##{@frame}"
        @players_game.each do |player|
          player.play_frame
          display_score(player)
        end
        @frame += 1
      end
      check_last_frame
    end

    def check_last_frame
      @players_game.each do |player|
        player.play_out_bonus
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
