require 'spec_helper'
describe Bowling::Player do
  class StubGame
    def roll(_n)
      10
    end

    def frame_score
      10
    end

    def frame_played
      0
    end

    def score
      100
    end

    def frame_score(_n)
      10
    end

    def total_frames_played
      5
    end

    def check_last_roll
      10
    end
  end

  let(:game) { StubGame.new }
  let(:player) { described_class.new(game, 1) }

  before do
    allow(player).to receive (:player_roll) { 10 }
  end

  describe '#total_frames_played' do
    it 'returns the number of frames played' do
      expect(player.total_frames_played).to eq(5)
    end
  end

  describe '#score' do
    it 'returns the total score' do
      expect(player.score).to eq(100)
    end
  end

  describe '#frame_score' do
    it 'returns the score for a specific frame' do
      expect(player.frame_score(1)).to eq(10)
    end
  end

  describe '#player_rolled_strike?' do
    it 'checks if the last roll was a strike' do
      expect(player.player_rolled_strike?).to be(true)
    end
  end

  describe '#player_rolled_spare?' do
    it 'checks if the last roll was a spare' do
      expect(player.player_rolled_spare?).to be(false)
    end
  end

  describe '#play_frame' do
    it 'plays the frame and calls roll for the player' do
      expect(game).to receive(:roll).once
      player.play_frame
    end
  end

  describe '#play_out_bonus' do
    it 'plays out the last frames and determines number of rolls' do
      expect(game).to receive(:roll).twice
      player.play_out_bonus
    end
  end
end
