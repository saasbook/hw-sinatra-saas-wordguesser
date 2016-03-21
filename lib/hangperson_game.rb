class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

   #def initialize()
   #end

  letter = "a"
  
  attr_accessor :guesses
  attr_accessor :word
  attr_accessor :wrong_guesses
  
  
  
  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
    @tries = ''
  end

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end
  
  def guess(letter)
    
    if letter.nil?
      return 0
    else  
      if(letter != /[a-z]/i)
        return letter
      end  
    end
    
  end
  
  def guesses()
    if letter.nil?
      return 0
    else  
      if(letter != /[a-z]/i)
        return letter
      end  
    end
    
  end
  
  def wrong_guesses(letter)
  end
end
