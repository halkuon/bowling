require 'spec_helper'

describe Bowling::Game::Interface do
  let!(:bowling_game) { Bowling::Game::Interface.new }

  def roll_many(n,pins)
    (1..n).each do
      bowling_game.roll(pins)
    end
  end

  context 'test gutter game bowled' do
    before do
      n = 20
      pins = 0
      roll_many(n, pins)
      10.times { bowling_game.frame_played }
    end    

    it 'first test' do
      expect(bowling_game.class).to be(Bowling::Game::Interface)
      expect(bowling_game.score).to eq(0)
    end
  end

  context 'test all ones bowled' do
    before do
      n = 20
      pins = 1
      roll_many(n, pins)
      10.times { bowling_game.frame_played }
    end    

    it 'second test' do
      expect(bowling_game.class).to be(Bowling::Game::Interface)
      expect(bowling_game.score).to eq(20)
    end
  end

  context 'test one spare bowled' do
    it 'third test' do
      roll_spare
      bowling_game.roll(3)
      roll_many(17, 0)
      10.times { bowling_game.frame_played }
      expect(bowling_game.score).to eq(16)
    end
  end

  def roll_spare
    bowling_game.roll(5)
    bowling_game.roll(5)
  end

  def roll_strike
    bowling_game.roll(10)
  end

  context 'test one strike bowled' do
    it 'fourth test' do
      roll_strike
      bowling_game.frame_played
      bowling_game.roll(3)
      bowling_game.roll(4)
      bowling_game.frame_played
      roll_many(17, 0)
      7.times { bowling_game.frame_played }
      expect(bowling_game.score).to eq(24)
    end
  end

  context 'test perfect game' do
    it 'fifth test' do
      roll_many(12,10)
      10.times { bowling_game.frame_played }
      expect(bowling_game.score).to eq(300)
    end
  end

  context 'test run' do
    it 'test' do
      bowling_game.roll(10)
      bowling_game.frame_played
      bowling_game.roll(10)
      bowling_game.frame_played
      bowling_game.roll(4)
      bowling_game.roll(2)
      bowling_game.frame_played
      expect(bowling_game.score).to eq(46)
    end
  end
end
