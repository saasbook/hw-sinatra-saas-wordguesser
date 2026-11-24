class WordGuesserGame
  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/wordguesser_game_spec.rb pass.
  attr_accessor :word, :guesses, :wrong_guesses
  # Get a word from remote "random word" service

  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
  end

  def word_with_guesses #display
    displayed = ''

    @word.each_char do |letter|
      if @guesses.include?(letter)
        displayed += letter
      else
        displayed += '-'
      end 
    end
    displayed
  end

  def guess(letter)

    if letter.nil? || letter.length != 1 || letter !~ /\A[a-zA-Z]\z/
      raise ArgumentError
    end

    letter = letter.downcase
    if @guesses.include?(letter) || @wrong_guesses.include?(letter)
      return false
    
    # update @guesses and @wrong_guesses 
    elsif @word.include?(letter)
      @guesses += letter
      return true 
    else
      @wrong_guesses += letter
    end
  end

  def check_win_or_lose
    if word_with_guesses == @word
      return :win
    elsif @wrong_guesses.length >= 7
      return :lose
    else
      return :play
    end
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
