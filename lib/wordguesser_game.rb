class WordGuesserGame
  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/wordguesser_game_spec.rb pass.

  # Get a word from remote "random word" service
  attr_accessor :word, :guesses, :wrong_guesses, :displayed
  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
    @displayed = '-' * word.length
  end

  def guess(letter)
    if letter.nil? or letter == '' or !letter.match?(/[a-zA-Z]/) == true
      raise ArgumentError
    end
    letter = letter.downcase
    if @word.include?(letter)
      if @guesses.include?(letter)
        return false
      end
      @guesses << letter
      @word.chars.each_with_index do |c, i|
        if c == letter
          @displayed[i] = c
        end
      end
      return true
    end
    if @wrong_guesses.include?(letter)
      return false
    end
    @wrong_guesses << letter
    return true
  end

  def word_with_guesses
    return @displayed
  end

  def check_win_or_lose
    if @displayed == @word
      return :win
    end
    if @wrong_guesses.length >= 7
      return :lose
    end
    return :play
  end

  # You can test it by installing irb via $ gem install irb
  # and then running $ irb -I. -r app.rb
  # And then in the irb: irb(main):001:0> WordGuesserGame.get_random_word
  #  => "cooking"   <-- some random word
  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('https://randomword.saasbook.info/RandomWord.txt')
    Net::HTTP.get(uri)
  end
end
