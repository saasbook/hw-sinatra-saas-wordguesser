class WordGuesserGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/wordguesser_game_spec.rb pass.

  # Get a word from remote "random word" service

  def initialize(word)
    @word = word.gsub(' ', '').downcase
    @guesses = ''
    @wrong_guesses = ''
  end

  attr_accessor :word
  attr_accessor :guesses
  attr_accessor :wrong_guesses

  def guess(guess_letter)
	  if (!guess_letter or guess_letter.empty? or not ('a' .. 'z') === guess_letter.downcase)
		  raise ArgumentError
	  end
	  guess_letter = guess_letter.downcase
	  if word.include? guess_letter
		  if guesses.include? guess_letter
			  return false
		  else
			  @guesses = guesses + guess_letter
		  end
	  else
		  if wrong_guesses.include? guess_letter
			  return false
		  else
			  @wrong_guesses = wrong_guesses + guess_letter
		  end
	  end
	  return true
  end

  def word_with_guesses()
	displayed = "-" * @word.length
	guesses.each_char do | letter |
		(0..(@word.length - 1)).each do | index |
			if (@word[index] == letter)
				displayed[index] = letter
			end
		end
	end
	return displayed
  end

  def check_win_or_lose()
	  if (word_with_guesses.include? "-")
		  if (wrong_guesses.length >= 7)
			  return :lose
		  else
			  return :play
		  end
	  else
		  return :win
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
    Net::HTTP.new('randomword.saasbook.info').start { |http|
      return http.post(uri, "").body
    }
  end

end
