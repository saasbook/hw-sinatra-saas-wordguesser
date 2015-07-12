require 'spec_helper'
require 'hangperson_game'

describe HangpersonGame do
  # helper function: make several guesses
  def guess_several_letters(game, letters)
    letters.chars do |letter|
      game.guess(letter)
    end
  end
  describe 'new', :pending => true do
    subject { HangpersonGame.new('glorp') }
    its(:word)    { should == 'glorp' }
    its(:guesses) { should == '' }
    its(:wrong_guesses) { should == '' }
  end
  describe 'guessing' do
    context 'correctly' do
      before :each do
        @game = HangpersonGame.new('garply')
        @valid = @game.guess('a')
      end
      it 'changes correct guess list', :pending => true do
        @game.guesses.should == 'a'
        @game.wrong_guesses.should == ''
      end
      it 'returns true', :pending => true do
        @valid.should_not be(false)
      end
    end
    context 'incorrectly' do
      before :each do
        @game = HangpersonGame.new('garply')
        @valid = @game.guess('z')
      end
      it 'changes wrong guess list', :pending => true do
        @game.guesses.should == ''
        @game.wrong_guesses.should == 'z'
      end
      it 'returns true', :pending => true do
        @valid.should_not be(false)
      end
    end
    context 'same letter repeatedly' do
      before :each do
        @game = HangpersonGame.new('garply')
        guess_several_letters(@game, 'aq')
      end
      it 'does not change correct guess list', :pending => true do
        @game.guess('a')
        @game.guesses.should == 'a'
      end
      it 'does not change wrong guess list', :pending => true do
        @game.guess('q')
        @game.wrong_guesses.should == 'q'
      end
      it 'returns false', :pending => true do
        @game.guess('a').should be(false)
        @game.guess('q').should be(false)
      end
    end
    context 'invalid' do
      before :each do
        @game = HangpersonGame.new('foobar')
      end
      it 'throws an error when empty', :pending => true do
        expect { @game.guess('') }.to raise_error(ArgumentError)
      end
      it 'throws an error when not a letter', :pending => true do
        expect { @game.guess('%') }.to raise_error(ArgumentError)
      end
      it 'throws an error when nil', :pending => true do
        expect { @game.guess(nil) }.to raise_error(ArgumentError)
      end
    end
  end
  describe 'displayed word with guesses', :pending => true do
    before :each do
      @game = HangpersonGame.new('banana')
    end
    # for a given set of guesses, what should the word look like?
    @test_cases = {
      'bn' =>  'b-n-n-',
      'def' => '------',
      'ban' => 'banana'
    }
    @test_cases.each_pair do |guesses, displayed|
      it "should be '#{displayed}' when guesses are '#{guesses}'" do
        guess_several_letters(@game, guesses)
        @game.word_with_guesses.should == displayed
      end
    end
  end
  describe 'game status' do
    before :each do 
      @game = HangpersonGame.new('dog')
    end
    it 'should be win when all letters guessed', :pending => true do
      guess_several_letters(@game, 'ogd')
      @game.check_win_or_lose.should == :win
    end
    it 'should be lose after 7 incorrect guesses', :pending => true do
      guess_several_letters(@game, 'tuvwxyz')
      @game.check_win_or_lose.should == :lose
    end
    it 'should continue play if neither win nor lose', :pending => true do
      guess_several_letters(@game, 'do')
      @game.check_win_or_lose.should == :play
    end
  end
end

    
    
    
