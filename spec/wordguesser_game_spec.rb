require 'spec_helper'
require 'wordguesser_game'

describe WordGuesserGame do
  # helper function: make several guesses
  def guess_several_letters(game, letters)
    letters.chars do |letter|
      game.guess(letter)
    end
  end

  describe 'new' do
    it "takes a parameter and returns a WordGuesserGame object" do
      @game = described_class.new('glorp')
      expect(@game).to be_an_instance_of(described_class)
      expect(@game.word).to eq('glorp')
      expect(@game.guesses).to eq('')
      expect(@game.wrong_guesses).to eq('')
    end
  end

  describe 'guessing' do
    context 'correctly' do
      before do
        @game = described_class.new('garply')
        @valid = @game.guess('a')
      end

      it 'changes correct guess list' do
        expect(@game.guesses).to eq('a')
        expect(@game.wrong_guesses).to eq('')
      end

      it 'returns true' do
        expect(@valid).not_to be false
      end
    end

    context 'incorrectly' do
      before do
        @game = described_class.new('garply')
        @valid = @game.guess('z')
      end

      it 'changes wrong guess list' do
        expect(@game.guesses).to eq('')
        expect(@game.wrong_guesses).to eq('z')
      end

      it 'returns true' do
        expect(@valid).not_to be false
      end
    end

    context 'same letter repeatedly' do
      before do
        @game = described_class.new('garply')
        guess_several_letters(@game, 'aq')
      end

      it 'does not change correct guess list' do
        @game.guess('a')
        expect(@game.guesses).to eq('a')
      end

      it 'does not change wrong guess list' do
        @game.guess('q')
        expect(@game.wrong_guesses).to eq('q')
      end

      it 'returns false' do
        expect(@game.guess('a')).to be false
        expect(@game.guess('q')).to be false
      end

      it 'is case insensitive' do
        expect(@game.guess('A')).to be false
        expect(@game.guess('Q')).to be false
        expect(@game.guesses).not_to include('A')
        expect(@game.wrong_guesses).not_to include('Q')
      end
    end

    context 'invalid' do
      before do
        @game = described_class.new('foobar')
      end

      it 'throws an error when empty' do
        expect { @game.guess('') }.to raise_error(ArgumentError)
      end

      it 'throws an error when not a letter' do
        expect { @game.guess('%') }.to raise_error(ArgumentError)
      end

      it 'throws an error when nil' do
        expect { @game.guess(nil) }.to raise_error(ArgumentError)
      end
    end
  end

  describe 'displayed word with guesses' do
    before do
      @game = described_class.new('banana')
    end

    # for a given set of guesses, what should the word look like?
    @test_cases = {
      'bn' => 'b-n-n-',
      'def' => '------',
      'ban' => 'banana'
    }
    @test_cases.each_pair do |guesses, displayed|
      it "is '#{displayed}' when guesses are '#{guesses}'" do
        guess_several_letters(@game, guesses)
        expect(@game.word_with_guesses).to eq(displayed)
      end
    end
  end

  describe 'game status' do
    before do
      @game = described_class.new('dog')
    end

    it 'is win when all letters guessed' do
      guess_several_letters(@game, 'ogd')
      expect(@game.check_win_or_lose).to eq(:win)
    end

    it 'is lose after 7 incorrect guesses' do
      guess_several_letters(@game, 'tuvwxyz')
      expect(@game.check_win_or_lose).to eq(:lose)
    end

    it 'continues play if neither win nor lose' do
      guess_several_letters(@game, 'do')
      expect(@game.check_win_or_lose).to eq(:play)
    end
  end
end
