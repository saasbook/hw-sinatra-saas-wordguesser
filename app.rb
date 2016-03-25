require 'sinatra/base'
require 'sinatra/flash'
require './lib/hangperson_game.rb'

class HangpersonApp < Sinatra::Base

  enable :sessions
  register Sinatra::Flash
  
  after do
    if @game != nil
      session[:word] = @game.word
      session[:guesses] = @game.guesses
      session[:wrong_guesses] = @game.wrong_guesses
    end
  end
  
  # These two routes are good examples of Sinatra syntax
  # to help you with the rest of the assignment
  get '/' do
    redirect '/new'
  end
  
  get '/new' do
    erb :new
  end
  
  post '/create' do
    # NOTE: don't change next line - it's needed by autograder!
    word = params[:word] || HangpersonGame.get_random_word
    # NOTE: don't change previous line - it's needed by autograder!
    
    @game = HangpersonGame.new(word)

    redirect '/show'
  end

  # Use existing methods in HangpersonGame to process a guess.
  # If a guess is repeated, set flash[:message] to "You have already used that letter."
  # If a guess is invalid, set flash[:message] to "Invalid guess."
  post '/guess' do
    retrieve_game_instance
    
    letter = params[:guess].to_s[0]
    if letter.nil? or letter == "" or letter =~ /[^a-z]/i 
      begin
        guessed = @game.guess(letter)
        rescue ArgumentError
          flash[:message] = "Invalid guess." 
      end
    end
    if letter =~ /[a-z]/i
      guessed = @game.guess(letter)
      if !guessed
        flash[:message] = "You have already used that letter."
      end
    end  
    redirect '/show'
  end
  
  # Everytime a guess is made, we should eventually end up at this route.
  # Use existing methods in HangpersonGame to check if player has
  # won, lost, or neither, and take the appropriate action.
  # Notice that the show.erb template expects to use the instance variables
  # wrong_guesses and word_with_guesses from @game.
  get '/show' do
    retrieve_game_instance
    
    state = @game.check_win_or_lose
    case state
    when :lose
      redirect '/lose'
    when :win
      redirect '/win'
    else
      erb :show #default :play
    end
  end
  
  get '/win' do
    retrieve_game_instance
    state = @game.check_win_or_lose
    case state
    when :win
      erb :win
    else
      redirect '/show'
    end  
  end
  
  get '/lose' do
    retrieve_game_instance
    state = @game.check_win_or_lose
    case state
    when :lose
      erb :lose
    else
      redirect '/show'
    end
  end

  def word_with_guesses(word, guesses)
    @game = HangpersonGame.new(word)
    @game.guesses = guesses
    
    return @game.word_with_guesses
  end

  def retrieve_game_instance
    word = session[:word].to_s
    @game = HangpersonGame.new(word)
    @game.guesses = session[:guesses].to_s
    @game.wrong_guesses = session[:wrong_guesses].to_s
  end
  
end
