class WordGuesserGame
  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/wordguesser_game_spec.rb pass.

  # Get a word from remote "random word" service

  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
  end

  attr_accessor :word
  attr_accessor :guesses
  attr_accessor :wrong_guesses

  def guess(letter)
    raise ArgumentError if not (letter =~ /\A[A-Za-z]\z/)

    letter.downcase!

    if (@word.include? letter) and not (@guesses.include? letter)
      @guesses += letter
      return true
    elsif not (@word.include? letter) and not (@wrong_guesses.include? letter)
      @wrong_guesses += letter
      return true
    end
    return false
  end

  def word_with_guesses
    result = ''
    @word.each_char do |char|
      if @guesses.include? char
        result += char
      else
        result += '-'
      end
    end
    return result
  end

  def check_win_or_lose
    if @wrong_guesses.length == 7
      return :lose
    else
      result = true
      @word.each_char do |char|
        if result == true and @guesses.include? char
          result = true
        else
          result = false
        end
      end

      if result
        return :win
      else
        return :play
      end
    end
  end

  # You can test it by installing irb via $ gem install irb
  # and then running $ irb -I. -r app.rb
  # And then in the irb: irb(main):001:0> WordGuesserGame.get_random_word
  #  => "cooking"   <-- some random word
  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://randomword.saasbook.info/RandomWord')
    Net::HTTP.new('randomword.saasbook.info').start do |http|
      return http.post(uri, "").body
    end
  end
end
