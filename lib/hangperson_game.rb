class HangpersonGame
  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()
  # end
  attr_accessor :word, :guesses, :wrong_guesses

  def initialize(word, guesses = '', wrong_guesses = '')
    @word = word
    @guesses = guesses
    @wrong_guesses = wrong_guesses
  end

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri, {}).body
  end

  def guess(character)
    raise ArgumentError unless character
    raise ArgumentError if character.empty?
    raise ArgumentError if character !~ /[a-zA-Z]/
    if character =~ /[a-z]/ && word.include?(character) && !guesses.include?(character) && character !~ /[A-Z]/
      guesses << character
      return true
    elsif character =~ /[a-z]/ && !word.include?(character) && !wrong_guesses.include?(character) && character !~ /[A-Z]/
      wrong_guesses << character
      return true
    end
    false
  end

  def word_with_guesses
    word.gsub!('-') if guesses.size.zero?
    word.each_char do |c|
      word.gsub!(c, '-') unless guesses.match(c)
    end
  end

  def check_win_or_lose
    if word_with_guesses !~ /(\-)+/
      :win
    elsif wrong_guesses.size >= 7
      :lose
    else
      :play
    end

  end
end
