require 'spec_helper'

describe Bowling::Game::Internal do
  let(:rolls) { [10, 10, 4, 2] }
  let(:frames_played) { 3 }
  let(:current_roll)  { 4 }

  describe '#score' do
    let(:internal) { described_class.new(rolls: rolls, frames_played: frames_played, current_roll: current_roll) }
    subject { internal.score }

    it 'calculates the total score so far' do
      expect(subject).to eq(46)
    end
  end

  describe '#roll' do
    let(:internal) { described_class.new(rolls: rolls, frames_played: frames_played, current_roll: current_roll) }
    subject { internal.roll(10) }

    it 'calculates the current roll correctly' do
      expect(subject).to eq(5)
    end
  end

  describe '#frames_played' do
    subject { described_class.new(rolls: rolls, frames_played: frames_played, current_roll: current_roll) }

    it 'returns the number of frames played so far' do
      expect(subject.frames_played).to eq(frames_played)
    end
  end

  describe '#play_frame' do
    let(:internal) { described_class.new(rolls: rolls, frames_played: frames_played, current_roll: current_roll) }
    subject { internal.play_frame }

    it 'increases the number of frames played by 1' do
      subject
      expect(internal.frames_played).to eq(frames_played + 1)
    end
  end

  describe '#frame_score' do
    subject { described_class.new(rolls: rolls, frames_played: frames_played, current_roll: current_roll) }

    it 'calculates the correct core of specified frame' do
      subject.score
      expect(subject.frame_score(1)).to eq(16)
    end
  end
end
