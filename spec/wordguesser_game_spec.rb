require 'spec_helper'
require 'wordguesser_game'

describe WordGuesserGame do
  # helper function: make several guesses
  def guess_several_letters(game, letters)
    letters.chars do |letter|
      game.guess(letter)
    end
  end

  describe 'new', pending: true do
    it "takes a parameter and returns a WordGuesserGame object" do
      @game = described_class.new('glorp')
      expect(@game).to be_an_instance_of(described_class)
      expect(@game.word).to eq('glorp')
      expect(@game.guesses).to eq('')
      expect(@game.wrong_guesses).to eq('')
    end
  end

  describe 'guessing', pending: true do
    context 'correctly' do
      before do
        @game = described_class.new('garply')
        @valid = @game.guess('a')
      end

      it 'changes correct guess list', pending: true do
        expect(@game.guesses).to eq('a')
        expect(@game.wrong_guesses).to eq('')
      end

      it 'returns true', pending: true do
        expect(@valid).not_to be false
      end
    end

    context 'incorrectly' do
      before do
        @game = described_class.new('garply')
        @valid = @game.guess('z')
      end

      it 'changes wrong guess list', pending: true do
        expect(@game.guesses).to eq('')
        expect(@game.wrong_guesses).to eq('z')
      end

      it 'returns true', pending: true do
        expect(@valid).not_to be false
      end
    end

    context 'same letter repeatedly' do
      before do
        @game = described_class.new('garply')
        guess_several_letters(@game, 'aq')
      end

      it 'does not change correct guess list', pending: true do
        @game.guess('a')
        expect(@game.guesses).to eq('a')
      end

      it 'does not change wrong guess list', pending: true do
        @game.guess('q')
        expect(@game.wrong_guesses).to eq('q')
      end

      it 'returns false', pending: true do
        expect(@game.guess('a')).to be false
        expect(@game.guess('q')).to be false
      end

      it 'is case insensitive', pending: true do
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

      it 'throws an error when empty', pending: true do
        expect { @game.guess('') }.to raise_error(ArgumentError)
      end

      it 'throws an error when not a letter', pending: true do
        expect { @game.guess('%') }.to raise_error(ArgumentError)
      end

      it 'throws an error when nil', pending: true do
        expect { @game.guess(nil) }.to raise_error(ArgumentError)
      end
    end
  end

  describe 'displayed word with guesses', pending: true do
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

    it 'is win when all letters guessed', pending: true do
      guess_several_letters(@game, 'ogd')
      expect(@game.check_win_or_lose).to eq(:win)
    end

    it 'is lose after 7 incorrect guesses', pending: true do
      guess_several_letters(@game, 'tuvwxyz')
      expect(@game.check_win_or_lose).to eq(:lose)
    end

    it 'continues play if neither win nor lose', pending: true do
      guess_several_letters(@game, 'do')
      expect(@game.check_win_or_lose).to eq(:play)
    end
  end
end
