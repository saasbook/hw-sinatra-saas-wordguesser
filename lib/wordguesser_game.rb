class WordGuesserGame
  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/wordguesser_game_spec.rb pass.

  # Get a word from remote "random word" service

  attr_accessor :word, :guesses, :wrong_guesses
  MAX_WRONG = 7

  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
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

  def guess(letter)
    raise ArgumentError if letter.nil? || letter.empty? || letter !~ /\A[a-zA-Z]\z/

    ltr = letter.downcase
    return false if @guesses.include?(ltr) || @wrong_guesses.include?(ltr)

    if @word.downcase.include?(ltr)
      @guesses << ltr
    else
      @wrong_guesses << ltr
    end
    true
  end

  def word_with_guesses
    @word.chars.map { |ch| @guesses.include?(ch.downcase) ? ch : '-' }.join
  end

  def check_win_or_lose
    return :win  if word_with_guesses == @word
    return :lose if @wrong_guesses.length >= MAX_WRONG
    :play
  end

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://randomword.saasbook.info/RandomWord')
    Net::HTTP.start(uri.host) { |http| http.post(uri.request_uri, '').body }
  end
end
