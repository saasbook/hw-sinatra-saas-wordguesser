class HangpersonGame

  attr_accessor :word, :guesses, :wrong_guesses

  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
    @count_wrong_guesses = 0
  end

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end

  def guess(letter)
    raise ArgumentError if letter.nil? or letter.empty? or letter =~ /[^a-zA-Z]/
    letter.downcase!
    return false if @guesses.include? letter
    if @word.downcase.include? letter
      @guesses += letter
      true
    else
      @wrong_guesses = letter
      @count_wrong_guesses += 1
      false
    end
  end

  def word_with_guesses
    @word.chars.map { |letter| @guesses.include?(letter) ? letter : '-' }.join
  end

  def check_win_or_lose
    return :win if @word == word_with_guesses
    return :lose if @count_wrong_guesses > 6
    :play
  end

end
