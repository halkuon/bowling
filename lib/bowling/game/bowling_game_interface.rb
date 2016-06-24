require_relative 'bowling_game'

module Bowling
  module Game
    # Bowling game API
    class Interface
      attr_reader :id
      def initialize(id = 1)
        @frameset = Bowling::Game::Internal.new({})
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
        @frameset.play_frame
      end

      def check_last_roll
        @frameset.check_last_roll
      end

      def total_frames_played
        @frameset.frames_played
      end
    end
  end
end
