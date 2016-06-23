require_relative 'frameset/frameset'
require_relative 'frameset/frameset_calculator'

module Game
  class PlayerInterface
    def initialize
      @frameset = Frameset::Frameset.new
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
  end
end
