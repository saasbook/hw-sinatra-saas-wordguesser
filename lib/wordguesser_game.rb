class WordGuesserGame
  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/wordguesser_game_spec.rb pass.

  # Get a word from remote "random word" service

  attr_accessor :word, :guesses, :wrong_guesses

  def initialize(word)
    @word = word
    @guesses = ""
    @wrong_guesses = ""
    @count = 0
  end

  def guess(letter)
    raise ArgumentError, "Invalid guess: empty string" if letter.nil? || letter.empty?
    raise ArgumentError, "Invalid guess: not a letter" unless letter.match?(/[A-Za-z]/)

    letter.downcase!
    if @word.include?(letter)
      return false if @guesses.include?(letter)

      @guesses += letter
      @count += 1
      true

    else
      return false if wrong_guesses.include?(letter)

      @wrong_guesses += letter
      @count += 1
      true

    end
  end

  def word_with_guesses
    @word.gsub(/./) do |item|
      @guesses.include?(item) ? item : "-"
    end
  end

  def check_win_or_lose
    flag = @word.chars.all? do |c|
      @guesses.include?(c)
    end
    if @count <= 7 && flag
      :win
    elsif @count < 7 && !flag
      :play
    else
      :lose
    end
  end

  # You can test it by installing irb via $ gem install irb
  # and then running $ irb -I. -r app.rb
  # And then in the irb: irb(main):001:0> WordGuesserGame.get_random_word
  #  => "cooking"   <-- some random word
  def self.get_random_word
    require "uri"
    require "net/http"
    uri = URI("http://randomword.saasbook.info/RandomWord")
    Net::HTTP.new("randomword.saasbook.info").start do |http|
      return http.post(uri, "").body
    end
  end
end
